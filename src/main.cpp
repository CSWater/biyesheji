/*
 * =====================================================================================
 *
 *       Filename:  forward.cpp
 *
 *    Description:  forward
 *
 *        Version:  1.0
 *        Created:  02/14/2017 02:33:01 PM
 *       Revision:  none
 *       Compiler:  gcc v4.9.4
 *
 *         Author:  WHUCSWater
			Email:	shuichaoyang@ncic.ac.cn
 *   Organization:  NCIC
 *
 * =====================================================================================
 */
#include<cstdio>
#include<iostream>
#include"../include/cnn.h"
#include"../include/blitz_time.h"
#include"../include/naive_conv.h"
#include"../include/blitz_forward.h"

using std::cout;
using std::endl;

int main(int argc, char ** argv)
{
  const size_t NUM_ARGS = 16;
  //phase kernel N C H W R S K P Q pad_h pad_w str_h str_w iter
  //get args
  const std::string phase = std::string(argv[1]);
  const std::string kernel = std::string(argv[2]);
  const size_t iter = atoi(argv[3]);
  const size_t H = atoi(argv[4]);
  const size_t W = atoi(argv[5]);
  const size_t N = atoi(argv[6]);
  const size_t C = atoi(argv[7]);
  const size_t K = atoi(argv[8]);
  const size_t R = atoi(argv[9]);
  const size_t S = atoi(argv[10]);
  const size_t pad_h = atoi(argv[11]);
  const size_t pad_w = pad_h;
  const size_t str_h = atoi(argv[12]);
  const size_t str_w = str_h;
  const size_t P = atoi(argv[13]);
  const size_t Q = atoi(argv[14]);
  //set struct for naive convolution
  naive_conv_t naive_param;
  naive_param.nImg = N;
  naive_param.nIfm = C;
  naive_param.nOfm = K;
  naive_param.ifhp = H;
  naive_param.ifwp = W;
  naive_param.ofh  = P;
  naive_param.ofw  = Q;
  naive_param.ofhp = P;
  naive_param.ofwp = Q;
  naive_param.pad_h_in = 0;
  naive_param.pad_w_in = 0;
  naive_param.pad_h_out = pad_h;
  naive_param.pad_w_out = pad_w;
  naive_param.kh = R;
  naive_param.kw = S;
  naive_param.stride_h = str_h;
  naive_param.stride_w = str_w;
  //size
  size_t size_input = N * C * H * W;
  size_t size_filter = K * C * R * S;
  size_t size_output = N * P * Q * K;
  /*  allocate memory */
  //float *naive_input = (float *)blitz_aligned_malloc(size_input * sizeof(float), 64);
  //float *naive_filter = (float *)blitz_aligned_malloc(size_filter * sizeof(float), 128);
  //float *naive_output = (float *)blitz_aligned_malloc(size_output *  sizeof(float), 192);
  //float *nchw = (float *)blitz_aligned_malloc(size_output * sizeof(float), 448);
  float *input = (float *)blitz_aligned_malloc(size_input * sizeof(float), 64);
  float *filter = (float *)blitz_aligned_malloc(size_filter * sizeof(float), 128);
  float *output = (float *)blitz_aligned_malloc(size_output * sizeof(float), 256);
  cout << input << " " << filter << " " << output << endl;
  //init data
 // zero_buf(naive_output, size_output);
 // init_buf(naive_input, size_input, 0, 0);
 // init_buf(naive_filter, size_filter, 0, 0);
  zero_buf(output, size_output);
  init_buf(input, size_input, 0, 0);
  init_buf(filter, size_filter, 0, 0);
//  ConvolutionForwardNaiveImpl(naive_input, naive_filter, naive_output, N, C, H, W, R, S, K, P, Q, pad_h, pad_w, str_h, str_w);
//  ConvolutionForwardVectorImpl(input, filter, output, N, C, H, W, R, S, K, P, Q, pad_h, pad_w, str_h, str_w);
  //check result
//  copy_NHWC_to_NCHW(output, nchw, N, P, Q, K);
//  cout <<  "*************correctness!*****************" << endl;
//  compare_buf(naive_output, output, size_output);
  //performance
  unsigned long long start, end;
  double cost_time = 0.0;
  double flops = N * K * P * Q * C * R * S * 2 * 1E-9;
  int i = 0;
  for(i = 0; i < iter; ++i) {
#ifndef TIME_ANALYSE
    start = blitz_timer_tick();
    ConvolutionForwardVectorImpl(input, filter, output, N, C, H, W, R, S, K, P, Q, pad_h, pad_w, str_h, str_w);
    end = blitz_timer_tick();
    cost_time = blitz_timer_duration(start, end);
    cout << "GFLOPS: " << flops / cost_time <<  endl;
#endif
  }
  /*   free memory */
  //blitz_aligned_free(naive_input);
  //blitz_aligned_free(naive_filter);
  //blitz_aligned_free(naive_output);
  //blitz_aligned_free(nchw);
  blitz_aligned_free(input);
  blitz_aligned_free(filter);
  blitz_aligned_free(output);
  return 0;

}

