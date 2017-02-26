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

void blitz_forward(size_t N, size_t H, size_t W, size_t C, 
  size_t K, size_t R, size_t S, size_t P, size_t Q, size_t stride,
  float *input, float *output, float *filter) {
 
  /*  loop counters */
  size_t n, k, c, q, p, ih, iw, s, r;
#if defined(_OPENMP)
# pragma omp parallel for collapse(2) private(n, k, c, p, q, ih, iw, s, r)
#endif
  for(n = 0; n < N; ++n) {
    for(p = 0; p < P; ++p) {
      ih = p * stride;
      for(q = 0; q < Q; ++q) {
        iw = q * stride;
        for(c = 0; c < C; ++c) {
          for(r = 0; r < R; ++r) {
            for(s = 0; s < S; ++s) {
              for(k = 0; k < K; ++k) {
              ACCESS(output, n, p, q, k, P, Q, K) += 
                ACCESS(input, n, ih + r, iw + s, c, H, W, C) *
                ACCESS(filter, r, s, c, k, S, C, K);
              }
            }
          }
        }
      }
    }
  }
}


void ConvolutionForwardNaiveImpl(
  const float* I,
  const float* F,
  float* O,
  size_t N,
  size_t C, size_t H, size_t W,
  size_t R, size_t S,
  size_t K, size_t P, size_t Q,
  size_t pad_h, size_t pad_w,
  size_t str_h, size_t str_w) {
  #pragma omp parallel for
  for (size_t n = 0; n < N; ++n) {
    for (size_t p = 0; p < P; ++p) {
      int ih = p * str_h - pad_h;
      for (size_t q = 0; q < Q; ++q) {
        int iw = q * str_w - pad_w;
        size_t r_end = ih + R < H ? R : H - ih;
        size_t s_end = iw + S < W ? S : W - iw;
        size_t r = ih < 0 ? -ih : 0;
        for (; r < r_end; ++r) {
          size_t s = iw < 0 ? -iw : 0;
          for (; s < s_end; ++s) {
            for (size_t k = 0; k < K; ++k) {
              for (size_t c = 0; c < C; ++c) {
                ACCESS_OUTPUT_NPQK(n, p, q, k) += ACCESS_INPUT_NHWC(n, (ih + r), (iw + s), c) *
                  ACCESS_FILTER_RSCK(r, s, c, k); 
              }
            }
          }
        }
      }
    }
  }
}
