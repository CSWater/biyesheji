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
#include"cnn.h"
#include"blitz_time.h"
#include"naive_conv.h"

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
    /*  allocate memory */
    float *naive_input = (float *)malloc(N * C * H * W * sizeof(float));
    float *naive_filter = (float *)malloc(K * C * R * S * sizeof(float));
    float *naive_output = (float *)malloc(N * P * Q * K * sizeof(float));
    if(naive_input == NULL || naive_filter == NULL || naive_output == NULL) {
        cout << "memory error" << endl;
        return 0;
    }
    //init data
    zero_buf(naive_output, N * P * Q * K);
    init_buf(naive_input, N * C * H * W, 0, 0);
    init_buf(naive_filter, K * C * R * S, 0, 0);
    unsigned long long start, end;
    double cost_time = 0.0;
    double flops = N * K * P * Q * C * R * S * 2 * 1E-9;
    for(int i = 0; i < iter; ++i) {
        start = blitz_timer_tick();
        naive_conv_fp(&naive_param, naive_input, naive_output, naive_filter);
        end = blitz_timer_tick();
        cost_time = blitz_timer_duration(start, end);
        cout << "GLOPS: " << flops / cost_time << "    time: " << cost_time << endl;
    }
   /*   free memory */
    free(naive_input);
    free(naive_filter);
    free(naive_output);
    return 0;

}

