#undef SRC_UTILS_VECTOR_CONVOLUTION_FORWARD_QBLOCK_AVX512_INL_H_
#ifndef SRC_UTILS_VECTOR_CONVOLUTION_FORWARD_QBLOCK_AVX512_INL_H_
#define SRC_UTILS_VECTOR_CONVOLUTION_FORWARD_QBLOCK_AVX512_INL_H_

for (size_t r = 0; r < R; ++r) {
  for (size_t s = 0; s < S; ++s) {
    for (size_t c = 0; c < C / CBLOCK; ++c) {
      size_t ic = c * CBLOCK;
      size_t rc = CBLOCK;
#ifdef TIME_ANALYSE
      asm volatile(
          "CPUID\n\t"
          "RDTSC\n\t"
          "mov %%edx, %0\n\t"
          "mov %%eax, %1\n\t": "=r"(cycles_high), "=r"(cycles_low): : "%rax", "%rbx", "%rcx", "%rdx"
          );
#endif
      #include "qblock_pack-inl.h"
#ifdef TIME_ANALYSE
       asm volatile(
          "RDTSCP\n\t"
          "mov %%edx, %0\n\t"
          "mov %%eax, %1\n\t"
          "CPUID\n\t": "=r"(cycles_high1), "=r"(cycles_low1): : "%rax", "%rbx", "%rcx", "%rdx"
          );
       start = (((unsigned long long)cycles_high << 32) | cycles_low);
       end = (((unsigned long long)cycles_high1 << 32) | cycles_low1);
       ptime_cost += end -start;
       cout << "Q block cycles: " << end - start << endl;
#endif
      for (size_t k = 0; k < K / (KREG * VEC_LEN); ++k) {
        size_t ik = k * (KREG * VEC_LEN);
#ifdef TIME_ANALYSE
        asm volatile(
            "CPUID\n\t"
            "RDTSC\n\t"
            "mov %%edx, %0\n\t"
            "mov %%eax, %1\n\t": "=r"(cycles_high), "=r"(cycles_low): : "%rax", "%rbx", "%rcx", "%rdx"
            );
#endif
      #include "kblock_pack-inl.h"
#ifdef TIME_ANALYSE
        asm volatile(
           "RDTSCP\n\t"
           "mov %%edx, %0\n\t"
           "mov %%eax, %1\n\t"
           "CPUID\n\t": "=r"(cycles_high1), "=r"(cycles_low1): : "%rax", "%rbx", "%rcx", "%rdx"
           );
        start = (((unsigned long long)cycles_high << 32) | cycles_low);
        end = (((unsigned long long)cycles_high1 << 32) | cycles_low1);
        cout << "K block cycles: " << end - start << endl;
        ktime_cost += end -start;
#endif
        for (size_t bpq = 0; bpq < PQBLOCK / PQREG; ++bpq) {
          /* zero output vector Ovec */
          #pragma unroll
          for (size_t rpq = 0; rpq < PQREG; ++rpq) {
            for (size_t rk = 0; rk < KREG; ++rk) {
              Ovec[rpq][rk] = _mm512_set1_ps(0);
            }
          }
          /* calculate a CBLOCK */
#ifdef TIME_ANALYSE
          asm volatile(
              "NOP\n\t"
              "NOP\n\t"
              "CPUID\n\t"
              "RDTSC\n\t"
              "mov %%edx, %0\n\t"
              "mov %%eax, %1\n\t": "=r"(cycles_high), "=r"(cycles_low): : "%rax", "%rbx", "%rcx", "%rdx"
              );
#endif
          for (size_t bc = 0; bc < CBLOCK; ++bc) {
            /* load filter vector Fvec */
            #pragma unroll
            for (size_t rk = 0; rk < KREG; ++rk) {
              //Fvec[rk] = _mm512_load_ps(ADDRESS_FILTER_RSCK(r, s, (ic + bc), ik + rk * VEC_LEN));
              //Fvec[rk] = _mm512_load_ps((F_pack + bc * K + ik + rk * VEC_LEN));
              Fvec[rk] = _mm512_load_ps((F_pack + bc * KREG * VEC_LEN + rk * VEC_LEN));
            }
            /* FMA */
            for (size_t rpq = 0; rpq < PQREG; ++rpq) {
              Ivec = _mm512_set1_ps(I_pack[ (bpq * PQREG + rpq) * CBLOCK + bc]);
              #pragma unroll
              for (size_t rk = 0; rk < KREG; ++rk) {
                Ovec[rpq][rk] = _mm512_fmadd_ps(Ivec, Fvec[rk], Ovec[rpq][rk]);
              }
            }
          }
#ifdef TIME_ANALYSE
          asm volatile(
             "RDTSCP\n\t"
             "mov %%edx, %0\n\t"
             "mov %%eax, %1\n\t"
             "CPUID\n\t": "=r"(cycles_high1), "=r"(cycles_low1): : "%rax", "%rbx", "%rcx", "%rdx"
             );
          start = (((unsigned long long)cycles_high << 32) | cycles_low);
          end = (((unsigned long long)cycles_high1 << 32) | cycles_low1);
          ftime_cost += end - start;
          cout << "FMA cycles: " << end - start << endl;
#endif
          /*  write output */
#ifdef TIME_ANALYSE
          asm volatile(
              "CPUID\n\t"
              "RDTSC\n\t"
              "mov %%edx, %0\n\t"
              "mov %%eax, %1\n\t": "=r"(cycles_high), "=r"(cycles_low): : "%rax", "%rbx", "%rcx", "%rdx"
              );
#endif
          aq = (iq + bpq * PQREG) % Q;
          ap = ip + (iq + bpq * PQREG) / Q;
          for (size_t rpq = 0; rpq < PQREG; ++rpq) {
            if (ap >= P) {
              break;
            }
            #pragma unroll
            for (size_t rk = 0; rk < KREG; ++rk) {
              _mm512_store_ps(ADDRESS_OUTPUT_NPQK(n, ap, aq, (ik + rk * VEC_LEN)),
                _mm512_add_ps(_mm512_load_ps(ADDRESS_OUTPUT_NPQK(n, ap, aq, (ik + rk * VEC_LEN))), Ovec[rpq][rk]));
            }
            aq += 1;
            if (aq >= Q) {
              ap += 1;
              aq = 0;
            } 
          }
          if (ap >= P) {
            break;
          }
#ifdef TIME_ANALYSE
          asm volatile(
             "RDTSCP\n\t"
             "mov %%edx, %0\n\t"
             "mov %%eax, %1\n\t"
             "CPUID\n\t": "=r"(cycles_high1), "=r"(cycles_low1): : "%rax", "%rbx", "%rcx", "%rdx"
             );
          start = (((unsigned long long)cycles_high << 32) | cycles_low);
          end = (((unsigned long long)cycles_high1 << 32) | cycles_low1);
          stime_cost += end -start;
          cout << "store cycles: " << end - start << endl;
#endif
        }/*   end of for(PQBLOCK, bpq) */
      }/*   end of for(K BLOCK, k)  */
    }/*   end of for(C BLOCK, c)  */
    size_t ic = C / CBLOCK * CBLOCK; 
    size_t rc = C - ic;
    if (rc > 0) {
      #include "qblock_pack-inl.h"
      for (size_t k = 0; k < K / (KREG * VEC_LEN); ++k) {
        size_t ik = k * (KREG * VEC_LEN);
        #include "kblock_pack-inl.h"
        for (size_t bpq = 0; bpq < PQBLOCK / PQREG; ++bpq) {
          #pragma unroll
          for (size_t rpq = 0; rpq < PQREG; ++rpq) {
            for (size_t rk = 0; rk < KREG; ++rk) {
              Ovec[rpq][rk] = _mm512_set1_ps(0);
            }
          }
          for (size_t bc = 0; bc < rc; ++bc) {
            #pragma unroll
            for (size_t rk = 0; rk < KREG; ++rk) {
              //Fvec[rk] = _mm512_load_ps(ADDRESS_FILTER_RSCK(r, s, (ic + bc), ik + rk * VEC_LEN));
              //Fvec[rk] = _mm512_load_ps((F_pack + bc * K + ik + rk * VEC_LEN));
              Fvec[rk] = _mm512_load_ps((F_pack + bc * KREG * VEC_LEN  + rk * VEC_LEN));
            }
            for (size_t rpq = 0; rpq < PQREG; ++rpq) {
              Ivec = _mm512_set1_ps(*(I_pack + (bpq * PQREG + rpq) * CBLOCK + bc));
              #pragma unroll
              for (size_t rk = 0; rk < KREG; ++rk) {
                Ovec[rpq][rk] = _mm512_fmadd_ps(Ivec, Fvec[rk], Ovec[rpq][rk]);
              }
            }
          }
          aq = (iq + bpq * PQREG) % Q;
          ap = ip + (iq + bpq * PQREG) / Q;
          for (size_t rpq = 0; rpq < PQREG; ++rpq) {
            if (ap >= P) {
              break;
            }
            #pragma unroll
            for (size_t rk = 0; rk < KREG; ++rk) {
              _mm512_store_ps(ADDRESS_OUTPUT_NPQK(n, ap, aq, (ik + rk * VEC_LEN)),
                _mm512_add_ps(_mm512_load_ps(ADDRESS_OUTPUT_NPQK(n, ap, aq, (ik + rk * VEC_LEN))), Ovec[rpq][rk]));
            }
            aq += 1;
            if (aq >= Q) {
              ap += 1;
              aq = 0;
            } 
          }
          if (ap >= P) {
            break;
          }
        }
      }
    }
  } /*  end of for(S)  */
}/*   end of for(R)  */

#endif  // SRC_UTILS_VECTOR_CONVOLUTION_FORWARD_SSE_QBLOCK_AVX512_INL_H_
