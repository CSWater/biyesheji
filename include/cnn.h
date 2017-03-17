/*
 * =====================================================================================
 *
 *       Filename:  cnn.h
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  02/21/2017 09:05:21 PM
 *       Revision:  none
 *       Compiler:  gcc v4.9.4
 *
 *         Author:  WHUCSWater 
 *			Email:	shuichaoyang@ncic.ac.cn
 *   Organization:  NCIC
 *
 * =====================================================================================
 */
#ifndef _INCLUDE_CNN_H_
#define _INCLUDE_CNN_H_

#include<stddef.h>
#include<omp.h>
#include<iostream>
using std::cout;
using std::endl;


typedef struct {
    size_t nImg;
    size_t nIfm;
    size_t nOfm;
    size_t ifhp;
    size_t ifwp;
    size_t ofhp;
    size_t ofwp;
    size_t ofh;
    size_t ofw;
    size_t pad_h_in;
    size_t pad_w_in;
    size_t pad_h_out;
    size_t pad_w_out;
    size_t kh;
    size_t kw;
    size_t stride_h;
    size_t stride_w;
} naive_conv_t;

/***************************************************
 * common functions
 * *************************************************/
void init_buf(float *buf, size_t size);

void copy_buf(float const *src, float  *dst, size_t size);

void copy_NCHW_to_NHWC(const float* nchw, float* nhwc, size_t N, size_t H, size_t W, size_t C);

void copy_NHWC_to_NCHW(const float* nhwc, float* nchw, size_t N, size_t H, size_t W, size_t C);

void copy_KCRS_to_RSCK(const float *kcrs, float *rsck, size_t R, size_t S, size_t C, size_t K);

void copy_RSCK_to_KCRS(const float *rsck, float *kcrs, size_t R, size_t S, size_t C, size_t K);

void zero_buf(float *buf, size_t size);

void compare_buf(const float *buf_one, const float *buf_two, size_t size);
/*  allocate aligned memory */
void *blitz_aligned_malloc(size_t size, size_t alignment);
/*  free aligned memory */
void blitz_aligned_free(void *memory);



#endif
