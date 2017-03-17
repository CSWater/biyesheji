/*
 * =====================================================================================
 *
 *       Filename:  inner.c
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  03/11/2017 02:43:42 PM
 *       Revision:  none
 *       Compiler:  gcc v4.9.4
 *
 *         Author:  WHUCSWater
			Email:	shuichaoyang@ncic.ac.cn
 *   Organization:  NCIC
 *
 * =====================================================================================
 */
#include"../include/kernel.h"

void forward_kernel(const float * __restrict I, const float * __restrict F, float * __restrict O, float * __restrict I_pack, float * __restrict F_pack, size_t rc, size_t ic,
  size_t n, size_t r, size_t s, size_t c, size_t ip, size_t iq, size_t str_h, size_t str_w,
  size_t pad_h, size_t pad_w, size_t H, size_t W, size_t P, size_t Q, size_t K, size_t R, size_t S, size_t C){
  //float I_pack[PQBLOCK * CBLOCK];
  //float F_pack[CBLOCK * KREG * VEC_LEN];
  __m512 Ovec[PQREG][KREG];
  __m512 Fvec[KREG];
  __m512 Ivec;
  #include"./vector/qblock_pack-inl.h"
  for(size_t k = 0; k < K; k += KBLOCK) {
    size_t ik = k;
    #include"./vector/kblock_pack-inl.h" 
    for(size_t bpq = 0; bpq < PQBLOCK; bpq += PQREG) {
      #pragma unroll
      for(size_t rpq = 0; rpq < PQREG; ++rpq) {
        for(size_t rk = 0; rk < KREG; ++rk) {
          Ovec[rpq][rk] = _mm512_set1_ps(0);
        }
      }
      for(size_t bc = 0; bc < CBLOCK; ++bc) {
        #pragma unroll
        for (size_t rk = 0; rk < KREG; ++rk) {
          Fvec[rk] = _mm512_load_ps((F_pack + bc * KBLOCK + rk * VEC_LEN));
          //Fvec[rk] = _mm512_load_ps(ADDRESS_FILTER_RSCK(r, s, (ic + bc), ik + rk * VEC_LEN));
        }
       float *I_iter1, *I_iter2, *I_iter3;
       I_iter1 = (float *)(I_pack + bpq * CBLOCK + bc);
       I_iter2 = (float *)(I_iter1 + 2 * CBLOCK);
       I_iter3 = (float *)(I_iter1 + 4 * CBLOCK);
       {
          Ivec = _mm512_set1_ps(*I_iter1);
          #pragma unroll
          for (size_t rk = 0; rk < KREG; ++rk) {
            Ovec[0][rk] = _mm512_fmadd_ps(Ivec, Fvec[rk], Ovec[0][rk]);
          }
          Ivec = _mm512_set1_ps(*(I_iter1 + CBLOCK));
          #pragma unroll
          for (size_t rk = 0; rk < KREG; ++rk) {
            Ovec[1][rk] = _mm512_fmadd_ps(Ivec, Fvec[rk], Ovec[1][rk]);
          }
          Ivec = _mm512_set1_ps(*(I_iter2));
          #pragma unroll
          for (size_t rk = 0; rk < KREG; ++rk) {
            Ovec[2][rk] = _mm512_fmadd_ps(Ivec, Fvec[rk], Ovec[2][rk]);
          }
          Ivec = _mm512_set1_ps(*(I_iter2 + CBLOCK));
          #pragma unroll
          for (size_t rk = 0; rk < KREG; ++rk) {
            Ovec[3][rk] = _mm512_fmadd_ps(Ivec, Fvec[rk], Ovec[3][rk]);
          }
          Ivec = _mm512_set1_ps(*(I_iter3));
          #pragma unroll
          for (size_t rk = 0; rk < KREG; ++rk) {
            Ovec[4][rk] = _mm512_fmadd_ps(Ivec, Fvec[rk], Ovec[4][rk]);
          }
          Ivec = _mm512_set1_ps(*(I_iter3 + CBLOCK));
          #pragma unroll
          for (size_t rk = 0; rk < KREG; ++rk) {
            Ovec[5][rk] = _mm512_fmadd_ps(Ivec, Fvec[rk], Ovec[5][rk]);
          }
       }
       // for (size_t rpq = 0; rpq < PQREG; ++rpq) {
       //   Ivec = _mm512_set1_ps(*(I_pack +(bpq + rpq) * CBLOCK + bc));
       //   #pragma unroll
       //   for (size_t rk = 0; rk < KREG; ++rk) {
       //     Ovec[rpq][rk] = _mm512_fmadd_ps(Ivec, Fvec[rk], Ovec[rpq][rk]);
       //   }
       // }
      }
      aq = (iq + bpq) % Q;
      ap = ip + (iq + bpq) / Q;
      for (size_t rpq = 0; rpq < PQREG; ++rpq) {
        if(ap >= P) {
          break;
        }
        #pragma unroll
        for (size_t rk = 0; rk < KREG; ++rk) {
          _mm512_store_ps(ADDRESS_OUTPUT_NPQK(n, ap, aq, (ik + rk * VEC_LEN)),
            _mm512_add_ps(_mm512_load_ps(ADDRESS_OUTPUT_NPQK(n, ap, aq, (ik + rk * VEC_LEN))), Ovec[rpq][rk]));
        }
        aq += 1;
        if(aq >= Q) {
          ap += 1;
          aq = 0;
        }
      }
      if (ap >= P) {
        break;
      }
    }
  }
}
