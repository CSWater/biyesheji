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
using std::cerr;
using std::endl;
#define ACCESS(psrc, i, j, k, m, J, K, M) (*(psrc + (m) + (k) * M + (j) * K * M + (i) * J * K * M))

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

