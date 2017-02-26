/*
 * =====================================================================================
 *
 *       Filename:  forward.h
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  02/24/2017 03:01:57 PM
 *       Revision:  none
 *       Compiler:  gcc v4.9.4
 *
 *         Author:  WHUCSWater 
 *			Email:	shuichaoyang@ncic.ac.cn
 *   Organization:  NCIC
 *
 * =====================================================================================
 */
#ifndef _FORWARD_H_
#define _FORWARD_H_
#include<stddef.h>

void blitz_forward(size_t nImg, size_t ifh, size_t ifw, size_t nIfm, 
  size_t nOfm, size_t kh, size_t kw, size_t ofh, size_t ofw, size_t stride,
  float *input, float *output, float *filter);

void ConvolutionForwardNaiveImpl(
  const float* I,
  const float* F,
  float* O,
  size_t N,
  size_t C, size_t H, size_t W,
  size_t R, size_t S,
  size_t K, size_t P, size_t Q,
  size_t pad_h, size_t pad_w,
  size_t str_h, size_t str_w);
  

#endif

