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

#include"cnn.h"
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
        aligned =(void *)((((uintptr_t)buffer + alignment) & ~0x41) + alignment);
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
void zero_buf(float *buf, long size) {
    int i;
    for(i = 0; i < size; ++i) {
        buf[i] = 0.0f;
    }
}

void copy_buf(float *src, float *dst, long size) {
    int i;
    for(i = 0; i < size; ++i) {
        dst[i] = src[i];
    }
}

void init_buf(float *buf, long size, int initPos, int initOne) {
    int i;
    zero_buf(buf, size);
    for(i = 0; i < size; ++i) {
        buf[i] = (float)((initOne != 0) ? 1.0 : ((initPos != 0) ? drand48() : (0.05 - drand48()/10.0)));
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

