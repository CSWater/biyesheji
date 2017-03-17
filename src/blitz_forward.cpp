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

#include"../include/blitz_forward.h"
#include"../include/blitz_macro.h"
#include"../include/cnn.h"
#include<iostream>
using std::endl;
using std::cout;

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
  if (K % (KREG * VEC_LEN)) {
    cout  << "Not supported K, please set it as a multiple of: " << VEC_LEN * KREG << endl;
  }
#pragma omp parallel for 
  for (size_t n = 0; n < N; ++n) {
    float *I_pack = (float *)blitz_aligned_malloc(PQBLOCK * CBLOCK, 128);
    float *F_pack = (float *)blitz_aligned_malloc(CBLOCK * KBLOCK, 64);
    size_t ip, iq, ic, rc;
    size_t pq, r, s, c;
    for (pq = 0; pq < P * Q / PQBLOCK; ++pq) {
      ip = (pq * PQBLOCK) / Q;
      iq = (pq * PQBLOCK) % Q;
      for (r = 0; r < R; ++r) {
        for (s = 0; s < S; ++s) {
          for (c = 0; c < C; c += CBLOCK) {
            ic = c;
            rc = CBLOCK;
            forward_kernel(I, F, O, I_pack, F_pack, rc, ic, n, r, s, c, ip, iq,
              str_h, str_w, pad_h, pad_w, H, W, P, Q, K, R, S, C);
          }
          if (c > C) {
            ic = C + CBLOCK - c;
            rc = c - ic;
            forward_kernel(I, F, O, I_pack, F_pack, rc, ic, n, r, s, c, ip, iq,
              str_h, str_w, pad_h, pad_w, H, W, P, Q, K, R, S, C);
          }
        }
      }
    }
    ip = (P * Q / PQBLOCK) * PQBLOCK / Q;  // p remainder
    iq = (P * Q / PQBLOCK) * PQBLOCK % Q;  // q remainder
    for (r = 0; r < R; ++r) {
      for (s = 0; s < S; ++s) {
        for (c = 0; c < C; c += CBLOCK) {
          ic = c;
          rc = CBLOCK;
          forward_kernel(I, F, O, I_pack, F_pack, rc, ic, n, r, s, c, ip, iq,
            str_h, str_w, pad_h, pad_w, H, W, P, Q, K, R, S, C);
        }
        if (c > C) {
          ic = C + CBLOCK - c;
          rc = c - ic;
          forward_kernel(I, F, O, I_pack, F_pack, rc, ic, n, r, s, c, ip, iq,
            str_h, str_w, pad_h, pad_w, H, W, P, Q, K, R, S, C);
        }
      }
    }
  }
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
 *                 VFMADD(EXTLOAD(input[ib][STRIDE*ofh + kh][STRIDE*ofw+kw][0]), vwt, vout[rb])
 *
 *           for rb = 0 ... RB_SIZE - 1
 *             STROE(vout, output[ofm][ofmh][ofmw*RB_SIZE + rb][0])
 */
