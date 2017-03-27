/*
 * =====================================================================================
 *
 *       Filename:  qblock.cpp
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  03/26/2017 08:24:28 PM
 *       Revision:  none
 *       Compiler:  gcc v4.9.4
 *
 *         Author:  WHUCSWater
			Email:	shuichaoyang@ncic.ac.cn
 *   Organization:  NCIC
 *
 * =====================================================================================
 */
#include"../../include/blitz_macro.h"
#include"../../include/kernel.h"

void pack_pq(const float *I_start, float *I_pack, int q_size) {
  float *I_temp = I_pack;
  const float *I_ptr;
  for(size_t bpq = 0; bpq < q_size; bpq += PQREG) {
    for(size_t c = 0; c < CBLOCK; c += VEC_LEN) { 
      I_ptr = I_start + c;
      for(size_t i = 0; i < PQREG; ++i) {
        for(size_t j = 0; j < VEC_LEN; ++j) {
          I_temp[i * VEC_LEN + j] = I_ptr[i * CBLOCK + j];
        }
      }
      I_temp = I_temp + PQREG * VEC_LEN;
    }
    //@TODO if C != CBLOCK
    I_start = I_start + PQREG * CBLOCK;
  }
  //deal with the remainder
  q_size = q_size % 6;
  if(q_size) {
    for(size_t c = 0; c < CBLOCK; c += VEC_LEN) {
      I_ptr = I_start + c;
      for(size_t i = 0; i < q_size; ++i) {
        for(size_t j = 0; j < VEC_LEN; ++j) {
          I_temp[i * VEC_LEN + j] = I_ptr[i * CBLOCK + j];
        }
      }
      I_temp = I_temp + PQREG * VEC_LEN;
    }
  }
}
