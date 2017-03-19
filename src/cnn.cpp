/*
 * =====================================================================================
 *
 *       Filename:  cnn.cpp
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  02/21/2017 09:32:25 PM
 *       Revision:  none
 *       Compiler:  gcc v4.9.4
 *
 *         Author:  WHUCSWater
			Email:	shuichaoyang@ncic.ac.cn
 *   Organization:  NCIC
 *
 * =====================================================================================
 */

#include"../include/cnn.h"
#include"../include/blitz_macro.h"
#include<stdlib.h>
#include<stdint.h>

/********************************************
    internal functions
*********************************************/
int blitz_malloc(void **memory, size_t size, size_t alignment) {
    void *buffer = 0, *aligned = 0;
    size_t real_alignment = alignment << 1;
    buffer = malloc(size + real_alignment);
    if(buffer != 0) {
        aligned =(void *)((((uintptr_t)buffer + alignment) & ~(real_alignment - 1)) + alignment);
        *memory = aligned;
        /* store the unaligned address in the momery for free it later */
        *(uintptr_t *)((uintptr_t)aligned - sizeof(uintptr_t)) = (uintptr_t)buffer;
        return 0;
    } 
    else {
        return 1;
    }
}


/***********************************************
 * API
 * *********************************************/
void zero_buf(float *buf, size_t size) {
    int i;
    for(i = 0; i < size; ++i) {
        buf[i] = 0.0f;
    }
}

void copy_buf(float const *src, float *dst, size_t size) {
    size_t i;
    for(i = 0; i < size; ++i) {
        dst[i] = src[i];
    }
}

void copy_NCHW_to_NHWC(const float* nchw, float* nhwc, size_t N, size_t H, size_t W, size_t C) {
  size_t n, h, w, c;
  for ( n = 0; n < N; ++n ) {
    for ( h = 0; h < H; ++h ) {
      for ( w = 0; w < W; ++w ) {
        for ( c = 0; c < C; ++c ) {
          ACCESS(nhwc, n, h, w, c, H, W, C) = ACCESS(nchw, n, c, h, w, C, H, W);
        }
      }
    }
  }
}

void copy_NHWC_to_NCHW(const float* nhwc, float* nchw, size_t N, size_t H, size_t W, size_t C) {
  size_t n, h, w, c;
  for(n = 0; n < N; ++n) {
    for(h = 0; h < H; ++h) {
      for(w = 0; w < W; ++w) {
        for(c = 0; c < C; ++c) {
          ACCESS(nchw, n, c, h, w, C, H, W) = ACCESS(nhwc, n, h, w, c, H, W, C);
        }
      }
    }
  }
}

void copy_KCRS_to_RSCK(const float *kcrs, float *rsck, size_t R, size_t S, size_t C, size_t K) {
  size_t r, s, c, k;
  for ( r = 0; r < R; ++r ) {
    for ( s = 0; s < S; ++s) {
      for ( c = 0; c < C; ++c ) {
        for ( k = 0; k < K; ++k ) {
          ACCESS(rsck, r, s, c, k, S, C, K) = ACCESS(kcrs, k, c, r, s, C, R, S);
        }
      }
    }
  }
}

void copy_RSCK_to_KCRS(const float *rsck, float *kcrs, size_t R, size_t S, size_t C, size_t K) {
  size_t r, s, c, k;
  for ( r = 0; r < R; ++r ) {
    for ( s = 0; s < S; ++s ) {
      for ( c = 0; c < C; ++c ) {
        for ( k = 0; k < K; ++k ) {
          ACCESS(kcrs, k, c, r, s, C, R, S) = ACCESS(rsck, r, s, c, k, S, C, K); 
        }
      }
    }
  }
}

void init_buf(float *buf, size_t size) {
    size_t i;
    for(i = 0; i < size; ++i) {
        buf[i] = (0.5 + i * 0.00001) / 1000;
    }
}

void compare_buf(const float *buf_one, const float *buf_two, size_t size) {
  size_t i = 0;
  for(i = 0; i < size; ++i) {
    if(ABS(buf_one[i] - buf_two[i]) > EPSILON) {
       cout << "i: " << i << " " << buf_one[i] << " " <<  buf_two[i] << endl;  
    }
  }
}


/* aligned memory allocation */
void *blitz_aligned_malloc(size_t size, size_t alignment) {
    void *result = 0;
    return (0 == blitz_malloc(&result, size, alignment) ? result : 0);
}

/* free aligned memory allocation */
void blitz_aligned_free(void *memory) {
   /*   get the unaligned address  */
   void *buffer = (void *)(*(uintptr_t *)((uintptr_t)memory - sizeof(uintptr_t)));
   free(buffer);
}

