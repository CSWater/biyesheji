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
/*
    (P, Q) ——→  (H, W)
    h = p * str_h + r
    w = q * str_w + s
    attention: if r != 0 or s != 0 (h, w) is not continuous in memory
    after pack, the I_pack looks like this :
   * ** ** ** ** ** ** ** **
   * (h0, w0) (h0, w1) (h0, w2) (h0, w3) (h0, w4) (h0, w5)      ********
   *   C0       C0       C0       C0       C0       C0          CBLOCK * PQREG
   *   C1       C1       C1       C1       C1       C1          Assuming CBLOCK = 128  PQREG = 6
   *   C2       C2       C2       C2       C2       C2
   *   C3       C3       C3       C3       C3       C3
   *   C4       C4       C4       C4       C4       C4
   *
   *
   *
   *  C126     C126     C126     C126     C126     C126
   *  C127     C127     C127     C127     C127     C127
   ************************************************
   each CBLOCK * PQREG block is continuous
   ************************************************
*/
void pack_pq(const float *I_start, float *I_pack, int p) {
  //float *I_ptr = I_pack;
  //float *ptr[PQREG];
  //for (size_t i = 0; i < CBLOCK; ++i) {
  //  for(size_t j = 0; j < PQREG; ++j) {
  //    I_ptr[i * PQREG + j] = *(ptr[j])[i];
  //  }
  //}
}
