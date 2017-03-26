/*
 * =====================================================================================
 *
 *       Filename:  kernel.h
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  03/16/2017 11:24:29 AM
 *       Revision:  none
 *       Compiler:  gcc v4.9.4
 *
 *         Author:  WHUCSWater 
 *			Email:	shuichaoyang@ncic.ac.cn
 *   Organization:  NCIC
 *
 * =====================================================================================
 */

#ifndef _INCLUDE_KERNEL_H_
#define _INCLUDE_KERNEL_H_
#include"blitz_macro.h"
#include<immintrin.h>
#include<stddef.h>

void forward_kernel(const float * __restrict I, const float * __restrict F, float * __restrict O, 
  float * __restrict I_pack, float * __restrict F_pack, size_t rc, size_t ic,
  size_t n, size_t r, size_t s, size_t c, size_t ip, size_t iq, size_t str_h, size_t str_w,
  size_t pad_h, size_t pad_w, size_t H, size_t W, size_t P, size_t Q, size_t K, size_t R, size_t S, size_t C);

void forward_kernel_model(const float * __restrict I, const float * __restrict F, float * __restrict O, 
  float * __restrict I_pack, float * __restrict F_pack, size_t rc, size_t ic,
  size_t n, size_t r, size_t s, size_t c, size_t ip, size_t iq, size_t str_h, size_t str_w,
  size_t pad_h, size_t pad_w, size_t H, size_t W, size_t P, size_t Q, size_t K, size_t R, size_t S, size_t C);




void micro_kernel_4_6(float *a, float *b, float *c, size_t kc, unsigned long ldk);
#endif
