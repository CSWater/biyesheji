#include"../include/blitz_forward.h"
#include"../include/blitz_macro.h"
#include"../include/cnn.h"
#include<iostream>
#include<string.h>
using std::endl;
using std::cout;

void ConvolutionForwardVectorImplNew(
  const float* I,
  const float* F,
  float* O,
  size_t N,
  size_t C, size_t H, size_t W,
  size_t R, size_t S,
  size_t K, size_t P, size_t Q,
  size_t pad_h, size_t pad_w,
  size_t str_h, size_t str_w) {
  if (K % (KREG * VEC_LEN)) {
    cout  << "Not supported K, please set it as a multiple of: " << VEC_LEN * KREG << endl;
  }
  //aligned for icc
  __declspec(align(64)) float I_pack[CBLOCK * PQBLOCK];
  __declspec(align(64)) float F_pack[CBLOCK * KBLOCK];
  //aligned for gcc
  // float I_pack[CBLOCK * PQBLOCK] __attribute__ ((aligned(64)));
  // float F_pack[CBLOCK * KBLOCK] __attribute__ ((aligned(64)));


#pragma omp parallel for private(I_pack, F_pack)
  for (size_t n = 0; n < N; ++n) {
    size_t ip, iq, ic, rc;
    size_t pq, r, s, c;
    //typical error, will do one more loop than wanted: for (pq = 0; pq < P * Q ; pq += PQBLOCK) {
    for (pq = 0; pq < P * Q / PQBLOCK * PQBLOCK ; pq += PQBLOCK) {
      //@TODO to make it a flat array
      ip = pq / Q;
      iq = pq % Q;
      for (r = 0; r < R; ++r) {
        for (s = 0; s < S; ++s) {
          for (c = 0; c < C; c += CBLOCK) {
            float *F_ptr = F_pack, *I_ptr = I_pack;
            float *O_ptr = NULL, *O_start = NULL;
            //@TODO input address
            //input pack resides  in main memory
            int ih = static_cast<int>(ip * str_h) + static_cast<int>(r);
            int iw = static_cast<int>(iq * str_w) + static_cast<int>(s);
            const float *I_start = &ACCESS_INPUT_NHWC(n, ih, iw, 0);
            pack_pq(I_start, I_pack, PQBLOCK);
            //filter pack resides in L2 cache
            const float *k_start = &ACCESS_FILTER_RSCK(r, s, c, 0);
            pack_k(k_start, F_pack);
            //@TODO caculate the output block address
            O_start = &ACCESS_OUTPUT_NPQK(n, ip, iq, 0);
            //Nr * Mr : PQREG * KREG
            //Mr = KREG * VEC_LEN, need KREG registers
            for(size_t k = 0; k < K; k += KREG * VEC_LEN) {
              O_ptr = O_start + k;
              //Nr = PQREG, need PQREG registers
              for(size_t bpq = 0; bpq < PQBLOCK; bpq += PQREG) {
                F_ptr = F_pack + k * CBLOCK;
                micro_kernel_4_6(I_ptr, F_ptr, O_ptr, CBLOCK, KBLOCK);
                //@TODO
                O_ptr = O_ptr + PQREG * KBLOCK;
              }
            }
          }
          //@TODO: C remainder
        }
      }
    }
    ip = (P * Q / PQBLOCK) * PQBLOCK / Q;  // p remainder
    iq = (P * Q / PQBLOCK) * PQBLOCK % Q;  // q remainder
    int q_size = static_cast<int>(P) * static_cast<int>(Q) % PQBLOCK;
    int q_remainder = q_size % PQREG;
    for (r = 0; r < R; ++r) {
      for (s = 0; s < S; ++s) {
        for (c = 0; c < C; c += CBLOCK) {
          //@TODO
          float *F_ptr = F_pack, *I_ptr = I_pack;
          float *O_ptr = NULL, *O_start = NULL;
          //@TODO input pack
          int ih = static_cast<int>(ip * str_h) + static_cast<int>(r);
          int iw = static_cast<int>(iq * str_w) + static_cast<int>(s);
          const float *I_start = &ACCESS_INPUT_NHWC(n, ih, iw, 0);
          pack_pq(I_start, I_pack, q_size);
          //filter pack resides in L2 cache
          const float *k_start = &ACCESS_FILTER_RSCK(r, s, c, 0);
          pack_k(k_start, F_pack);
          O_start = &ACCESS_OUTPUT_NPQK(n, ip, iq, 0);
          for(size_t k = 0; k < K; k += KREG * VEC_LEN) {
            O_ptr = O_start + k;
            F_ptr = F_pack + k * CBLOCK;
            //typical error, will do one more loop than wanted: for(size_t bpq = 0; bpq < q_size / PQREG; ++bpq) {
            for(size_t bpq = 0; bpq < q_size / PQREG; ++bpq) {
              micro_kernel_4_6(I_ptr, F_ptr, O_ptr, CBLOCK, KBLOCK);
              O_ptr = O_ptr + PQREG * KBLOCK;
            }
            //deal with q remainder
            {
              __m512 Ovec[PQREG][KREG];
              __m512 Fvec[KREG];
              __m512 Ivec;
              __m512 Ovec0, Ovec1, Ovec2, Ovec3;
              for(size_t i = 0; i < q_remainder; ++i) {
                for(size_t j = 0; j < KREG; ++j) {
                  Ovec[i][j] = _mm512_set1_ps(0);
                }
              }
              for(size_t i = 0; i < CBLOCK; ++i) {
                  Fvec[0] = _mm512_load_ps(F_ptr + i * 64);
                  Fvec[1] = _mm512_load_ps(F_ptr + i * 64 + 16);
                  Fvec[2] = _mm512_load_ps(F_ptr + i * 64 + 32);
                  Fvec[3] = _mm512_load_ps(F_ptr + i * 64 + 48);
                #pragma unroll
                for(size_t j = 0; j < q_remainder; ++j) {
                  Ivec = _mm512_set1_ps(*I_ptr);
                  Ovec[j][0] = _mm512_fmadd_ps(Ivec, Fvec[0], Ovec[j][0]);
                  Ovec[j][1] = _mm512_fmadd_ps(Ivec, Fvec[1], Ovec[j][1]);
                  Ovec[j][2] = _mm512_fmadd_ps(Ivec, Fvec[2], Ovec[j][2]);
                  Ovec[j][3] = _mm512_fmadd_ps(Ivec, Fvec[3], Ovec[j][3]);
                }
              }
              //store
              for(size_t i = 0; i < q_remainder; ++i) {
                Ovec0 = _mm512_load_ps(O_ptr);
                Ovec1 = _mm512_load_ps(O_ptr + 16);
                Ovec2 = _mm512_load_ps(O_ptr + 32);
                Ovec3 = _mm512_load_ps(O_ptr + 48);
                _mm512_add_ps(Ovec0, Ovec[i][0]);
                _mm512_add_ps(Ovec1, Ovec[i][1]);
                _mm512_add_ps(Ovec2, Ovec[i][2]);
                _mm512_add_ps(Ovec3, Ovec[i][3]);
                _mm512_store_ps(O_ptr, Ovec[i][0]);
                _mm512_store_ps(O_ptr + 16, Ovec[i][1]);
                _mm512_store_ps(O_ptr + 32, Ovec[i][2]);
                _mm512_store_ps(O_ptr + 48, Ovec[i][3]);
                O_ptr = O_ptr + KBLOCK;
              }

            }
          }
        }
        //@TODO C remainder
      }
    }
  }
}

