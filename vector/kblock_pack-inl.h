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
for (size_t bc = 0; bc < rc; ++bc) {
  for (size_t rk = 0; rk < K; ++rk) {
    F_pack[bc * K + rk] = ACCESS_FILTER_RSCK(r, s, (ic + bc), rk);
  }
}


