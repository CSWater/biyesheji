/*
 * =====================================================================================
 *
 *       Filename:  forward.cpp
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  02/22/2017 07:31:39 PM
 *       Revision:  none
 *       Compiler:  gcc v4.9.4
 *
 *         Author:  WHUCSWater
			Email:	shuichaoyang@ncic.ac.cn
 *   Organization:  NCIC
 *
 * =====================================================================================
 */
#include<iostream>
#include"naive_conv.h"
#include"blitz_macro.h"
using std::cerr;
using std::endl;

void naive_conv_fp(naive_conv_t* param, const float* input, float* output, const float* filter) {
  size_t nImg      = param->nImg;
  size_t nIfm      = param->nIfm;
  size_t nOfm      = param->nOfm;
  size_t ifhp      = param->ifhp;
  size_t ifwp      = param->ifwp;
  size_t ofhp      = param->ofhp;
  size_t ofwp      = param->ofwp;
  size_t ofh       = param->ofh;
  size_t ofw       = param->ofw;
  size_t pad_h_out = param->pad_h_out;
  size_t pad_w_out = param->pad_w_out;
  size_t kh        = param->kh;
  size_t kw        = param->kw;
  size_t stride_h  = param->stride_h;
  size_t stride_w  = param->stride_w;
  /* loop counters */
  size_t img, ofm, ifm, oj, oi, ij, ii, kj, ki;
#if defined(_OPENMP)
# pragma omp parallel for collapse(2) private(img, ofm, ifm, oj, oi, ij, ii, kj, ki)
#endif
  for (img = 0; img < nImg; ++img) {
    for (ofm = 0; ofm < nOfm; ++ofm) {
      for (ifm = 0; ifm < nIfm; ++ifm) {
        for (oj = 0; oj < ofhp; ++oj) {
          ij = oj * stride_h;
          for (oi = 0; oi < ofwp; ++oi) {
            ii = oi * stride_w;
            for (kj = 0; kj < kh; ++kj) {
              for (ki = 0; ki < kw; ++ki) {
                ACCESS(output, img, ofm, oj, oi, nOfm, ofhp, ofwp) +=
                  ACCESS(input, img, ifm, ij + kj, ii + ki, nIfm, ifhp, ifwp)
                  * ACCESS(filter, ofm, ifm, kj, ki, nIfm, kh, kw);
              }
            }
          }
        }
      }
    }
  }
}

#define ACCESS_INPUT_NHWC(i, j, k, v) *(I + ((i * H + j) * W + k) * C + v)
#define ACCESS_OUTPUT_NPQK(i, j, k, v) *(O + ((i * P + j) * Q + k) * K + v)
#define ACCESS_FILTER_RSCK(i, j, k, v) *(F + ((i * S + j) * C + k) * K + v)
/* NHWC - RSCK */
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
