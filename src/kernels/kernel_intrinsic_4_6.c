/*
 * =====================================================================================
 *
 *       Filename:  kernel_intrinsic_4_6.c
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  03/26/2017 04:48:51 PM
 *       Revision:  none
 *       Compiler:  gcc v4.9.4
 *
 *         Author:  WHUCSWater
			Email:	shuichaoyang@ncic.ac.cn
 *   Organization:  NCIC
 *
 * =====================================================================================
 */
#include"../../include/kernel.h"
void micro_kernel_4_6(float *a, float *b, float *c, size_t kc, unsigned int ldk) {
  _m512 Ovec[PQREG][KREG];
  _m512 Fvec[KREG];
  _m512 Fvec_n[KREG];
  _m512 Ivec;
  _m512 Ovec1, Ovec2, Ovec3, Ovec4;
  const float *I_ptr = a, *F_ptr = b;
  float *O_ptr = c;

  for (size_t i = 0; i < PQREG; ++i) {
    for (size_t j = 0; j < KREG; ++j) {
      Ovec[i][j] = Ovec[i][j] = _m512_set1_ps(0);
    }
  }
  //Load K from L2 cache
  Fvec[0] = _mm512_load_ps(F_ptr);
  Fvec[1] = _mm512_load_ps(F_ptr + 16);
  Fvec[2] = _mm512_load_ps(F_ptr + 32);
  Fvec[3] = _mm512_load_ps(F_ptr + 48);
  F_ptr = F_ptr + 64;
  //calculate loop
  for(size_t i = 0; i < kc - 2; i += 2) {
    Fvec_n[0] = _mm512_load_ps(F_ptr);
    //iter0 
    //calculate Mr * Nr = 64 * 6, need 4 * 6 registers
    Ivec = _mm512_set1_ps(*I_ptr);
    Ovec[0][0] = _mm512_fmadd_ps(Ivec, Fvec[0], Ovec[0][0]); //cycle0 + 4
    Ovec[0][1] = _mm512_fmadd_ps(Ivec, Fvec[1], Ovec[0][1]); //cycle0 + 4
    Ovec[0][1] = _mm512_fmadd_ps(Ivec, Fvec[2], Ovec[0][2]); //cycle0 + 5
    Ovec[0][1] = _mm512_fmadd_ps(Ivec, Fvec[3], Ovec[0][3]); //cycle0 + 5

    Fvec_n[1] = _mm512_load_ps(F_ptr + 16);
    Ivec = _mm512_set1_ps(*(I_ptr + 16));
    Ovec[1][0] = _mm512_fmadd_ps(Ivec, Fvec[0], Ovec[1][0]); //cycle0 + 6
    Ovec[1][1] = _mm512_fmadd_ps(Ivec, Fvec[1], Ovec[1][1]); //cycle0 + 6
    Ovec[1][2] = _mm512_fmadd_ps(Ivec, Fvec[2], Ovec[1][2]); //cycle0 + 7
    Ovec[1][3] = _mm512_fmadd_ps(Ivec, Fvec[3], Ovec[1][3]); //cycle0 + 7

    Fvec_n[2] = _mm512_load_ps(F_ptr + 32);
    Ivec = _mm512_set1_ps(*(I_ptr + 32));
    Ovec[2][0] = _mm512_fmadd_ps(Ivec, Fvec[0], Ovec[2][0]); //cycle0 + 8
    Ovec[2][1] = _mm512_fmadd_ps(Ivec, Fvec[1], Ovec[2][1]); //cycle0 + 8
    Ovec[2][2] = _mm512_fmadd_ps(Ivec, Fvec[2], Ovec[2][2]); //cycle0 + 9
    Ovec[2][3] = _mm512_fmadd_ps(Ivec, Fvec[3], Ovec[2][3]); //cycle0 + 10
    
    Fvec_n[3] = _mm512_load_ps(F_ptr + 48);
    Ivec = _mm512_set1_ps(*(I_ptr + 48));
    Ovec[3][0] = _mm512_fmadd_ps(Ivec, Fvec[0], Ovec[3][0]); //cycle0 + 10
    Ovec[3][1] = _mm512_fmadd_ps(Ivec, Fvec[1], Ovec[3][1]); //cycle0 + 11
    Ovec[3][2] = _mm512_fmadd_ps(Ivec, Fvec[2], Ovec[3][2]); //cycle0 + 11
    Ovec[3][3] = _mm512_fmadd_ps(Ivec, Fvec[3], Ovec[3][3]); //cycle0 + 12

    Ivec = _mm512_set1_ps(*(I_ptr + 64));
    Ovec[4][0] = _mm512_fmadd_ps(Ivec, Fvec[0], Ovec[4][0]); //cycle0 + 12
    Ovec[4][1] = _mm512_fmadd_ps(Ivec, Fvec[1], Ovec[4][1]); //cycle0 + 13
    Ovec[4][2] = _mm512_fmadd_ps(Ivec, Fvec[2], Ovec[4][2]); //cycle0 + 13
    Ovec[4][3] = _mm512_fmadd_ps(Ivec, Fvec[3], Ovec[4][3]); //cycle0 + 14

    Ivec = _mm512_set1_ps(*(I_ptr + 80));
    Ovec[5][0] = _mm512_fmadd_ps(Ivec, Fvec[0], Ovec[5][0]); //cycle0 + 14
    Ovec[5][1] = _mm512_fmadd_ps(Ivec, Fvec[1], Ovec[5][1]); //cycle0 + 15
    Ovec[5][2] = _mm512_fmadd_ps(Ivec, Fvec[2], Ovec[5][2]); //cycle0 + 15
    Ovec[5][3] = _mm512_fmadd_ps(Ivec, Fvec[3], Ovec[5][3]); //cycleo + 16

    //iteration 1
    Fvec[0] = _mm512_load_ps(F_ptr + 64);
    Ivec = _mm512_set1_ps(*(I_ptr + 1));
    Ovec[0][0] = _mm512_fmadd_ps(Ivec, Fvec_n[0], Ovec[0][0]); //cycle0 +16
    Ovec[0][1] = _mm512_fmadd_ps(Ivec, Fvec_n[1], Ovec[0][1]); //cycle0 +17
    Ovec[0][2] = _mm512_fmadd_ps(Ivec, Fvec_n[2], Ovec[0][2]); //cycle0 +17
    Ovec[0][3] = _mm512_fmadd_ps(Ivec, Fvec_n[3], Ovec[0][3]); //cycle0 +18

    Fvec[1] = _mm512_load_ps(F_ptr + 80);
    Ivec = _mm512_set1_ps(*(I_ptr + 17));
    Ovec[1][0] = _mm512_fmadd_ps(Ivec, Fvec_n[0], Ovec[1][0]); //cycle0 + 18
    Ovec[1][1] = _mm512_fmadd_ps(Ivec, Fvec_n[1], Ovec[1][1]); //cycle0 + 19
    Ovec[1][2] = _mm512_fmadd_ps(Ivec, Fvec_n[2], Ovec[1][2]); //cycle0 + 19
    Ovec[1][3] = _mm512_fmadd_ps(Ivec, Fvec_n[3], Ovec[1][3]); //cycle0 + 20

    Fvec[2] = _mm512_load_ps(F_ptr + 96);
    Ivec = _mm512_set1_ps(*(I_ptr + 33));
    Ovec[2][0] = _mm512_fmadd_ps(Ivec, Fvec_n[0], Ovec[2][0]); //cycle0 + 20
    Ovec[2][1] = _mm512_fmadd_ps(Ivec, Fvec_n[1], Ovec[2][1]); //cycle0 + 21
    Ovec[2][2] = _mm512_fmadd_ps(Ivec, Fvec_n[2], Ovec[2][2]); //cycle0 + 21
    Ovec[2][3] = _mm512_fmadd_ps(Ivec, Fvec_n[3], Ovec[2][3]); //cycle0 + 22

    Fvec[3] = _mm512_load_ps(F_ptr + 112);
    Ivec = _mm512_set1_ps(*(I_ptr + 49));
    Ovec[3][0] = _mm512_fmadd_ps(Ivec, Fvec_n[0], Ovec[3][0]);  //cycle0 + 22
    Ovec[3][1] = _mm512_fmadd_ps(Ivec, Fvec_n[1], Ovec[3][1]);  //cycle0 + 23
    Ovec[3][2] = _mm512_fmadd_ps(Ivec, Fvec_n[2], Ovec[3][2]);  //cycle0 + 23
    Ovec[3][3] = _mm512_fmadd_ps(Ivec, Fvec_n[3], Ovec[3][3]);  //cycle0 + 24

    F_ptr = F_ptr + 128;
    Ivec = _mm512_set1_ps(*(I_ptr + 65));
    Ovec[4][0] = _mm512_fmadd_ps(Ivec, Fvec_n[0], Ovec[4][0]); //cycle0 + 24
    Ovec[4][1] = _mm512_fmadd_ps(Ivec, Fvec_n[1], Ovec[4][1]); //cycle0 + 25
    Ovec[4][2] = _mm512_fmadd_ps(Ivec, Fvec_n[2], Ovec[4][2]); //cycle0 + 25
    Ovec[4][3] = _mm512_fmadd_ps(Ivec, Fvec_n[3], Ovec[4][3]); //cycle0 + 26

    Ivec = _mm512_set1_ps(*(I_ptr + 81));
    Ovec[5][0] = _mm512_fmadd_ps(Ivec, Fvec_n[0], Ovec[5][0]); //cycle0 + 26
    Ovec[5][1] = _mm512_fmadd_ps(Ivec, Fvec_n[1], Ovec[5][1]); //cycle0 + 27
    Ovec[5][2] = _mm512_fmadd_ps(Ivec, Fvec_n[2], Ovec[5][2]); //cycle0 + 27
    Ovec[5][3] = _mm512_fmadd_ps(Ivec, Fvec_n[3], Ovec[5][3]); //cycle0 + 27
    I_ptr = I_ptr + 1;
  }
   
  //the remain two interation
  Ivec = _mm512_set1_ps(*I_ptr);
  Ovec[0][0] = _mm512_fmadd_ps(Ivec, Fvec[0], Ovec[0][0]); //
  Ovec[0][1] = _mm512_fmadd_ps(Ivec, Fvec[1], Ovec[0][1]); //
  Ovec[0][2] = _mm512_fmadd_ps(Ivec, Fvec[2], Ovec[0][2]); //
  Ovec[0][3] = _mm512_fmadd_ps(Ivec, Fvec[3], Ovec[0][3]); //

  Ivec = _mm512_set1_ps(*(I_ptr + 16));
  Ovec[1][0] = _mm512_fmadd_ps(Ivec, Fvec[0], Ovec[1][0]); //
  Ovec[1][1] = _mm512_fmadd_ps(Ivec, Fvec[1], Ovec[1][1]); //
  Ovec[1][2] = _mm512_fmadd_ps(Ivec, Fvec[2], Ovec[1][2]); //
  Ovec[1][3] = _mm512_fmadd_ps(Ivec, Fvec[3], Ovec[1][3]); //

  Fvec_n[0] = _mm512_load_ps(F_ptr);
  Ivec = _mm512_set1_ps(*(I_ptr + 32));
  Ovec[2][0] = _mm512_fmadd_ps(Ivec, Fvec[0], Ovec[2][0]); //
  Ovec[2][1] = _mm512_fmadd_ps(Ivec, Fvec[1], Ovec[2][1]); //
  Ovec[2][2] = _mm512_fmadd_ps(Ivec, Fvec[2], Ovec[2][2]); //
  Ovec[2][3] = _mm512_fmadd_ps(Ivec, Fvec[2], Ovec[2][3]); //

  Fvec[1] = _mm512_load_ps(F_ptr + 16);
  Ivec = _mm512_set1_ps(*(I_ptr + 48));
  Ovec[3][0] = _mm512_fmadd_ps(Ivec, Fvec[0], Ovec[3][0]); //
  Ovec[3][1] = _mm512_fmadd_ps(Ivec, Fvec[1], Ovec[3][1]); //
  Ovec[3][2] = _mm512_fmadd_ps(Ivec, Fvec[2], Ovec[3][2]); //
  Ovec[3][3] = _mm512_fmadd_ps(Ivec, Fvec[3], Ovec[3][3]); //

  Fvec[2] = _mm512_load_ps(F_ptr + 32);
  Ivec = _mm512_set1_ps(*(I_ptr + 64));
  Ovec[4][0] = _mm512_fmadd_ps(Ivec, Fvec[0], Ovec[4][0]); //
  Ovec[4][1] = _mm512_fmadd_ps(Ivec, Fvec[1], Ovec[4][1]); //
  Ovec[4][2] = _mm512_fmadd_ps(Ivec, Fvec[2], Ovec[4][2]); //
  Ovec[4][3] = _mm512_fmadd_ps(Ivec, Fvec[3], Ovec[4][3]); //

  Fvec[3] = _mm512_load_ps(F_ptr + 48);
  Ivec = _mm512_set1_ps(*(I_ptr + 80));
  Ovec[5][0] = _mm512_fmadd_ps(Ivec, Fvec[0], Ovec[5][0]); //
  Ovec[5][1] = _mm512_fmadd_ps(Ivec, Fvec[1], Ovec[5][1]); //
  Ovec[5][2] = _mm512_fmadd_ps(Ivec, Fvec[2], Ovec[5][2]); //
  Ovec[5][3] = _mm512_fmadd_ps(Ivec, Fvec[3], Ovec[5][3]); //

  Ivec = _mm512_set1_ps(*(I_ptr + 1));
  Ovec[0][0] = _mm512_fmadd_ps(Ivec, Fvec_n[0], Ovec[0][0]); //
  Ovec[0][1] = _mm512_fmadd_ps(Ivec, Fvec_n[1], Ovec[0][1]); //
  Ovec[0][2] = _mm512_fmadd_ps(Ivec, Fvec_n[2], Ovec[0][2]); // 
  Ovec[0][3] = _mm512_fmadd_ps(Ivec, Fvec_n[3], Ovec[0][3]); //

  Ivec = _mm512_set1_ps(*(I_ptr + 17));
  Ovec[1][0] = _mm512_fmadd_ps(Ivec, Fvec_n[0], Ovec[1][0]); //
  Ovec[1][1] = _mm512_fmadd_ps(Ivec, Fvec_n[1], Ovec[1][1]); //
  Ovec[1][2] = _mm512_fmadd_ps(Ivec, Fvec_n[2], Ovec[1][2]); //
  Ovec[1][3] = _mm512_fmadd_ps(Ivec, Fvec_n[3], Ovec[1][3]); //

  Ivec = _mm512_set1_ps(*(I_ptr + 33));
  Ovec[2][0] = _mm512_fmadd_ps(Ivec, Fvec_n[0], Ovec[2][0]); //
  Ovec[2][1] = _mm512_fmadd_ps(Ivec, Fvec_n[1], Ovec[2][1]); //
  Ovec[2][2] = _mm512_fmadd_ps(Ivec, Fvec_n[2], Ovec[2][2]); //
  Ovec[2][3] = _mm512_fmadd_ps(Ivec, Fvec_n[3], Ovec[2][3]); //

  Ivec = _mm512_set1_ps(*(I_ptr + 49));
  Ovec[3][0] = _mm512_fmadd_ps(Ivec, Fvec_n[0], Ovec[3][0]); //
  Ovec[3][1] = _mm512_fmadd_ps(Ivec, Fvec_n[1], Ovec[3][1]); //
  Ovec[3][2] = _mm512_fmadd_ps(Ivec, Fvec_n[2], Ovec[3][2]); //
  Ovec[3][3] = _mm512_fmadd_ps(Ivec, Fvec_n[3], Ovec[3][3]); //

  Ivec = _mm512_set1_ps(*(I_ptr + 65));
  Ovec[4][0] = _mm512_fmadd_ps(Ivec, Fvec_n[0], Ovec[4][0]); //
  Ovec[4][1] = _mm512_fmadd_ps(Ivec, Fvec_n[1], Ovec[4][1]); //
  Ovec[4][2] = _mm512_fmadd_ps(Ivec, Fvec_n[2], Ovec[4][2]); //
  Ovec[4][3] = _mm512_fmadd_ps(Ivec, Fvec_n[3], Ovec[4][3]); //

  Ivec = _mm512_set1_ps(*(I_ptr + 81));
  Ovec[5][0] = _mm512_fmadd_ps(Ivec, Fvec_n[0], Ovec[5][0]); //
  Ovec[5][1] = _mm512_fmadd_ps(Ivec, Fvec_n[1], Ovec[5][1]); //
  Ovec[5][2] = _mm512_fmadd_ps(Ivec, Fvec_n[2], Ovec[5][2]); //
  Ovec[5][3] = _mm512_fmadd_ps(Ivec, Fvec_n[3], Ovec[5][3]); //

  //store the Cuax
  for (size_t i = 0; i < PQREG; ++i) {
    Ovec0 = _mm512_load_ps(O_ptr);
    Ovec1 = _mm512_load_ps(O_ptr + 16);
    Ovec2 = _mm512_load_ps(O_ptr + 32);
    Ovec3 = _mm512_load_ps(O_ptr + 48);
    _mm512_add_ps(Ovec0, Ovec[i][0]);
    _mm512_add_ps(Ovec1, Ovec[i][1]);
    _mm512_add_ps(Ovec2, Ovec[i][2]);
    _mm512_add_ps(Ovec3, Ovec[i][3]);
    _mm512_store_ps(O_ptr, Ovec[i][0]);
    _mm512_store_ps(O_ptr + 16, Ovec[i][1]);
    _mm512_store_ps(O_ptr + 32, Ovec[i][2]);
    _mm512_store_ps(O_ptr + 48, Ovec[i][3]);
    O_ptr = O_ptr + ldk;
  }
}

