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
#ifndef CNN_H_
#define CNN_H_

#include<stddef.h>
#include<omp.h>
#define EPSILON 0.000001f
//#define ACCESS(psrc, i, j, k, m, J, K, M) (*(psrc + (m) + (k) * M + (j) * K * M + (i) * J * K * M))
#define ABS(x) ((x) >  0 ? (x) : (-x);

#define BLITZ_ALIGMENT 64

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
void init_buf(float *buf, long size, int initPos, int initOne);

void copy_buf(float *src, float  *dst, long size);

void zero_buf(float *buf, long size);
/*  allocate aligned memory */
void *blitz_aligned_malloc(size_t size, size_t alignment);
/*  free aligned memory */
void blitz_aligned_free(void *memory);



#endif
