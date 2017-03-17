/*
 * =====================================================================================
 *
 *       Filename:  blitz_macro.h
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  02/24/2017 08:56:37 PM
 *       Revision:  none
 *       Compiler:  gcc v4.9.4
 *
 *         Author:  WHUCSWater 
 *			Email:	shuichaoyang@ncic.ac.cn
 *   Organization:  NCIC
 *
 * =====================================================================================
 */
#ifndef _INCLUDE_BLITZ_MACRO_H_
#define _INCLUDE_BLITZ_MACRO_H_

#define EPSILON 0.001f
//fetal error
//#define ABS(x) ((x) >  0 ? (x) : (-x))
#define ABS(x) ((x) >  0 ? (x) : (-(x)))

#define ACCESS(psrc, i, j, k, m, J, K, M) (*(psrc + (m) + (k) * M + (j) * K * M + (i) * J * K * M))

//system configuration
#define BLITZ_ALIGMENT 64

//convolution inc
#define ACCESS_INPUT_NHWC(i, j, k, v) *(I + ((i * H + j) * W + k) * C + v)
#define ACCESS_OUTPUT_NPQK(i, j, k, v) *(O + ((i * P + j) * Q + k) * K + v)
#define ACCESS_FILTER_RSCK(i, j, k, v) *(F + ((i * S + j) * C + k) * K + v)
#define ADDRESS_OUTPUT_NPQK(i, j, k, v) (O + ((i * P + j) * Q + k) * K + v)
#define ADDRESS_FILTER_RSCK(i, j, k, v) (F + ((i * S + j) * C + k) * K + v)
#define CBLOCK 64
#define VEC_LEN 16
#define PQBLOCK 72 // divided by PQREG
#define PQREG 6
#define KREG 4
#define KBLOCK 64

//time
#define _STRAT_POINT asm volatile(            \
                  "CPUID\n\t"           \
                  "RDTSC\n\t"           \
                  "mov %%edx, %0\n\t"   \
                  "mov %%eax, %1\n\t": "=r"(cycles_high), "=r"(cycles_low):: \
                  "%rax", "%rbx", "%rcx", "%rdx");

#define _END_POINT asm volatile(              \
                "RDTSCP\n\t"            \
                "mov %%edx, %0\n\t"     \
                "mov %%eax, %1\n\t"     \
                "CPUID\n\t": "=r"(cycles_high1), "=r"(cycles_low1)::  \
                "%rax", "%rbx", "%rcx", "%rdx");

#endif
