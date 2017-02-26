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
#ifndef _BLITZ_MACRO_H_
#define _BLITZ_MACRO_H_

#define EPSILON 0.001f
//fetal error
//#define ABS(x) ((x) >  0 ? (x) : (-x))
#define ABS(x) ((x) >  0 ? (x) : (-(x)))

#define ACCESS(psrc, i, j, k, m, J, K, M) (*(psrc + (m) + (k) * M + (j) * K * M + (i) * J * K * M))
#define drand48() ((double)rand() / RAND_MAX)



//system configuration
#define BLITZ_ALIGMENT 64


#endif
