/*
 * =====================================================================================
 *
 *       Filename:  kblock_pack-inl.h
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  03/04/2017 09:53:06 AM
 *       Revision:  none
 *       Compiler:  gcc v4.9.4
 *
 *         Author:  WHUCSWater 
 *			Email:	shuichaoyang@ncic.ac.cn
 *   Organization:  NCIC
 *
 * =====================================================================================
 */
//right pack
//for (size_t bc = 0; bc < rc; ++bc) {
//  for (size_t rk = 0; rk < KBLOCK; ++rk) {
//    F_pack[bc * KBLOCK + rk] = ACCESS_FILTER_RSCK(r, s, (ic + bc), rk);
//  }
//}


//const float *k_start = &ACCESS_FILTER_RSCK(r, s, ic, 0);
//for (size_t bc = 0; bc < rc; ++bc) {
//  for(size_t rk = 0; rk < KBLOCK; ++rk) {
//    //F_pack[bc * KBLOCK + rk] = ACCESS_FILTER_RSCK(r, s, (ic + bc), ik + rk);
//    //F_pack[bc * KBLOCK + rk] = ACCESS_FILTER_RSCK(r, s, (ic + bc), rk);
//    F_pack[bc * KBLOCK + rk] = *(k_start + bc * KBLOCK + rk);
//  }
//}

const float *k_start = &ACCESS_FILTER_RSCK(r, s, ic, 0);
float *F_temp = F_pack;
for(size_t i = 0; i < 3; ++i) {
  for (size_t bc = 0; bc < rc; ++bc) {
    for(size_t rk = 0; rk < 64; ++rk) {
      F_temp[bc * 64 + rk] = *(k_start + bc * KBLOCK + rk);
    }
  }
  k_start = k_start + 64;
  F_temp = F_temp + 64 * CBLOCK;
}
