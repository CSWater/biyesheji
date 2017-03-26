/*
 * =====================================================================================
 *
 *       Filename:  inner.c
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  03/11/2017 02:43:42 PM
 *       Revision:  none
 *       Compiler:  gcc v4.9.4
 *
 *         Author:  WHUCSWater
			Email:	shuichaoyang@ncic.ac.cn
 *   Organization:  NCIC
 *
 * =====================================================================================
 */
#include"../include/kernel.h"
#include<iostream>
#include<string.h>
#include<algorithm>
using std::cout;
using std::endl;

void forward_kernel_model(const float * __restrict I, const float * __restrict F, float * __restrict O, float * __restrict I_pack, float * __restrict F_pack, size_t rc, size_t ic,
  size_t n, size_t r, size_t s, size_t c, size_t ip, size_t iq, size_t str_h, size_t str_w,
  size_t pad_h, size_t pad_w, size_t H, size_t W, size_t P, size_t Q, size_t K, size_t R, size_t S, size_t C) {
  unsigned cycles_high, cycles_low, cycles_high1, cycles_low1;
  unsigned long long start, end;
  __m512 Ovec[PQREG][KREG];
  __m512 Fvec[KREG];
  __m512 Fvec_n[KREG];
  __m512 Ivec1, Ivev2, Ivec3, Ivec4;
  float *F_ptr = F_pack, *I_ptr = I_pack;
  //input pack resides in main memory
  #include"./vector/qblock_pack-inl.h"
  //filter pack resides in L2 cache
  #include"./vector/kblock_pack-inl.h" 
  //Nr
  for(size_t k = 0; k < K; k += KREG * VEC_LEN) {
    //Mr
    for(size_t bpq = 0; bpq < PQBLOCK; bpq += 6) {
      F_ptr = F_pack + k * CBLOCK;
      //set Caux = 0
      for(size_t i = 0; i < PQREG; ++i) {
        for(size_t j = 0; j < KREG; ++j) {
          Ovec[i][j] = _mm512_set1_ps(0);
        }
      }
      //Load K from L2 cache
      Fvec[0] = _mm512_load_ps(F_ptr);
      Fvec[1] = _mm512_load_ps(F_ptr + 16);
      Fvec[2] = _mm512_load_ps(F_ptr + 32);
      Fvec[3] = _mm512_load_ps(F_ptr + 48);
      F_ptr = F_ptr + 64;
      //    asm volatile("prefetch 0 192(%0)          \n\t"::"r"(a) );
      for(size_t bc = 0; bc < CBLOCK - 2; bc += 2) {
        //iteration 0
        //caculate Mr * Nr
        Fvec_n[0] = _mm512_load_ps(F_ptr);
        Ivec1 = _mm512_set1_ps(*I_ptr);         //cycle0
        Ovec[0][0] = _mm512_fmadd_ps(Ivec1, Fvec[0], Ovec[0][0]); //cycle0 + 4
        Ovec[0][1] = _mm512_fmadd_ps(Ivec1, Fvec[1], Ovec[0][1]); //cycle0 + 4
        Ovec[0][1] = _mm512_fmadd_ps(Ivec1, Fvec[2], Ovec[0][2]); //cycle0 + 5
        Ovec[0][1] = _mm512_fmadd_ps(Ivec1, Fvec[3], Ovec[0][3]); //cycle0 + 5

        Fvec_n[1] = _mm512_load_ps(F_ptr + 16);
        Ivec1 = _mm512_set1_ps(*(I_ptr + 16));
        Ovec[1][0] = _mm512_fmadd_ps(Ivec1, Fvec[0], Ovec[1][0]); //cycle0 + 6
        Ovec[1][1] = _mm512_fmadd_ps(Ivec1, Fvec[1], Ovec[1][1]); //cycle0 + 6
        Ovec[1][2] = _mm512_fmadd_ps(Ivec1, Fvec[2], Ovec[1][2]); //cycle0 + 7
        Ovec[1][3] = _mm512_fmadd_ps(Ivec1, Fvec[3], Ovec[1][3]); //cycle0 + 7

        Fvec_n[2] = _mm512_load_ps(F_ptr + 32);
        Ivec1 = _mm512_set1_ps(*(I_ptr + 32));
        Ovec[2][0] = _mm512_fmadd_ps(Ivec1, Fvec[0], Ovec[2][0]); //cycle0 + 8
        Ovec[2][1] = _mm512_fmadd_ps(Ivec1, Fvec[1], Ovec[2][1]); //cycle0 + 8
        Ovec[2][2] = _mm512_fmadd_ps(Ivec1, Fvec[2], Ovec[2][2]); //cycle0 + 9
        Ovec[2][3] = _mm512_fmadd_ps(Ivec1, Fvec[3], Ovec[2][3]); //cycle0 + 10

        Fvec_n[3] = _mm512_load_ps(F_ptr + 48);
        Ivec1 = _mm512_set1_ps(*(I_ptr + 48));
        Ovec[3][0] = _mm512_fmadd_ps(Ivec1, Fvec[0], Ovec[3][0]); //cycle0 + 10
        Ovec[3][1] = _mm512_fmadd_ps(Ivec1, Fvec[1], Ovec[3][1]); //cycle0 + 11
        Ovec[3][2] = _mm512_fmadd_ps(Ivec1, Fvec[2], Ovec[3][2]); //cycle0 + 11
        Ovec[3][3] = _mm512_fmadd_ps(Ivec1, Fvec[3], Ovec[3][3]); //cycle0 + 12

        Ivec1 = _mm512_set1_ps(*(I_ptr + 64));
        Ovec[4][0] = _mm512_fmadd_ps(Ivec1, Fvec[0], Ovec[4][0]); //cycle0 + 12
        Ovec[4][1] = _mm512_fmadd_ps(Ivec1, Fvec[1], Ovec[4][1]); //cycle0 + 13
        Ovec[4][2] = _mm512_fmadd_ps(Ivec1, Fvec[2], Ovec[4][2]); //cycle0 + 13
        Ovec[4][3] = _mm512_fmadd_ps(Ivec1, Fvec[3], Ovec[4][3]); //cycle0 + 14

        Ivec1 = _mm512_set1_ps(*(I_ptr + 80));
        Ovec[5][0] = _mm512_fmadd_ps(Ivec1, Fvec[0], Ovec[5][0]); //cycle0 + 14
        Ovec[5][1] = _mm512_fmadd_ps(Ivec1, Fvec[1], Ovec[5][1]); //cycle0 + 15
        Ovec[5][2] = _mm512_fmadd_ps(Ivec1, Fvec[2], Ovec[5][2]); //cycle0 + 15
        Ovec[5][3] = _mm512_fmadd_ps(Ivec1, Fvec[3], Ovec[5][3]); //cycleo + 16

        //iteration 1
        Fvec[0] = _mm512_load_ps(F_ptr + 64);
        Ivec1 = _mm512_set1_ps(*(I_ptr + 1));
        Ovec[0][0] = _mm512_fmadd_ps(Ivec1, Fvec_n[0], Ovec[0][0]); //cycle0 +16
        Ovec[0][1] = _mm512_fmadd_ps(Ivec1, Fvec_n[1], Ovec[0][1]); //cycle0 +17
        Ovec[0][2] = _mm512_fmadd_ps(Ivec1, Fvec_n[2], Ovec[0][2]); //cycle0 +17
        Ovec[0][3] = _mm512_fmadd_ps(Ivec1, Fvec_n[3], Ovec[0][3]); //cycle0 +18

        Fvec[1] = _mm512_load_ps(F_ptr + 80);
        Ivec1 = _mm512_set1_ps(*(I_ptr + 17));
        Ovec[1][0] = _mm512_fmadd_ps(Ivec1, Fvec_n[0], Ovec[1][0]); //cycle0 + 18
        Ovec[1][1] = _mm512_fmadd_ps(Ivec1, Fvec_n[1], Ovec[1][1]); //cycle0 + 19
        Ovec[1][2] = _mm512_fmadd_ps(Ivec1, Fvec_n[2], Ovec[1][2]); //cycle0 + 19
        Ovec[1][3] = _mm512_fmadd_ps(Ivec1, Fvec_n[3], Ovec[1][3]); //cycle0 + 20

        Fvec[2] = _mm512_load_ps(F_ptr + 96);
        Ivec1 = _mm512_set1_ps(*(I_ptr + 33));
        Ovec[2][0] = _mm512_fmadd_ps(Ivec1, Fvec_n[0], Ovec[2][0]); //cycle0 + 20
        Ovec[2][1] = _mm512_fmadd_ps(Ivec1, Fvec_n[1], Ovec[2][1]); //cycle0 + 21
        Ovec[2][2] = _mm512_fmadd_ps(Ivec1, Fvec_n[2], Ovec[2][2]); //cycle0 + 21
        Ovec[2][3] = _mm512_fmadd_ps(Ivec1, Fvec_n[3], Ovec[2][3]); //cycle0 + 22

        Fvec[3] = _mm512_load_ps(F_ptr + 112);
        Ivec1 = _mm512_set1_ps(*(I_ptr + 49));
        Ovec[3][0] = _mm512_fmadd_ps(Ivec1, Fvec_n[0], Ovec[3][0]);  //cycle0 + 22
        Ovec[3][1] = _mm512_fmadd_ps(Ivec1, Fvec_n[1], Ovec[3][1]);  //cycle0 + 23
        Ovec[3][2] = _mm512_fmadd_ps(Ivec1, Fvec_n[2], Ovec[3][2]);  //cycle0 + 23
        Ovec[3][3] = _mm512_fmadd_ps(Ivec1, Fvec_n[3], Ovec[3][3]);  //cycle0 + 24
        
        F_ptr = F_ptr + 128;
        Ivec1 = _mm512_set1_ps(*(I_ptr + 65));
        Ovec[4][0] = _mm512_fmadd_ps(Ivec1, Fvec_n[0], Ovec[4][0]); //cycle0 + 24
        Ovec[4][1] = _mm512_fmadd_ps(Ivec1, Fvec_n[1], Ovec[4][1]); //cycle0 + 25
        Ovec[4][2] = _mm512_fmadd_ps(Ivec1, Fvec_n[2], Ovec[4][2]); //cycle0 + 25
        Ovec[4][3] = _mm512_fmadd_ps(Ivec1, Fvec_n[3], Ovec[4][3]); //cycle0 + 26

        Ivec1 = _mm512_set1_ps(*(I_ptr + 81));
        Ovec[5][0] = _mm512_fmadd_ps(Ivec1, Fvec_n[0], Ovec[5][0]); //cycle0 + 26
        Ovec[5][1] = _mm512_fmadd_ps(Ivec1, Fvec_n[1], Ovec[5][1]); //cycle0 + 27
        Ovec[5][2] = _mm512_fmadd_ps(Ivec1, Fvec_n[2], Ovec[5][2]); //cycle0 + 27
        Ovec[5][3] = _mm512_fmadd_ps(Ivec1, Fvec_n[3], Ovec[5][3]); //cycle0 + 27
        I_ptr = I_ptr + 1;
      }
      //the remain two interation
      Ivec1 = _mm512_set1_ps(*I_ptr);
      Ovec[0][0] = _mm512_fmadd_ps(Ivec1, Fvec[0], Ovec[0][0]); //
      Ovec[0][1] = _mm512_fmadd_ps(Ivec1, Fvec[1], Ovec[0][1]); //
      Ovec[0][2] = _mm512_fmadd_ps(Ivec1, Fvec[2], Ovec[0][2]); //
      Ovec[0][3] = _mm512_fmadd_ps(Ivec1, Fvec[3], Ovec[0][3]); //

      Ivec1 = _mm512_set1_ps(*(I_ptr + 16));
      Ovec[1][0] = _mm512_fmadd_ps(Ivec1, Fvec[0], Ovec[1][0]); //
      Ovec[1][1] = _mm512_fmadd_ps(Ivec1, Fvec[1], Ovec[1][1]); //
      Ovec[1][2] = _mm512_fmadd_ps(Ivec1, Fvec[2], Ovec[1][2]); //
      Ovec[1][3] = _mm512_fmadd_ps(Ivec1, Fvec[3], Ovec[1][3]); //

      Fvec_n[0] = _mm512_load_ps(F_ptr);
      Ivec1 = _mm512_set1_ps(*(I_ptr + 32));
      Ovec[2][0] = _mm512_fmadd_ps(Ivec1, Fvec[0], Ovec[2][0]); //
      Ovec[2][1] = _mm512_fmadd_ps(Ivec1, Fvec[1], Ovec[2][1]); //
      Ovec[2][2] = _mm512_fmadd_ps(Ivec1, Fvec[2], Ovec[2][2]); //
      Ovec[2][3] = _mm512_fmadd_ps(Ivec1, Fvec[2], Ovec[2][3]); //

      Fvec[1] = _mm512_load_ps(F_ptr + 16);
      Ivec1 = _mm512_set1_ps(*(I_ptr + 48));
      Ovec[3][0] = _mm512_fmadd_ps(Ivec1, Fvec[0], Ovec[3][0]); //
      Ovec[3][1] = _mm512_fmadd_ps(Ivec1, Fvec[1], Ovec[3][1]); //
      Ovec[3][2] = _mm512_fmadd_ps(Ivec1, Fvec[2], Ovec[3][2]); //
      Ovec[3][3] = _mm512_fmadd_ps(Ivec1, Fvec[3], Ovec[3][3]); //

      Fvec[2] = _mm512_load_ps(F_ptr + 32);
      Ivec1 = _mm512_set1_ps(*(I_ptr + 64));
      Ovec[4][0] = _mm512_fmadd_ps(Ivec1, Fvec[0], Ovec[4][0]); //
      Ovec[4][1] = _mm512_fmadd_ps(Ivec1, Fvec[1], Ovec[4][1]); //
      Ovec[4][2] = _mm512_fmadd_ps(Ivec1, Fvec[2], Ovec[4][2]); //
      Ovec[4][3] = _mm512_fmadd_ps(Ivec1, Fvec[3], Ovec[4][3]); //

      Fvec[3] = _mm512_load_ps(F_ptr + 48);
      Ivec1 = _mm512_set1_ps(*(I_ptr + 80));
      Ovec[5][0] = _mm512_fmadd_ps(Ivec1, Fvec[0], Ovec[5][0]); //
      Ovec[5][1] = _mm512_fmadd_ps(Ivec1, Fvec[1], Ovec[5][1]); //
      Ovec[5][2] = _mm512_fmadd_ps(Ivec1, Fvec[2], Ovec[5][2]); //
      Ovec[5][3] = _mm512_fmadd_ps(Ivec1, Fvec[3], Ovec[5][3]); //

      Ivec1 = _mm512_set1_ps(*(I_ptr + 1));
      Ovec[0][0] = _mm512_fmadd_ps(Ivec1, Fvec_n[0], Ovec[0][0]); //
      Ovec[0][1] = _mm512_fmadd_ps(Ivec1, Fvec_n[1], Ovec[0][1]); //
      Ovec[0][2] = _mm512_fmadd_ps(Ivec1, Fvec_n[2], Ovec[0][2]); // 
      Ovec[0][3] = _mm512_fmadd_ps(Ivec1, Fvec_n[3], Ovec[0][3]); //

      Ivec1 = _mm512_set1_ps(*(I_ptr + 17));
      Ovec[1][0] = _mm512_fmadd_ps(Ivec1, Fvec_n[0], Ovec[1][0]); //
      Ovec[1][1] = _mm512_fmadd_ps(Ivec1, Fvec_n[1], Ovec[1][1]); //
      Ovec[1][2] = _mm512_fmadd_ps(Ivec1, Fvec_n[2], Ovec[1][2]); //
      Ovec[1][3] = _mm512_fmadd_ps(Ivec1, Fvec_n[3], Ovec[1][3]); //

      Ivec1 = _mm512_set1_ps(*(I_ptr + 33));
      Ovec[2][0] = _mm512_fmadd_ps(Ivec1, Fvec_n[0], Ovec[2][0]); //
      Ovec[2][1] = _mm512_fmadd_ps(Ivec1, Fvec_n[1], Ovec[2][1]); //
      Ovec[2][2] = _mm512_fmadd_ps(Ivec1, Fvec_n[2], Ovec[2][2]); //
      Ovec[2][3] = _mm512_fmadd_ps(Ivec1, Fvec_n[3], Ovec[2][3]); //

      Ivec1 = _mm512_set1_ps(*(I_ptr + 49));
      Ovec[3][0] = _mm512_fmadd_ps(Ivec1, Fvec_n[0], Ovec[3][0]); //
      Ovec[3][1] = _mm512_fmadd_ps(Ivec1, Fvec_n[1], Ovec[3][1]); //
      Ovec[3][2] = _mm512_fmadd_ps(Ivec1, Fvec_n[2], Ovec[3][2]); //
      Ovec[3][3] = _mm512_fmadd_ps(Ivec1, Fvec_n[3], Ovec[3][3]); //

      Ivec1 = _mm512_set1_ps(*(I_ptr + 65));
      Ovec[4][0] = _mm512_fmadd_ps(Ivec1, Fvec_n[0], Ovec[4][0]); //
      Ovec[4][1] = _mm512_fmadd_ps(Ivec1, Fvec_n[1], Ovec[4][1]); //
      Ovec[4][2] = _mm512_fmadd_ps(Ivec1, Fvec_n[2], Ovec[4][2]); //
      Ovec[4][3] = _mm512_fmadd_ps(Ivec1, Fvec_n[3], Ovec[4][3]); //

      Ivec1 = _mm512_set1_ps(*(I_ptr + 81));
      Ovec[5][0] = _mm512_fmadd_ps(Ivec1, Fvec_n[0], Ovec[5][0]); //
      Ovec[5][1] = _mm512_fmadd_ps(Ivec1, Fvec_n[1], Ovec[5][1]); //
      Ovec[5][2] = _mm512_fmadd_ps(Ivec1, Fvec_n[2], Ovec[5][2]); //
      Ovec[5][3] = _mm512_fmadd_ps(Ivec1, Fvec_n[3], Ovec[5][3]); //

      //store the Cuax
      aq = (iq + bpq) % Q;
      ap = ip + (iq + bpq) / Q;
      for (size_t i = 0; i < PQREG; ++i) {
        if(ap >= P) {
          break;
        }
        #pragma unroll
        for (size_t j = 0; j < KREG; ++j) {
          _mm512_store_ps(ADDRESS_OUTPUT_NPQK(n, ap, aq, (k + j * VEC_LEN)),
            _mm512_add_ps(_mm512_load_ps(ADDRESS_OUTPUT_NPQK(n, ap, aq, (k + j * VEC_LEN))), Ovec[i][j]));
        }
        aq += 1;
        if(aq >= Q) {
          ap += 1;
          aq = 0;
        }
      }
      if (ap >= P) {
        break;
      }
    }
  }
}
