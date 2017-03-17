/*
 * =====================================================================================
 *
 *       Filename:  blitz_time.h
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  02/21/2017 02:46:33 PM
 *       Revision:  none
 *       Compiler:  gcc v4.9.4
 *
 *         Author:  WHUCSWater 
 *			Email:	shuichaoyang@ncic.ac.cn
 *   Organization:  NCIC
 *
 * =====================================================================================
 */
#ifndef _INCLUDE_BLITZ_TIEM_H_
#define _INCLUDE_BLITZ_TIME_H_

#if defined(_WIN32)
#include<Windows.h>
#elif defined(__GNUC__) || defined(__PGI) || defined(_CRAYC)
#include<sys/time.h>
#include<time.h>
#endif

unsigned long long blitz_timer_tick(void) {
#if defined(_WIN32)
    LARGE_INTEGER t;
    QueryPerformanceCounter(&t);
    return (unsigned long long)t.QuadPart;
#elif defined(CLOCK_MONOTONIC)
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC, &t);
    return 1000000000ULL * t.tv_sec + t.tv_nsec;
#else
    struct timeval t;
    gettimeofday(&t, 0);
    return 1000000ULL * t.tv_sec + t.tv_usec;
#endif
}

double blitz_timer_duration(unsigned long long start, unsigned long long end) {
    const double d = (double)(end - start);
#if defined(_WIN32)
    LARGER_INTEGER frequency;
    QueryPerformanceCounter(&frequency);
    return d / (double)frequency.QuadPart;
#elif defined(CLOCK_MONOTONIC)
    return d * 1E-9;
#else
    return d * 1E-6;
#endif
}

#endif
