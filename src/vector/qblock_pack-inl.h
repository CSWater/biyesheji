#undef SRC_UTILS_VECTOR_QBLOCK_PACK_INL_H_
#ifndef SRC_UTILS_VECTOR_QBLOCK_PACK_INL_H_
#define SRC_UTILS_VECTOR_QBLOCK_PACK_INL_H_

//asm volatile(
//    "NOP\n\t": : :);

size_t aq = iq;
size_t ap = ip;
for (size_t bpq = 0; bpq < PQBLOCK; ++bpq) {
  int ih_index = static_cast<int>(ap * str_h) - static_cast<int>(pad_h) + static_cast<int>(r);
  int iw_index = static_cast<int>(aq * str_w) - static_cast<int>(pad_w) + static_cast<int>(s);
  if (ih_index >= 0 && ih_index < static_cast<int>(H) && iw_index >= 0 && iw_index < static_cast<int>(W)) {
      for (size_t bc = 0; bc < rc; ++bc) {
        I_pack[bpq * CBLOCK + bc] = ACCESS_INPUT_NHWC(n, ih_index, iw_index, (ic + bc));
      }
  }
  else {
    for (size_t bc = 0; bc < CBLOCK; ++bc) {
      I_pack[bpq * CBLOCK + bc] = 0;
    }
  }
  aq += 1;
  if (aq >= Q) {
    ap += 1;
    aq = 0;
  } 
}

//asm volatile(
//    "NOP\n\t": : :);
//size_t aq = iq;
//size_t ap = ip;
//for(size_t j = 0; j < rc; j += VEC_LEN) {
//  size_t ic_new = ic + j;
//  for (size_t bpq = 0; bpq < PQBLOCK; ++bpq) {
//    int ih = ap * str_h - pad_h + r;
//    int iw = aq * str_w - pad_w + s;
//    if (ih >= 0 && ih < H && iw >= 0 && iw < W) {
//      for( size_t i = 0; i < VEC_LEN; ++i) {
//        I_pack[PQBLOCK * j + i] = ACCESS_INPUT_NHWC(n, ih, iw, ic_new + i);
//      }
//    }  
//    aq += 1;
//    if (aq >= Q) {
//      ap += 1;
//      aq = 0;
//    } 
//  }
//}
#endif  // SRC_UTILS_VECTOR_QBLOCK_PACK_INL_H_
