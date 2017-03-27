/*
 * =====================================================================================
 *
 *       Filename:  kblock.cpp
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  03/26/2017 08:16:23 PM
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
void pack_k(const float *k_start, float *F_pack) {
  float *F_temp = F_pack;
  for(size_t i = 0; i < 3; ++i) {
    for (size_t bc = 0; bc < CBLOCK; ++bc) {
      for(size_t rk = 0; rk < 64; ++rk) {
        F_temp[bc * 64 + rk] = *(k_start + bc * KBLOCK + rk);
      }
    }
    k_start = k_start + 64;
    F_temp = F_temp + 64 * CBLOCK;
  }
}
