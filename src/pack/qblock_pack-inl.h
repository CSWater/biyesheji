#undef SRC_UTILS_VECTOR_QBLOCK_PACK_INL_H_
#ifndef SRC_UTILS_VECTOR_QBLOCK_PACK_INL_H_
#define SRC_UTILS_VECTOR_QBLOCK_PACK_INL_H_

//asm volatile(
//    "NOP\n\t": : :);

//size_t aq = iq;
//size_t ap = ip;
//for (size_t bpq = 0; bpq < PQBLOCK; ++bpq) {
//  int ih_index = static_cast<int>(ap * str_h) - static_cast<int>(pad_h) + static_cast<int>(r);
//  int iw_index = static_cast<int>(aq * str_w) - static_cast<int>(pad_w) + static_cast<int>(s);
//  if (ih_index >= 0 && ih_index < static_cast<int>(H) && iw_index >= 0 && iw_index < static_cast<int>(W)) {
//      for (size_t bc = 0; bc < rc; ++bc) {
//        I_pack[bpq * CBLOCK + bc] = ACCESS_INPUT_NHWC(n, ih_index, iw_index, (ic + bc));
//      }
//  }
//  else {
//    for (size_t bc = 0; bc < CBLOCK; ++bc) {
//      I_pack[bpq * CBLOCK + bc] = 0;
//    }
//  }
//  aq += 1;
//  if (aq >= Q) {
//    ap += 1;
//    aq = 0;
//  } 
//}

//assume there is no padding
size_t aq = iq;
size_t ap = ip;
size_t remain_w, real_pqreg;
const float *I_start = NULL;
float *I_temp = I_pack;
for(size_t bpq = 0; bpq < PQBLOCK; bpq += PQREG) {
  int ih = static_cast<int>(ap * str_h) + static_cast<int>(r);
  int iw = static_cast<int>(aq * str_w) + static_cast<int>(s);

  I_start = &ACCESS_INPUT_NHWC(n, ih, iw, 0); 

  remain_w = H * W - ih * W - iw;
  real_pqreg = remain_w > 6 ? 6 : remain_w;

  for(size_t k = 0; k < CBLOCK; k += VEC_LEN) { 
    I_start = I_start + VEC_LEN;
    for(size_t i = 0; i < real_pqreg; ++i) {
      for(size_t j = 0; j < VEC_LEN; ++j) {
        I_temp[i * VEC_LEN + j] = I_start[i * CBLOCK + j];
      }
    }
  }
  aq += 6;
  if( aq >= Q) {
    ap += 1;
    aq = aq - Q;
  }
}
#endif  // SRC_UTILS_VECTOR_QBLOCK_PACK_INL_H_
