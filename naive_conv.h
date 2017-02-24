/*
 * =====================================================================================
 *
 *       Filename:  forward.h
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  02/22/2017 08:21:07 PM
 *       Revision:  none
 *       Compiler:  gcc v4.9.4
 *
 *         Author:  WHUCSWater 
 *			Email:	shuichaoyang@ncic.ac.cn
 *   Organization:  NCIC
 *
 * =====================================================================================
 */
#ifndef _NAIVE_CONV_H_
#define _NAIVE_CONV_H_
#include"cnn.h"

void naive_conv_fp(naive_conv_t *param, const float *input, float *output, const float *filter);

void naive_conv_bp(naive_conv_t *param, float *input, const float *output, const float *filter);

void naive_conv_wu(naive_conv_t *param, const float *input, const float *output, float *filter);

#endif
