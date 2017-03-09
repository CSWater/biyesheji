/*
 * =====================================================================================
 *
 *       Filename:  forward.cpp
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  02/24/2017 03:09:48 PM
 *       Revision:  none
 *       Compiler:  gcc v4.9.4
 *
 *         Author:  WHUCSWater
			Email:	shuichaoyang@ncic.ac.cn
 *   Organization:  NCIC
 *
 * =====================================================================================
 */

#include"blitz_forward.h"
#include"blitz_macro.h"
#include<iostream>
using std::endl;
using std::cout;

#define ACCESS_INPUT_NHWC(i, j, k, v) *(I + ((i * H + j) * W + k) * C + v)
#define ACCESS_OUTPUT_NPQK(i, j, k, v) *(O + ((i * P + j) * Q + k) * K + v)
#define ACCESS_FILTER_RSCK(i, j, k, v) *(F + ((i * S + j) * C + k) * K + v)

//void blitz_forward(size_t N, size_t H, size_t W, size_t C, 
//  size_t K, size_t R, size_t S, size_t P, size_t Q, size_t str_h,
//  size_t str_w, size_t pad_h, size_t pad_w,
//  float *input, float *output, float *filter) {
// 
//  /*  loop counters */
//  size_t n, k, c, q, p, ih, iw, s, r;
//#if defined(_OPENMP)
//# pragma omp parallel for collapse(2) private(n, k, c, p, q, ih, iw, s, r)
//#endif
//  for(n = 0; n < N; ++n) {
//    for(p = 0; p < P; ++p) {
//      ih = p * str_h - pad_h;
//      for(q = 0; q < Q; ++q) {
//        iw = q * str_w - pad_w;
//        for(c = 0; c < C; ++c) {
//          for(r = 0; r < R; ++r) {
//            for(s = 0; s < S; ++s) {
//              for(k = 0; k < K; k += 16) {
//                #pragma unroll
//                for(int i = 0; i < 16; ++i) {
//                  ACCESS(output, n, p, q, k + i, P, Q, K) += 
//                    ACCESS(input, n, ih + r, iw + s, c, H, W, C) *
//                    ACCESS(filter, r, s, c, k + i, S, C, K);
//                }
//              }
//            }
//          }
//        }
//      }
//    }
//  }
//}


void ConvolutionForwardVectorImpl(
  const float* I,
  const float* F,
  float* O,
  size_t N,
  size_t C, size_t H, size_t W,
  size_t R, size_t S,
  size_t K, size_t P, size_t Q,
  size_t pad_h, size_t pad_w,
  size_t str_h, size_t str_w) {
  #define ACCESS_INPUT_NHWC(i, j, k, v) *(I + ((i * H + j) * W + k) * C + v)
  #define ACCESS_OUTPUT_NPQK(i, j, k, v) *(O + ((i * P + j) * Q + k) * K + v)
  #define ACCESS_FILTER_RSCK(i, j, k, v) *(F + ((i * S + j) * C + k) * K + v)
  
  #define ADDRESS_OUTPUT_NPQK(i, j, k, v) (O + ((i * P + j) * Q + k) * K + v)
  #define ADDRESS_FILTER_RSCK(i, j, k, v) (F + ((i * S + j) * C + k) * K + v)

  #define CBLOCK 64
  #define VEC_LEN 16
  #define PQBLOCK 72 // divided by PQREG
  //#define PQREG 6
  //#define KREG 4
  #define PQREG 6
  #define KREG 4
  __m512 Ovec[PQREG][KREG];
  __m512 Fvec[KREG];
  __m512 Ivec;
#ifdef TIME_ANALYSE
  unsigned int cycles_low, cycles_high, cycles_low1,cycles_high1;
  unsigned long long start, end;
  double ptime_cost = 1.0, ftime_cost = 0.0, stime_cost = 0.0, ztime_cost = 0.0, ktime_cost = 0.0;
#endif
  if (K % (KREG * VEC_LEN)) {
    cout  << "Not supported K, please set it as a multiple of: " << VEC_LEN * KREG << endl;
  }
  float I_pack[PQBLOCK * CBLOCK];
  float F_pack[CBLOCK * KREG * VEC_LEN];
  //float F_pack[CBLOCK * 192];
#pragma omp parallel for private(I_pack, F_pack, Ovec, Fvec, Ivec)
  for (size_t n = 0; n < N; ++n) {
    for (size_t pq = 0; pq < P * Q / PQBLOCK; ++pq) {
      size_t ip = (pq * PQBLOCK) / Q;
      size_t iq = (pq * PQBLOCK) % Q;
      #include "vector/convolution_forward_qblock_avx512-inl.h"
    }
    size_t ip = (P * Q / PQBLOCK) * PQBLOCK / Q;  // p remainder
    size_t iq = (P * Q / PQBLOCK) * PQBLOCK % Q;  // q remainder
    #include "vector/convolution_forward_qblock_avx512-inl.h"
  }
#ifdef TIME_ANALYSE
  cout << "ptime_cost:" << ptime_cost << " ktime_cost:" << ktime_cost << " ftime_cost:"\
    << ftime_cost << " stime_cost:" << stime_cost << endl;
  cout << "ptime rate:" << ptime_cost / (ptime_cost + ftime_cost + stime_cost + ktime_cost) <<  endl;
  cout << "ktime rate:" << ktime_cost / (ptime_cost + ftime_cost + stime_cost + ktime_cost) <<  endl;
  cout << "ftime rate:" << ftime_cost / (ptime_cost + ftime_cost + stime_cost + ktime_cost) <<  endl;
  cout << "stime rate:" << stime_cost / (ptime_cost + ftime_cost + stime_cost + ktime_cost) <<  endl;
#endif
}

/*
 * vector vwt, vout[RB_SIZE]
 * for ofm = 0.... OFM/SIMD-1
 *   for ifm = 0...IFM/SIMD_WIDTH-1
 *     for ib = 0...SIMD_WIDTH-1
 *       for ofh=0...OFH-1
 *         for ofw = 0... OFW/RB_SIZE-1
 *           for rb = 0...RB_SIZE-1
 *             vout[rb] = SETZERO()
 *           for kh = 0...KH-1
 *             for kw = 0 ... KW - 1 
 *               vwt = LOAD(weight[ifm][ofm][kh][0])
 *               for rb = 0 .,, RB_SIZE - 1
 *                 VFMADD(EXTLOAD(input[ib][STRIDE*ofh + kh][STRIDE*ofw+kw][0], vwt, vout[rb])
 *
 *           for rb = 0 ... RB_SIZE - 1
 *             STROE(vout, output[ofm][ofmh][ofmw*RB_SIZE + rb][0])
 */
