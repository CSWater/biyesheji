# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 17.0.1.132 Build 20161005";
# mark_description "-S -Wall -Wno-unused-parameter -Wunknown-pragmas -fPIC -O2 -xMIC-AVX512 -fopenmp -DTIME_ANALYSE";
	.file "blitz_forward.cpp"
	.text
..TXTST0:
# -- Begin  _Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm
	.text
# mark_begin;
# Threads 2
        .align    16,0x90
	.globl _Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm
# --- ConvolutionForwardVectorImpl(const float *, const float *, float *, size_t, size_t, size_t, size_t, size_t, size_t, size_t, size_t, size_t, size_t, size_t, size_t, size_t)
_Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
# parameter 5: %r8
# parameter 6: %r9
# parameter 7: 16 + %rbp
# parameter 8: 24 + %rbp
# parameter 9: 32 + %rbp
# parameter 10: 40 + %rbp
# parameter 11: 48 + %rbp
# parameter 12: 56 + %rbp
# parameter 13: 64 + %rbp
# parameter 14: 72 + %rbp
# parameter 15: 80 + %rbp
# parameter 16: 88 + %rbp
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x93,DW.ref.__gxx_personality_v0
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.1:
..L2:
                                                          #74.31
        pushq     %rbp                                          #74.31
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #74.31
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        andq      $-64, %rsp                                    #74.31
        subq      $53568, %rsp                                  #74.31 c1
        movq      %rbx, 64(%rsp)                                #74.31[spill] c3
        movq      %r15, 56(%rsp)                                #74.31[spill] c3
        vxorpd    %xmm1, %xmm1, %xmm1                           #95.39 c3
        movq      %r14, 48(%rsp)                                #74.31[spill] c5
        lea       8(%rbp), %rax                                 #74.31 c5
        movq      %r13, 40(%rsp)                                #74.31[spill] c7
        movq      32(%rax), %r10                                #74.31 c7
        movq      %r12, 32(%rsp)                                #74.31[spill] c9
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x00, 0x2f, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0x2e, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0x2e, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0x2e, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0x2e, 0xff, 0xff, 0x22
        movq      %r9, %rbx                                     #74.31 c9
        movq      %rcx, 96(%rsp)                                #74.31[spill] c11
        vmovsd    .L_2il0floatpacket.1(%rip), %xmm0             #95.21 c11
        movq      %rdx, 53416(%rsp)                             #74.31[spill] c13
        movq      %r8, %r12                                     #74.31 c13
        movq      %rsi, 18624(%rsp)                             #74.31[spill] c15
        testq     $63, %r10                                     #97.11 c15
        movq      %rdi, 18672(%rsp)                             #74.31[spill] c17
        movq      %r10, 53544(%rsp)                             #74.31[spill] c17
        vmovsd    %xmm0, 20416(%rsp)                            #95.21[spill] c19
        vmovsd    %xmm1, 53472(%rsp)                            #95.39[spill] c19
        vmovsd    %xmm1, 53440(%rsp)                            #95.57[spill] c25 stall 2
        vmovsd    %xmm1, 53408(%rsp)                            #95.93[spill] c25
        je        ..B1.5        # Prob 78%                      #97.11 c25
                                # LOE rbx r12
..B1.2:                         # Preds ..B1.1
                                # Execution count [2.20e-01]
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi                #98.11 c1
        lea       .L_2__STRING.0(%rip), %rsi                    #98.11 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.11:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #98.11
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.12:
                                # LOE rax rbx r12
..B1.3:                         # Preds ..B1.2
                                # Execution count [2.20e-01]
        movq      %rax, %rdi                                    #98.66 c1
        movl      $64, %esi                                     #98.66 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.13:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, int)
        call      _ZNSolsEi@PLT                                 #98.66
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.14:
                                # LOE rax rbx r12
..B1.4:                         # Preds ..B1.3
                                # Execution count [2.20e-01]
        movq      %rax, %rdi                                    #98.84 c1
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rsi #98.84 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.15:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E@PLT                          #98.84
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.16:
                                # LOE rbx r12
..B1.5:                         # Preds ..B1.1 ..B1.4
                                # Execution count [1.00e+00]
        movq      $0, 88(%rsp)                                  #104.17[spill] c1
        cmpq      $0, 96(%rsp)                                  #104.26[spill] c1
        jbe       ..B1.152      # Prob 10%                      #104.26 c3
                                # LOE rbx r12
..B1.6:                         # Preds ..B1.5
                                # Execution count [9.00e-01]
        movl      %ebx, 53552(%rsp)                             #10.52[spill] c1
        movq      48(%rbp), %rdx                                #74.31 c1
        movq      %rdx, 53536(%rsp)                             #74.31[spill] c5 stall 1
        movq      56(%rbp), %r8                                 #74.31 c5
        movq      %r8, 53488(%rsp)                              #13.37[spill] c9 stall 1
        movl      64(%rbp), %r10d                               #74.31 c9
        movl      %r10d, 53384(%rsp)                            #74.31[spill] c13 stall 1
        imulq     %r8, %rdx                                     #105.34 c13
        movq      %rdx, 80(%rsp)                                #105.34[spill] c17 stall 1
        movl      72(%rbp), %r11d                               #74.31 c17
        movl      %r11d, 20408(%rsp)                            #74.31[spill] c21 stall 1
        movq      $0xe38e38e38e38e38f, %rdi                     #105.38 c21
        movq      88(%rbp), %r14                                #74.31 c21
        movq      %r14, 53368(%rsp)                             #74.31[spill] c25 stall 1
        mulx      %rdi, %r15, %r10                              #105.38 c25
        xorl      %edx, %edx                                    #111.47 c25
        movq      24(%rbp), %rcx                                #74.31 c25
        movq      %rcx, 18616(%rsp)                             #74.31[spill] c29 stall 1
        shrq      $5, %r10                                      #105.38 c29
        movq      %r10, 104(%rsp)                               #105.38[spill] c31
        lea       (,%r10,4), %r11                               #110.37 c31
        movq      %r12, %r14                                    #167.21 c31
        movslq    %ebx, %r15                                    #10.3 c31
        movq      %r15, 53344(%rsp)                             #10.3[spill] c33
        lea       (%r11,%r11,8), %rax                           #110.37 c33
        shrq      $7, %r14                                      #167.21 c33
        movq      %r14, 20456(%rsp)                             #13.37[spill] c35
        divq      %r8                                           #111.47 c35
        movq      %rax, 20520(%rsp)                             #111.47[spill] c135 stall 49
        movq      80(%rbp), %r13                                #74.31 c135
        movq      %rdx, 20528(%rsp)                             #111.47[spill] c137
        movq      %r14, %r10                                    #167.30 c137
        movq      %r13, 53376(%rsp)                             #74.31[spill] c139
        movq      53544(%rsp), %r9                              #31.34[spill] c139
        shlq      $7, %r10                                      #167.30 c139
        movq      %r12, %r13                                    #168.17 c139
        vpxord    %zmm1, %zmm1, %zmm1                           #68.46 c139
        movq      32(%rbp), %rcx                                #74.31 c141
        movq      %rcx, 18664(%rsp)                             #13.37[spill] c145 stall 1
        movq      16(%rbp), %rsi                                #74.31 c145
        movl      %esi, 53456(%rsp)                             #11.54[spill] c147
        movslq    %esi, %r15                                    #11.5 c147
        movq      %r15, 20480(%rsp)                             #11.5[spill] c149
        lea       (,%r9,4), %rdi                                #30.40 c149
        movq      %rdi, 24(%rsp)                                #30.40[spill] c151
        subq      %r10, %r13                                    #168.17 c151
        movq      %rsi, 20320(%rsp)                             #13.37[spill] c151
        imulq     %rdi, %r10                                    #30.40 c151
        movq      %r13, 20488(%rsp)                             #13.37[spill] c153
        shlq      $2, %r12                                      #13.37 c153
        movq      %r12, 20312(%rsp)                             #13.37[spill] c155
        movq      %rcx, %rdi                                    #30.40 c155
        movq      %r14, %r15                                    #13.37 c155
        lea       (,%r13,4), %rdx                               # c155
        movq      %rdx, 20296(%rsp)                             #[spill] c157
        imulq     %r12, %rdi                                    #30.40 c157
        movq      %r9, %rax                                     #30.40 c157
        addq      18624(%rsp), %r10                             #30.40[spill] c157
        movq      %r10, 18600(%rsp)                             #13.37[spill] c159
        shlq      $9, %r15                                      #13.37 c159
        movq      20520(%rsp), %rcx                             #13.37[spill] c159
        imulq     %r12, %rax                                    #30.40 c161
        movq      %rax, 20360(%rsp)                             #13.37[spill] c165 stall 1
        movq      %r13, %r11                                    #12.7 c165
        movq      %r9, %rdx                                     #31.34 c165
        addq      18672(%rsp), %r15                             #13.37[spill] c165
        movq      %r15, 20304(%rsp)                             #13.37[spill] c167
        shrq      $1, %r11                                      #12.7 c167
        movq      %r11, 20336(%rsp)                             #13.37[spill] c169
        shrq      $6, %rdx                                      #31.34 c169
        movq      %rdx, 53424(%rsp)                             #13.37[spill] c171
        imulq     %r9, %rdi                                     #30.40 c171
        shlq      $9, %r9                                       #30.40 c171
        movq      %r9, 16(%rsp)                                 #13.37[spill] c173
        imulq     %rsi, %rbx                                    #13.37 c173
        movq      20528(%rsp), %rdx                             #13.37[spill] c173
        movq      104(%rsp), %r8                                #13.37[spill] c175
        xorl      %r13d, %r13d                                  #13.37 c175
        movq      80(%rsp), %rax                                #13.37[spill] c177
        movq      88(%rsp), %r11                                #13.37[spill] c179
        movq      96(%rsp), %r12                                #13.37[spill] c181
        movq      18616(%rsp), %rsi                             #13.37[spill] c183
                                # LOE rax rdx rcx rbx rsi rdi r8 r11 r12 r13 zmm1
..B1.7:                         # Preds ..B1.150 ..B1.6
                                # Execution count [5.03e+00]
        movq      %r13, %r9                                     #105.20 c1
        movq      %r9, %r10                                     #105.20 c3
        testq     %r8, %r8                                      #105.38 c3
        jbe       ..B1.95       # Prob 10%                      #105.38 c5
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 zmm1
..B1.8:                         # Preds ..B1.7
                                # Execution count [4.52e+00]
        movq      %rax, %r15                                    #141.46 c1
        movq      %rbx, 72(%rsp)                                #13.37[spill] c1
        movq      %rbx, %r14                                    #13.37 c1
        movq      %r11, 88(%rsp)                                #13.37[spill] c1
        imulq     %r11, %r15                                    #141.46 c3
        movq      %r15, 53512(%rsp)                             #13.37[spill] c7 stall 1
        imulq     %r11, %r14                                    #13.37 c7
        movq      %r14, 20328(%rsp)                             #13.37[spill] c11 stall 1
        movq      18672(%rsp), %rbx                             #13.37[spill] c11
        movq      18664(%rsp), %rcx                             #13.37[spill] c13
        movq      18600(%rsp), %r12                             #13.37[spill] c15
        movq      53488(%rsp), %r11                             #13.37[spill] c17
                                # LOE rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 zmm1
..B1.9:                         # Preds ..B1.224 ..B1.63 ..B1.8
                                # Execution count [2.52e+01]
        movq      %r10, %rax                                    #106.36 c1
        xorl      %edx, %edx                                    #106.36 c1
        divq      %r11                                          #106.36 c3
        movq      %rdx, %r14                                    #106.36 c103 stall 49
        movq      %rax, %rdx                                    #106.36 c103
        movq      %r13, %rax                                    #5.15 c105
        movq      %rax, %r15                                    #5.15 c107
        testq     %rsi, %rsi                                    #5.24 c107
        jbe       ..B1.224      # Prob 10%                      #5.24 c109
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 zmm1
..B1.10:                        # Preds ..B1.9
                                # Execution count [2.26e+01]
        movq      %r14, 53504(%rsp)                             #[spill] c1
        movq      %rax, %r8                                     # c1
        movq      %r10, 112(%rsp)                               #[spill] c1
        movq      18624(%rsp), %r14                             #[spill] c3
        movq      %r9, 120(%rsp)                                #[spill] c3
        movq      %r11, 53488(%rsp)                             #[spill] c5
                                # LOE rdx rcx rbx rsi rdi r8 r12 r13 r14 r15 zmm1
..B1.11:                        # Preds ..B1.62 ..B1.10
                                # Execution count [1.26e+02]
        movq      %r13, %rax                                    #6.17 c1
        testq     %rcx, %rcx                                    #6.26 c1
        jbe       ..B1.62       # Prob 10%                      #6.26 c3
                                # LOE rax rdx rcx rbx rsi rdi r8 r12 r13 r14 r15 zmm1
..B1.12:                        # Preds ..B1.11
                                # Execution count [1.13e+02]
        lea       (%r14,%r15), %r11                             #30.40 c1
        movq      %r15, 18632(%rsp)                             #8.92[spill] c1
        movl      %r8d, %r9d                                    #8.92 c1
        movl      %r9d, 53352(%rsp)                             #8.92[spill] c3
        lea       (%r12,%r15), %r10                             #30.40 c3
        movq      %r10, 20384(%rsp)                             #8.92[spill] c5
        movq      20488(%rsp), %r10                             #8.92[spill] c5
        movq      %r11, 18592(%rsp)                             #8.92[spill] c7
        movq      20456(%rsp), %r9                              #8.92[spill] c9
        movq      %r8, 18640(%rsp)                              #8.92[spill] c9
        movq      53416(%rsp), %r8                              #8.92[spill] c11
        movq      %rdi, 18608(%rsp)                             #8.92[spill] c13
        movq      %r12, 18600(%rsp)                             #8.92[spill] c15
        movq      53424(%rsp), %r12                             #8.92[spill] c15
                                # LOE rax rdx rcx rbx r8 r9 r10 r12 r13 zmm1
..B1.13:                        # Preds ..B1.60 ..B1.12
                                # Execution count [6.29e+02]
        movq      %r13, %r14                                    #7.19 c1
        movq      %rbx, %r15                                    #7.19 c1
        testq     %r9, %r9                                      #7.32 c3
        jbe       ..B1.59       # Prob 10%                      #7.32 c5
                                # LOE rax rdx rcx rbx r8 r9 r10 r12 r13 r14 r15 zmm1
..B1.14:                        # Preds ..B1.13
                                # Execution count [5.66e+02]
        movl      %eax, %esi                                    #9.92 c1
        movq      %rdx, 53496(%rsp)                             #9.92[spill] c1
        movq      %rax, 20392(%rsp)                             #9.92[spill] c1
        movl      %esi, 20400(%rsp)                             #9.92[spill] c3
        movq      %rcx, 18664(%rsp)                             #9.92[spill] c3
                                # LOE r12 r13 r14 r15
..B1.15:                        # Preds ..B1.57 ..B1.14
                                # Execution count [3.14e+03]
        cpuid                                                   #11.0
        rdtsc                                                   #11.0
        movl      %edx, %edi                                    #11.0
        movl      %eax, %r8d                                    #11.0
        movq      %r13, %rax                                    #7.1 c1
        movq      %r15, 20424(%rsp)                             #7.1[spill] c1
        movq      53504(%rsp), %rcx                             #5.13[spill] c3
        movl      %r8d, 20448(%rsp)                             #7.1[spill] c3
        movq      53496(%rsp), %rdx                             #6.13[spill] c5
        movl      %edi, 20440(%rsp)                             #7.1[spill] c7
        movl      53352(%rsp), %r12d                            #7.1[spill] c9
        movq      %r14, 20432(%rsp)                             #7.1[spill] c9
        movl      20400(%rsp), %r14d                            #7.1[spill] c11
        movl      20408(%rsp), %r9d                             #7.1[spill] c13
        movq      53368(%rsp), %r11                             #7.1[spill] c15
        movq      53376(%rsp), %r10                             #7.1[spill] c17
        movl      53384(%rsp), %edi                             #7.1[spill] c19
        movq      53488(%rsp), %r8                              #7.1[spill] c21
                                # LOE rax rdx rcx r8 r10 r11 r13 edi r9d r12d r14d
..B1.16:                        # Preds ..B1.23 ..B1.15
                                # Execution count [1.13e+05]
        movq      %r10, %rbx                                    #8.40 c1
        movq      %r11, %rsi                                    #9.40 c1
        imulq     %rdx, %rbx                                    #8.40 c3
        imulq     %rcx, %rsi                                    #9.40 c3
        subl      %edi, %ebx                                    #8.40 c7 stall 1
        subl      %r9d, %esi                                    #9.40 c7
        addl      %r14d, %esi                                   #9.92 c9
        addl      %r12d, %ebx                                   #8.92 c9
        js        ..B1.22       # Prob 16%                      #10.19 c11
                                # LOE rax rdx rcx r8 r10 r11 r13 ebx esi edi r9d r12d r14d
..B1.17:                        # Preds ..B1.16
                                # Execution count [9.51e+04]
        cmpl      53552(%rsp), %ebx                             #10.52[spill] c1
        jge       ..B1.22       # Prob 50%                      #10.52 c3
                                # LOE rax rdx rcx r8 r10 r11 r13 ebx esi edi r9d r12d r14d
..B1.18:                        # Preds ..B1.17
                                # Execution count [4.75e+04]
        testl     %esi, %esi                                    #11.21 c1
        js        ..B1.21       # Prob 16%                      #11.21 c3
                                # LOE rax rdx rcx r8 r10 r11 r13 ebx esi edi r9d r12d r14d
..B1.19:                        # Preds ..B1.18
                                # Execution count [3.99e+04]
        cmpl      53456(%rsp), %esi                             #11.54[spill] c1
        jge       ..B1.21       # Prob 50%                      #11.54 c3
                                # LOE rax rdx rcx r8 r10 r11 r13 ebx esi edi r9d r12d r14d
..B1.20:                        # Preds ..B1.19
                                # Execution count [8.99e+01]
        movslq    %ebx, %rbx                                    #13.9 c1
        movslq    %esi, %rsi                                    #13.9 c1
        imulq     20320(%rsp), %rbx                             #13.9[spill] c3
        movq      %rax, %r15                                    #13.9 c3
        shlq      $9, %r15                                      #13.9 c5
        addq      20328(%rsp), %rbx                             #13.9[spill] c7
        lea       128(%rsp,%r15), %r15                          #13.9 c7
        movq      %r15, 18648(%rsp)                             #13.9[spill] c9
        addq      %rsi, %rbx                                    #13.9 c9
        movl      $512, %r15d                                   #13.9 c9
        imulq     20312(%rsp), %rbx                             #13.9[spill] c11
        addq      20424(%rsp), %rbx                             #13.9[spill] c15 stall 1
                                # LOE rax rdx rcx rbx r8 r10 r11 r13 r15 edi r9d r12d r14d
..B1.228:                       # Preds ..B1.228 ..B1.20
                                # Execution count [1.80e+02]
        vmovups   -64(%rbx,%r15), %zmm0                         #13.9 c1
        movq      18648(%rsp), %rsi                             #13.9[spill] c1
        vmovups   %zmm0, -64(%rsi,%r15)                         #13.9 c7 stall 2
        vmovups   -128(%rbx,%r15), %zmm1                        #13.9 c7
        vmovups   %zmm1, -128(%rsi,%r15)                        #13.9 c13 stall 2
        vmovups   -192(%rbx,%r15), %zmm2                        #13.9 c13
        vmovups   %zmm2, -192(%rsi,%r15)                        #13.9 c19 stall 2
        vmovups   -256(%rbx,%r15), %zmm3                        #13.9 c19
        vmovups   %zmm3, -256(%rsi,%r15)                        #13.9 c25 stall 2
        subq      $256, %r15                                    #13.9 c25
        jne       ..B1.228      # Prob 50%                      #13.9 c27
        jmp       ..B1.23       # Prob 100%                     #13.9 c27
                                # LOE rax rdx rcx rbx r8 r10 r11 r13 r15 edi r9d r12d r14d
..B1.21:                        # Preds ..B1.18 ..B1.19
                                # Execution count [1.38e+02]
        movq      %rax, %rbx                                    #17.9 c1
        shlq      $9, %rbx                                      #17.9 c3
        lea       128(%rsp,%rbx), %rsi                          #17.9 c5
        movl      $512, %ebx                                    #17.9 c5
                                # LOE rax rdx rcx rbx rsi r8 r10 r11 r13 edi r9d r12d r14d
..B1.229:                       # Preds ..B1.21
                                # Execution count [1.38e+02]
        vpxord    %zmm0, %zmm0, %zmm0                           # c1
                                # LOE rax rdx rcx rbx rsi r8 r10 r11 r13 edi r9d r12d r14d zmm0
..B1.230:                       # Preds ..B1.230 ..B1.229
                                # Execution count [2.76e+02]
        vmovups   %zmm0, -64(%rsi,%rbx)                         #17.9 c1
        vmovups   %zmm0, -128(%rsi,%rbx)                        #17.9 c1
        vmovups   %zmm0, -192(%rsi,%rbx)                        #17.9 c7 stall 2
        vmovups   %zmm0, -256(%rsi,%rbx)                        #17.9 c7
        subq      $256, %rbx                                    #17.9 c7
        jne       ..B1.230      # Prob 50%                      #17.9 c9
        jmp       ..B1.23       # Prob 100%                     #17.9 c9
                                # LOE rax rdx rcx rbx rsi r8 r10 r11 r13 edi r9d r12d r14d zmm0
..B1.22:                        # Preds ..B1.16 ..B1.17
                                # Execution count [3.28e+02]
        movq      %rax, %rbx                                    #22.7 c1
        shlq      $9, %rbx                                      #22.7 c3
        lea       128(%rsp,%rbx), %rsi                          #22.7 c5
        movl      $512, %ebx                                    #22.7 c5
                                # LOE rax rdx rcx rbx rsi r8 r10 r11 r13 edi r9d r12d r14d
..B1.232:                       # Preds ..B1.22
                                # Execution count [3.28e+02]
        vpxord    %zmm0, %zmm0, %zmm0                           # c1
                                # LOE rax rdx rcx rbx rsi r8 r10 r11 r13 edi r9d r12d r14d zmm0
..B1.233:                       # Preds ..B1.233 ..B1.232
                                # Execution count [6.57e+02]
        vmovups   %zmm0, -64(%rsi,%rbx)                         #22.7 c1
        vmovups   %zmm0, -128(%rsi,%rbx)                        #22.7 c1
        vmovups   %zmm0, -192(%rsi,%rbx)                        #22.7 c7 stall 2
        vmovups   %zmm0, -256(%rsi,%rbx)                        #22.7 c7
        subq      $256, %rbx                                    #22.7 c7
        jne       ..B1.233      # Prob 50%                      #22.7 c9
                                # LOE rax rdx rcx rbx rsi r8 r10 r11 r13 edi r9d r12d r14d zmm0
..B1.23:                        # Preds ..B1.233 ..B1.230 ..B1.228
                                # Execution count [1.13e+05]
        addq      $1, %rcx                                      #25.3 c1
        addq      $1, %rax                                      #7.1 c1
        lea       1(%rdx), %rbx                                 #27.5 c1
        cmpq      %r8, %rcx                                     #27.5 c3
        cmovae    %rbx, %rdx                                    #27.5 c5
        cmovae    %r13, %rcx                                    #28.5 c5
        cmpq      $36, %rax                                     #7.1 c7
        jb        ..B1.16       # Prob 97%                      #7.1 c9
                                # LOE rax rdx rcx r8 r10 r11 r13 edi r9d r12d r14d
..B1.24:                        # Preds ..B1.23
                                # Execution count [3.14e+03]
        movl      20448(%rsp), %r8d                             #[spill] c1
        movl      20440(%rsp), %edi                             #[spill] c1
        shlq      $32, %rdi                                     #26.53 c1
        orq       %r8, %rdi                                     #26.59 c3
        movq      20424(%rsp), %r15                             #[spill] c5
        movq      20432(%rsp), %r14                             #[spill] c5
        movq      53424(%rsp), %r12                             #[spill] c9 stall 1
        rdtscp                                                  #20.0
        movl      %edx, %esi                                    #20.0
        movl      %eax, %r9d                                    #20.0
        cpuid                                                   #20.0
        movl      %esi, %ebx                                    #27.36 c11
        movl      %r9d, %r9d                                    #27.58 c11
        shlq      $32, %rbx                                     #27.52 c13
        lea       .L_2__STRING.1(%rip), %rsi                    #29.13 c13
        orq       %r9, %rbx                                     #27.58 c15
        subq      %rdi, %rbx                                    #28.22 c17
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi                #29.13 c17
        vcvtusi2sdq %rbx, %xmm16, %xmm16                        #28.27 c19
        vaddsd    20416(%rsp), %xmm16, %xmm0                    #28.8[spill] c21
        vmovsd    %xmm0, 20416(%rsp)                            #28.8[spill] c27 stall 2
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.17:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #29.13
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.18:
                                # LOE rax rbx r12 r13 r14 r15
..B1.25:                        # Preds ..B1.24
                                # Execution count [3.14e+03]
        movq      %rax, %rdi                                    #29.35 c1
        movq      %rbx, %rsi                                    #29.35 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.19:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, unsigned long long)
        call      _ZNSolsEy@PLT                                 #29.35
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.20:
                                # LOE rax r12 r13 r14 r15
..B1.26:                        # Preds ..B1.25
                                # Execution count [3.14e+03]
        movq      %rax, %rdi                                    #29.50 c1
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rsi #29.50 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.21:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E@PLT                          #29.50
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.22:
                                # LOE r12 r13 r14 r15
..B1.27:                        # Preds ..B1.26
                                # Execution count [3.14e+03]
        movq      %r13, %rax                                    #31.21 c1
        testq     %r12, %r12                                    #31.34 c1
        jbe       ..B1.57       # Prob 10%                      #31.34 c3
                                # LOE rax r12 r13 r14 r15
..B1.28:                        # Preds ..B1.27
                                # Execution count [0.00e+00]
        movq      20360(%rsp), %r10                             #30.40[spill] c1
        movq      %r15, 20424(%rsp)                             #30.40[spill] c1
        lea       .L_2__STRING.2(%rip), %r9                     #30.40 c1
        movq      %r14, 20432(%rsp)                             #30.40[spill] c3
        xorb      %r8b, %r8b                                    #30.40 c3
        lea       .L_2__STRING.3(%rip), %rsi                    #30.40 c3
        movq      16(%rsp), %rdx                                #8.23[spill] c5
        imulq     20392(%rsp), %r10                             #30.40[spill] c5
        movq      %rax, %r13                                    #30.40 c5
        imulq     %r14, %rdx                                    #8.23 c9 stall 1
        addq      18592(%rsp), %r10                             #30.40[spill] c9
        addq      %rdx, %r10                                    #30.40 c13 stall 1
        movq      %r10, 8(%rsp)                                 #30.40[spill] c15
                                # LOE r13
..B1.29:                        # Preds ..B1.55 ..B1.28
                                # Execution count [0.00e+00]
        cpuid                                                   #34.0
        rdtsc                                                   #34.0
        movl      %edx, %esi                                    #34.0
        movl      %eax, %r14d                                   #34.0
        xorl      %ecx, %ecx                                    #28.1 c1
        movl      %r14d, 53400(%rsp)                            #34.0[spill] c3
        movq      8(%rsp), %rdx                                 #30.40[spill] c3
        movl      %esi, 53392(%rsp)                             #34.0[spill] c5
        movq      %r13, %r14                                    #30.40 c5
        shlq      $8, %r14                                      #30.40 c7
        movq      24(%rsp), %rdi                                #30.40[spill] c7
        addq      %r14, %rdx                                    #30.40 c9
                                # LOE rdx rcx rdi r13 r14
..B1.30:                        # Preds ..B1.31 ..B1.29
                                # Execution count [5.80e+05]
        movq      %rdi, %rbx                                    #30.5 c1
        movq      %rcx, %rsi                                    #30.5 c1
        imulq     %rcx, %rbx                                    #30.5 c3
        shlq      $8, %rsi                                      #30.5 c3
        vmovups   (%rdx,%rbx), %zmm0                            #30.5 c7 stall 1
        vmovups   %zmm0, 20544(%rsp,%rsi)                       #30.5 c13 stall 2
        vmovups   64(%rdx,%rbx), %zmm1                          #30.5 c13
        vmovups   %zmm1, 20608(%rsp,%rsi)                       #30.5 c19 stall 2
        vmovups   128(%rdx,%rbx), %zmm2                         #30.5 c19
        vmovups   %zmm2, 20672(%rsp,%rsi)                       #30.5 c25 stall 2
        vmovups   192(%rdx,%rbx), %zmm3                         #30.5 c25
        vmovups   %zmm3, 20736(%rsp,%rsi)                       #30.5 c31 stall 2
                                # LOE rdx rcx rdi r13 r14
..B1.31:                        # Preds ..B1.30
                                # Execution count [1.16e+08]
        addq      $1, %rcx                                      #28.1 c1
        cmpq      $128, %rcx                                    #28.1 c3
        jb        ..B1.30       # Prob 99%                      #28.1 c5
                                # LOE rdx rcx rdi r13 r14
..B1.32:                        # Preds ..B1.31
                                # Execution count [1.57e+04]
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi                #51.14 c1
        rdtscp                                                  #43.0
        movl      %edx, %r15d                                   #43.0
        movl      %eax, %r12d                                   #43.0
        cpuid                                                   #43.0
        lea       .L_2__STRING.2(%rip), %rsi                    #51.14 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.23:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #51.14
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.24:
                                # LOE rax r13 r14 r12d r15d
..B1.33:                        # Preds ..B1.32
                                # Execution count [1.57e+04]
        movl      53392(%rsp), %ecx                             #49.39[spill] c1
        movl      53400(%rsp), %edx                             #49.60[spill] c1
        movl      %r15d, %r15d                                  #50.37 c1
        movl      %r12d, %r12d                                  #50.59 c1
        shlq      $32, %r15                                     #50.53 c3
        movq      %rax, %rdi                                    #51.36 c3
        shlq      $32, %rcx                                     #49.54 c5
        orq       %r12, %r15                                    #50.59 c5
        orq       %rdx, %rcx                                    #49.60 c7
        subq      %rcx, %r15                                    #51.39 c9
        movq      %r15, %rsi                                    #51.36 c11
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.25:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, unsigned long long)
        call      _ZNSolsEy@PLT                                 #51.36
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.26:
                                # LOE rax r13 r14 r15
..B1.34:                        # Preds ..B1.33
                                # Execution count [1.57e+04]
        movq      %rax, %rdi                                    #51.51 c1
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rsi #51.51 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.27:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E@PLT                          #51.51
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.28:
                                # LOE r13 r14 r15
..B1.35:                        # Preds ..B1.34
                                # Execution count [1.57e+04]
        vcvtusi2sdq %r15, %xmm16, %xmm16                        #52.28 c1
        addq      53416(%rsp), %r14                             #141.46[spill] c1
        xorb      %dl, %dl                                      #54.25 c1
        lea       128(%rsp), %rcx                               #104.39 c1
        movq      %rcx, 53336(%rcx)                             #104.39[spill] c3
        vaddsd    53408(%rsp), %xmm16, %xmm0                    #52.9[spill] c3
        movq      %r14, 53400(%rcx)                             #104.39[spill] c5
        xorl      %r12d, %r12d                                  #54.25 c5
        movb      %dl, 53320(%rcx)                              #104.39[spill] c7
        vmovsd    %xmm0, 53408(%rsp)                            #52.9[spill] c9
        movq      %r13, 53304(%rcx)                             #104.39[spill] c9
                                # LOE r12
..B1.36:                        # Preds ..B1.53 ..B1.35
                                # Execution count [4.72e+04]
        nop                                                     #57.0
        cpuid                                                   #57.0
        rdtsc                                                   #57.0
        movl      %edx, %r15d                                   #57.0
        movl      %eax, %r13d                                   #57.0
#        vpxord    %zmm0, %zmm0, %zmm0                           #68.15 c1
#        vmovups   %zmm0, 18752(%rsp)                            #68.15 c3
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi                #80.14 c3
        movl      %r13d, 53480(%rsp)                            #57.0[spill] c7 stall 1
        lea       .L_2__STRING.3(%rip), %rsi                    #80.14 c7
#        vmovups   %zmm0, 18816(%rsp)                            #68.15 c9
#        vmovups   %zmm0, 18880(%rsp)                            #68.15 c9
#        vmovups   %zmm0, 18944(%rsp)                            #68.15 c15 stall 2
#        vmovups   %zmm0, 19008(%rsp)                            #68.15 c15
#        vmovups   %zmm0, 19072(%rsp)                            #68.15 c21 stall 2
#        vmovups   %zmm0, 19136(%rsp)                            #68.15 c21
#        vmovups   %zmm0, 19200(%rsp)                            #68.15 c27 stall 2
#        vmovups   %zmm0, 19264(%rsp)                            #68.15 c27
#        vmovups   %zmm0, 19328(%rsp)                            #68.15 c33 stall 2
#        vmovups   %zmm0, 19392(%rsp)                            #68.15 c33
#        vmovups   %zmm0, 19456(%rsp)                            #68.15 c39 stall 2
#        vmovups   %zmm0, 19520(%rsp)                            #68.15 c39
#        vmovups   %zmm0, 19584(%rsp)                            #68.15 c45 stall 2
#        vmovups   %zmm0, 19648(%rsp)                            #68.15 c45
#        vmovups   %zmm0, 19712(%rsp)                            #68.15 c51 stall 2
#        vmovups   %zmm0, 19776(%rsp)                            #68.15 c51
#        vmovups   %zmm0, 19840(%rsp)                            #68.15 c57 stall 2
#        vmovups   %zmm0, 19904(%rsp)                            #68.15 c57
#        vmovups   %zmm0, 19968(%rsp)                            #68.15 c63 stall 2
#        vmovups   %zmm0, 20032(%rsp)                            #68.15 c63
#        vmovups   %zmm0, 20096(%rsp)                            #68.15 c69 stall 2
#        vmovups   %zmm0, 20160(%rsp)                            #68.15 c69
#        vmovups   %zmm0, 20224(%rsp)                            #68.15 c75 stall 2
        rdtscp                                                  #72.0
        movl      %edx, %r13d                                   #72.0
        movl      %eax, %r14d                                   #72.0
        cpuid                                                   #72.0
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.29:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #80.14
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.30:
                                # LOE rax r12 r13d r14d r15d
..B1.260:                       # Preds ..B1.36
                                # Execution count [4.72e+04]
        movq      %rax, %rdi                                    #80.14 c1
                                # LOE rdi r12 r13d r14d r15d
..B1.37:                        # Preds ..B1.260
                                # Execution count [4.72e+04]
        movl      53480(%rsp), %eax                             #80.33[spill] c1
        movl      %r13d, %r13d                                  #80.33 c1
        movl      %r15d, %r15d                                  #80.33 c1
        shlq      $32, %r13                                     #80.33 c3
        movl      %r14d, %r14d                                  #80.33 c3
        shlq      $32, %r15                                     #80.33 c5
        orq       %r14, %r13                                    #80.33 c5
        orq       %rax, %r15                                    #80.33 c7
        subq      %r15, %r13                                    #80.33 c9
        movq      %r13, %rsi                                    #80.33 c11
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.31:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, unsigned long long)
        call      _ZNSolsEy@PLT                                 #80.33
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.32:
                                # LOE rax r12
..B1.38:                        # Preds ..B1.37
                                # Execution count [4.72e+04]
        movq      %rax, %rdi                                    #80.48 c1
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rsi #80.48 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.33:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E@PLT                          #80.48
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.34:
                                # LOE r12
..B1.39:                        # Preds ..B1.38
                                # Execution count [4.72e+04]
        nop                                                     #85.0
        nop                                                     #85.0
        cpuid                                                   #85.0
        rdtsc                                                   #85.0
        movl      %edx, %edi                                    #85.0
        movl      %eax, %r8d                                    #85.0
        xorl      %ecx, %ecx                                    #94.11 c1
        xorl      %edx, %edx                                    #97.13 c1
        vpxord    %zmm0, %zmm0, %zmm0                           #68.15 c1
        vpxord    %zmm1, %zmm1, %zmm1                           #68.15 c1
        vpxord    %zmm2, %zmm2, %zmm2                           #68.15 c1
        vpxord    %zmm3, %zmm3, %zmm3                           #68.15 c1
        vpxord    %zmm4, %zmm4, %zmm4                           #68.15 c1
        vpxord    %zmm5, %zmm5, %zmm5                           #68.15 c1
        vpxord    %zmm6, %zmm6, %zmm6                           #68.15 c1
        vpxord    %zmm7, %zmm7, %zmm7                           #68.15 c1
        vpxord    %zmm8, %zmm8, %zmm8                           #68.15 c1
        vpxord    %zmm9, %zmm9, %zmm9                           #68.15 c1
        vpxord    %zmm10, %zmm10, %zmm10                           #68.15 c1
        vpxord    %zmm11, %zmm11, %zmm11                           #68.15 c1
        vpxord    %zmm12, %zmm12, %zmm12                           #68.15 c1
        vpxord    %zmm13, %zmm13, %zmm13                           #68.15 c1
        vpxord    %zmm14, %zmm14, %zmm14                           #68.15 c1
        vpxord    %zmm15, %zmm15, %zmm15                           #68.15 c1
        vpxord    %zmm16, %zmm16, %zmm16                           #68.15 c1
        vpxord    %zmm17, %zmm17, %zmm17                           #68.15 c1
        vpxord    %zmm18, %zmm18, %zmm18                           #68.15 c1
        vpxord    %zmm19, %zmm19, %zmm19                           #68.15 c1
        vpxord    %zmm20, %zmm20, %zmm20                           #68.15 c1
        vpxord    %zmm21, %zmm21, %zmm21                           #68.15 c1
        vpxord    %zmm22, %zmm22, %zmm22                           #68.15 c1
        vpxord    %zmm23, %zmm23, %zmm23                           #68.15 c1
#        vmovups   18752(%rsp), %zmm23                           #107.33 c1
#        vmovups   18816(%rsp), %zmm22                           #107.33 c3
#        vmovups   18880(%rsp), %zmm21                           #107.33 c7 stall 1
#        vmovups   18944(%rsp), %zmm20                           #107.33 c9
#        vmovups   19008(%rsp), %zmm19                           #107.33 c13 stall 1
#        vmovups   19072(%rsp), %zmm18                           #107.33 c15
#        vmovups   19136(%rsp), %zmm17                           #107.33 c19 stall 1
#        vmovups   19200(%rsp), %zmm16                           #107.33 c21
#        vmovups   19264(%rsp), %zmm15                           #107.33 c25 stall 1
#        vmovups   19328(%rsp), %zmm14                           #107.33 c27
#        vmovups   19392(%rsp), %zmm13                           #107.33 c31 stall 1
#        vmovups   19456(%rsp), %zmm12                           #107.33 c33
#        vmovups   19520(%rsp), %zmm11                           #107.33 c37 stall 1
#        vmovups   19584(%rsp), %zmm10                           #107.33 c39
#        vmovups   19648(%rsp), %zmm9                            #107.33 c43 stall 1
#        vmovups   19712(%rsp), %zmm8                            #107.33 c45
#        vmovups   19776(%rsp), %zmm7                            #107.33 c49 stall 1
#        vmovups   19840(%rsp), %zmm6                            #107.33 c51
#        vmovups   19904(%rsp), %zmm5                            #107.33 c55 stall 1
#        vmovups   19968(%rsp), %zmm4                            #107.33 c57
#        vmovups   20032(%rsp), %zmm3                            #107.33 c61 stall 1
#        vmovups   20096(%rsp), %zmm2                            #107.33 c63
#        vmovups   20160(%rsp), %zmm1                            #107.33 c67 stall 1
#        vmovups   20224(%rsp), %zmm0                            #107.33 c69
        movq      53464(%rsp), %rax                             #104.39[spill] c73 stall 1
                                # LOE rax rdx r12 ecx edi r8d zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 zmm8 zmm9 zmm10 zmm11 zmm12 zmm13 zmm14 zmm15 zmm16 zmm17 zmm18 zmm19 zmm20 zmm21 zmm22 zmm23
..B1.40:                        # Preds ..B1.40 ..B1.39
                                # Execution count [6.04e+06]
        vmovups   20544(%rsp,%rdx), %zmm24                      #100.42 c1
        vmovups   20608(%rsp,%rdx), %zmm25                      #100.42 c1
        addl      $1, %ecx                                      #94.11 c1
        vmovups   20672(%rsp,%rdx), %zmm26                      #100.42 c7 stall 2
        vmovups   20736(%rsp,%rdx), %zmm27                      #100.42 c7
        addq      $256, %rdx                                    #94.11 c7
        vfmadd231ps (%rax){1to16}, %zmm24, %zmm23               #107.33 c13 stall 2
        vfmadd231ps (%rax){1to16}, %zmm25, %zmm22               #107.33 c13
        vfmadd231ps (%rax){1to16}, %zmm26, %zmm21               #107.33 c19 stall 2
        vfmadd231ps (%rax){1to16}, %zmm27, %zmm20               #107.33 c19
        vfmadd231ps 512(%rax){1to16}, %zmm24, %zmm19            #107.33 c25 stall 2
        vfmadd231ps 512(%rax){1to16}, %zmm25, %zmm18            #107.33 c25
        vfmadd231ps 512(%rax){1to16}, %zmm26, %zmm17            #107.33 c31 stall 2
        vfmadd231ps 512(%rax){1to16}, %zmm27, %zmm16            #107.33 c31
        vfmadd231ps 1024(%rax){1to16}, %zmm24, %zmm15           #107.33 c37 stall 2
        vfmadd231ps 1024(%rax){1to16}, %zmm25, %zmm14           #107.33 c37
        vfmadd231ps 1024(%rax){1to16}, %zmm26, %zmm13           #107.33 c43 stall 2
        vfmadd231ps 1024(%rax){1to16}, %zmm27, %zmm12           #107.33 c43
        vfmadd231ps 1536(%rax){1to16}, %zmm24, %zmm11           #107.33 c49 stall 2
        vfmadd231ps 1536(%rax){1to16}, %zmm25, %zmm10           #107.33 c49
        vfmadd231ps 1536(%rax){1to16}, %zmm26, %zmm9            #107.33 c55 stall 2
        vfmadd231ps 1536(%rax){1to16}, %zmm27, %zmm8            #107.33 c55
        vfmadd231ps 2048(%rax){1to16}, %zmm24, %zmm7            #107.33 c61 stall 2
        vfmadd231ps 2048(%rax){1to16}, %zmm25, %zmm6            #107.33 c61
        vfmadd231ps 2048(%rax){1to16}, %zmm26, %zmm5            #107.33 c67 stall 2
        vfmadd231ps 2048(%rax){1to16}, %zmm27, %zmm4            #107.33 c67
        vfmadd231ps 2560(%rax){1to16}, %zmm24, %zmm3            #107.33 c73 stall 2
        vfmadd231ps 2560(%rax){1to16}, %zmm25, %zmm2            #107.33 c73
        vfmadd231ps 2560(%rax){1to16}, %zmm26, %zmm1            #107.33 c79 stall 2
        vfmadd231ps 2560(%rax){1to16}, %zmm27, %zmm0            #107.33 c79
        addq      $4, %rax                                      #94.11 c79
        cmpl      $128, %ecx                                    #94.11 c79
        jb        ..B1.40       # Prob 99%                      #94.11 c81
                                # LOE rax rdx r12 ecx edi r8d zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 zmm8 zmm9 zmm10 zmm11 zmm12 zmm13 zmm14 zmm15 zmm16 zmm17 zmm18 zmm19 zmm20 zmm21 zmm22 zmm23
..B1.41:                        # Preds ..B1.40
                                # Execution count [4.72e+04]
        vmovups   %zmm2, 20096(%rsp)                            #192.17 c1
        movl      %edi, %edi                                    #118.41 c1
        vmovups   %zmm3, 20032(%rsp)                            #192.17 c1
        movl      %r8d, %r8d                                    #118.62 c1
        vmovups   %zmm0, 20224(%rsp)                            #192.17 c7 stall 2
        shlq      $32, %rdi                                     #118.56 c7
        vmovups   %zmm1, 20160(%rsp)                            #192.17 c7
        lea       .L_2__STRING.4(%rip), %rsi                    #121.16 c7
        vmovups   %zmm4, 19968(%rsp)                            #192.17 c13 stall 2
        orq       %r8, %rdi                                     #118.62 c13
        vmovups   %zmm5, 19904(%rsp)                            #192.17 c13
        vmovups   %zmm6, 19840(%rsp)                            #192.17 c19 stall 2
        vmovups   %zmm7, 19776(%rsp)                            #192.17 c19
        vmovups   %zmm8, 19712(%rsp)                            #192.17 c25 stall 2
        vmovups   %zmm9, 19648(%rsp)                            #192.17 c25
        vmovups   %zmm10, 19584(%rsp)                           #192.17 c31 stall 2
        vmovups   %zmm11, 19520(%rsp)                           #192.17 c31
        vmovups   %zmm12, 19456(%rsp)                           #192.17 c37 stall 2
        vmovups   %zmm13, 19392(%rsp)                           #192.17 c37
        vmovups   %zmm14, 19328(%rsp)                           #192.17 c43 stall 2
        vmovups   %zmm15, 19264(%rsp)                           #192.17 c43
        vmovups   %zmm16, 19200(%rsp)                           #192.17 c49 stall 2
        vmovups   %zmm17, 19136(%rsp)                           #192.17 c49
        vmovups   %zmm18, 19072(%rsp)                           #192.17 c55 stall 2
        vmovups   %zmm19, 19008(%rsp)                           #192.17 c55
        vmovups   %zmm20, 18944(%rsp)                           #192.17 c61 stall 2
        vmovups   %zmm21, 18880(%rsp)                           #192.17 c61
        vmovups   %zmm22, 18816(%rsp)                           #192.17 c67 stall 2
        vmovups   %zmm23, 18752(%rsp)                           #192.17 c67
        rdtscp                                                  #112.0
        movl      %edx, %r13d                                   #112.0
        movl      %eax, %r9d                                    #112.0
        cpuid                                                   #112.0
        movl      %r13d, %r13d                                  #119.39 c75
        movl      %r9d, %r9d                                    #119.61 c75
        shlq      $32, %r13                                     #119.55 c77
        orq       %r9, %r13                                     #119.61 c79
        subq      %rdi, %r13                                    #120.25 c81
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi                #121.16 c81
        vcvtusi2sdq %r13, %xmm16, %xmm16                        #120.31 c83
        vaddsd    53472(%rsp), %xmm16, %xmm0                    #120.11[spill] c85
        vmovsd    %xmm0, 53472(%rsp)                            #120.11[spill] c91 stall 2
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.35:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #121.16
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.36:
                                # LOE rax r12 r13
..B1.42:                        # Preds ..B1.41
                                # Execution count [4.72e+04]
        movq      %rax, %rdi                                    #121.34 c1
        movq      %r13, %rsi                                    #121.34 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.37:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, unsigned long long)
        call      _ZNSolsEy@PLT                                 #121.34
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.38:
                                # LOE rax r12
..B1.43:                        # Preds ..B1.42
                                # Execution count [4.72e+04]
        movq      %rax, %rdi                                    #121.49 c1
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rsi #121.49 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.39:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E@PLT                          #121.49
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.40:
                                # LOE r12
..B1.44:                        # Preds ..B1.43
                                # Execution count [4.72e+04]
        cpuid                                                   #125.0
        rdtsc                                                   #125.0
        movl      %edx, %edi                                    #125.0
        movl      %eax, %r8d                                    #125.0
        xorl      %edx, %edx                                    #132.37 c1
        movq      %r12, 53520(%rsp)                             #135.13[spill] c1
        xorl      %r14d, %r14d                                  #135.13 c1
        movq      53504(%rsp), %rcx                             #132.28[spill] c3
        movq      53528(%rsp), %r10                             #135.13[spill] c3
        lea       (%rcx,%r12), %rax                             #132.28 c7 stall 1
        movq      53488(%rsp), %rcx                             #133.11[spill] c7
        divq      53488(%rsp)                                   #132.37[spill] c9
        movq      53512(%rsp), %r11                             #135.13[spill] c11
        movq      53488(%rsp), %r12                             #135.13[spill] c15 stall 1
        movq      53536(%rsp), %r13                             #135.13[spill] c19 stall 1
        movq      53544(%rsp), %r15                             #135.13[spill] c23 stall 1
        movq      %rax, %rsi                                    #132.37 c109 stall 42
        movq      %rdx, %rbx                                    #132.37 c109
        addq      53496(%rsp), %rsi                             #133.42[spill] c111
        xorl      %edx, %edx                                    #134.11 c111
        xorl      %eax, %eax                                    #135.13 c111
        imulq     %rsi, %rcx                                    #133.11 c113
                                # LOE rax rdx rcx rbx rsi r10 r11 r12 r13 r14 r15 edi r8d
..B1.45:                        # Preds ..B1.48 ..B1.47 ..B1.44
                                # Execution count [1.42e+05]
        cmpq      %r13, %rsi                                    #135.23 c1
        jae       ..B1.54       # Prob 20%                      #135.23 c3
                                # LOE rax rdx rcx rbx rsi r10 r11 r12 r13 r14 r15 edi r8d
..B1.46:                        # Preds ..B1.45
                                # Execution count [1.13e+05]
        lea       (%rbx,%r11), %r9                              #141.46 c1
        addq      $1, %rbx                                      #143.13 c1
        addq      $1, %rdx                                      #134.11 c1
        addq      %rcx, %r9                                     #141.46 c3
        imulq     %r15, %r9                                     #141.46 c5
        vmovups   (%r10,%r9,4), %zmm0                           #141.46 c9 stall 1
        vmovups   64(%r10,%r9,4), %zmm2                         #141.46 c9
        vmovups   128(%r10,%r9,4), %zmm4                        #141.46 c15 stall 2
        vmovups   192(%r10,%r9,4), %zmm6                        #141.46 c15
        vaddps    18752(%rsp,%rax), %zmm0, %zmm1                #141.17 c21 stall 2
        vmovups   %zmm1, (%r10,%r9,4)                           #140.31 c27 stall 2
        vaddps    18816(%rsp,%rax), %zmm2, %zmm3                #141.17 c27
        vmovups   %zmm3, 64(%r10,%r9,4)                         #140.31 c33 stall 2
        vaddps    18880(%rsp,%rax), %zmm4, %zmm5                #141.17 c33
        vmovups   %zmm5, 128(%r10,%r9,4)                        #140.31 c39 stall 2
        vaddps    18944(%rsp,%rax), %zmm6, %zmm7                #141.17 c39
        vmovups   %zmm7, 192(%r10,%r9,4)                        #140.31 c45 stall 2
        addq      $256, %rax                                    #134.11 c45
        cmpq      %r12, %rbx                                    #144.23 c45
        jb        ..B1.48       # Prob 38%                      #144.23 c47
                                # LOE rax rdx rcx rbx rsi r10 r11 r12 r13 r14 r15 edi r8d
..B1.47:                        # Preds ..B1.46
                                # Execution count [7.02e+04]
        addq      %r12, %rcx                                    #145.15 c1
        addq      $1, %rsi                                      #145.15 c1
        movq      %r14, %rbx                                    #146.15 c3
        cmpq      $6, %rdx                                      #134.11 c3
        jb        ..B1.45       # Prob 83%                      #134.11 c5
        jmp       ..B1.221      # Prob 100%                     #134.11 c5
                                # LOE rax rdx rcx rbx rsi r10 r11 r12 r13 r14 r15 edi r8d
..B1.48:                        # Preds ..B1.46
                                # Execution count [4.30e+04]
        cmpq      $6, %rdx                                      #134.11 c1
        jb        ..B1.45       # Prob 83%                      #134.11 c3
                                # LOE rax rdx rcx rbx rsi r10 r11 r12 r13 r14 r15 edi r8d
..B1.49:                        # Preds ..B1.48
                                # Execution count [7.17e+03]: Infreq
        movq      %r10, 53528(%rsp)                             #[spill] c1
        movq      53520(%rsp), %r12                             #[spill] c1
                                # LOE r12 edi r8d
..B1.50:                        # Preds ..B1.49 ..B1.221
                                # Execution count [3.77e+04]: Infreq
        rdtscp                                                  #153.0
        movl      %edx, %r13d                                   #153.0
        movl      %eax, %r9d                                    #153.0
        cpuid                                                   #153.0
        movl      %edi, %edi                                    #159.41 c1
        movl      %r8d, %r8d                                    #159.62 c1
        movl      %r13d, %r13d                                  #160.39 c3
        movl      %r9d, %r9d                                    #160.61 c3
        shlq      $32, %r13                                     #160.55 c5
        shlq      $32, %rdi                                     #159.56 c5
        orq       %r9, %r13                                     #160.61 c7
        orq       %r8, %rdi                                     #159.62 c7
        subq      %rdi, %r13                                    #161.25 c9
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi                #162.16 c9
        lea       .L_2__STRING.5(%rip), %rsi                    #162.16 c9
        vcvtusi2sdq %r13, %xmm16, %xmm16                        #161.30 c11
        vaddsd    53440(%rsp), %xmm16, %xmm0                    #161.11[spill] c13
        vmovsd    %xmm0, 53440(%rsp)                            #161.11[spill] c19 stall 2
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.41:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #162.16
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.42:
                                # LOE rax r12 r13
..B1.51:                        # Preds ..B1.50
                                # Execution count [3.77e+04]: Infreq
        movq      %rax, %rdi                                    #162.36 c1
        movq      %r13, %rsi                                    #162.36 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.43:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, unsigned long long)
        call      _ZNSolsEy@PLT                                 #162.36
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.44:
                                # LOE rax r12
..B1.52:                        # Preds ..B1.51
                                # Execution count [3.77e+04]: Infreq
        movq      %rax, %rdi                                    #162.51 c1
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rsi #162.51 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.45:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E@PLT                          #162.51
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.46:
                                # LOE r12
..B1.53:                        # Preds ..B1.52
                                # Execution count [3.77e+04]: Infreq
        movb      53448(%rsp), %al                              #54.55[spill] c1
        addq      $3072, 53464(%rsp)                            #54.55[spill] c1
        addq      $6, %r12                                      #54.55 c1
        addb      $1, %al                                       #54.55 c5 stall 1
        movb      %al, 53448(%rsp)                              #54.55[spill] c7
        cmpb      $6, %al                                       #54.36 c7
        jb        ..B1.36       # Prob 83%                      #54.36 c9
                                # LOE r12
..B1.54:                        # Preds ..B1.45 ..B1.221 ..B1.53
                                # Execution count [6.29e+03]: Infreq
        movq      53432(%rsp), %r13                             #[spill] c1
                                # LOE r13
..B1.55:                        # Preds ..B1.54
                                # Execution count [1.57e+04]: Infreq
        addq      $1, %r13                                      #31.54 c1
        cmpq      53424(%rsp), %r13                             #31.34[spill] c3
        jb        ..B1.29       # Prob 82%                      #31.34 c5
                                # LOE r13
..B1.56:                        # Preds ..B1.55
                                # Execution count [2.83e+03]: Infreq
        movq      20424(%rsp), %r15                             #[spill] c1
        movq      20432(%rsp), %r14                             #[spill] c1
        xorl      %r13d, %r13d                                  # c1
        movq      53424(%rsp), %r12                             #[spill] c5 stall 1
                                # LOE r12 r13 r14 r15
..B1.57:                        # Preds ..B1.56 ..B1.27
                                # Execution count [3.14e+03]: Infreq
        addq      $1, %r14                                      #7.42 c1
        addq      $512, %r15                                    #7.42 c1
        cmpq      20456(%rsp), %r14                             #7.32[spill] c3
        jb        ..B1.15       # Prob 82%                      #7.32 c5
                                # LOE r12 r13 r14 r15
..B1.58:                        # Preds ..B1.57
                                # Execution count [5.66e+02]: Infreq
        vpxord    %zmm1, %zmm1, %zmm1                           # c1
        movq      18672(%rsp), %rbx                             #[spill] c1
        movq      18664(%rsp), %rcx                             #[spill] c1
        movq      53496(%rsp), %rdx                             #[spill] c5 stall 1
        movq      20392(%rsp), %rax                             #[spill] c5
        movq      20456(%rsp), %r9                              #[spill] c9 stall 1
        movq      20488(%rsp), %r10                             #[spill] c9
        movq      53416(%rsp), %r8                              #[spill] c13 stall 1
                                # LOE rax rdx rcx rbx r8 r9 r10 r12 r13 zmm1
..B1.59:                        # Preds ..B1.58 ..B1.13
                                # Execution count [6.29e+02]: Infreq
        testq     %r10, %r10                                    #169.14 c1
        jne       ..B1.64       # Prob 50%                      #169.14 c3
                                # LOE rax rdx rcx rbx r8 r9 r10 r12 r13 zmm1
..B1.60:                        # Preds ..B1.91 ..B1.59 ..B1.74
                                # Execution count [6.29e+02]: Infreq
        addq      $1, %rax                                      #6.31 c1
        cmpq      %rcx, %rax                                    #6.26 c3
        jb        ..B1.13       # Prob 82%                      #6.26 c5
                                # LOE rax rdx rcx rbx r8 r9 r10 r12 r13 zmm1
..B1.61:                        # Preds ..B1.60
                                # Execution count [1.13e+02]: Infreq
        movq      18632(%rsp), %r15                             #[spill] c1
        movq      18640(%rsp), %r8                              #[spill] c1
        movq      18608(%rsp), %rdi                             #[spill] c5 stall 1
        movq      18600(%rsp), %r12                             #[spill] c5
        movq      18616(%rsp), %rsi                             #[spill] c9 stall 1
        movq      18624(%rsp), %r14                             #[spill] c9
                                # LOE rdx rcx rbx rsi rdi r8 r12 r13 r14 r15 zmm1
..B1.62:                        # Preds ..B1.61 ..B1.11
                                # Execution count [1.26e+02]: Infreq
        addq      $1, %r8                                       #5.29 c1
        addq      %rdi, %r15                                    #5.29 c1
        cmpq      %rsi, %r8                                     #5.24 c3
        jb        ..B1.11       # Prob 82%                      #5.24 c5
                                # LOE rdx rcx rbx rsi rdi r8 r12 r13 r14 r15 zmm1
..B1.63:                        # Preds ..B1.62
                                # Execution count [2.26e+01]: Infreq
        movq      120(%rsp), %r9                                #[spill] c1
        movq      112(%rsp), %r10                               #[spill] c1
        movq      104(%rsp), %r8                                #[spill] c5 stall 1
        addq      $1, %r9                                       #105.49 c5
        addq      $36, %r10                                     #105.49 c5
        movq      53488(%rsp), %r11                             #[spill] c5
        cmpq      %r8, %r9                                      #105.38 c9 stall 1
        jb        ..B1.9        # Prob 82%                      #105.38 c11
        jmp       ..B1.94       # Prob 100%                     #105.38 c11
                                # LOE rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 zmm1
..B1.64:                        # Preds ..B1.59
                                # Execution count [3.14e+02]: Infreq
        movq      %rdx, %rdi                                    #6.13 c1
        movq      %rdx, 53496(%rsp)                             #7.17[spill] c1
        xorb      %sil, %sil                                    #7.17 c1
        movq      %rax, 20392(%rsp)                             #7.17[spill] c1
        movl      %eax, %r11d                                   #9.92 c3
        movq      %rcx, 18664(%rsp)                             #7.17[spill] c3
        movq      53504(%rsp), %r15                             #5.13[spill] c3
        movl      %r11d, 53360(%rsp)                            #7.17[spill] c5
        movq      %r13, %r14                                    #7.17 c5
        movq      %r13, %rcx                                    #7.17 c5
        movb      %sil, %r13b                                   #7.17 c7
        movq      %rdi, %r12                                    #7.17 c7
        movl      20408(%rsp), %ebx                             #7.17[spill] c7
                                # LOE rcx r12 r14 r15 ebx r13b
..B1.65:                        # Preds ..B1.73 ..B1.64
                                # Execution count [1.13e+04]: Infreq
        movq      53376(%rsp), %rsi                             #8.40[spill] c1
        movq      53368(%rsp), %rdx                             #9.40[spill] c1
        imulq     %r12, %rsi                                    #8.40 c5 stall 1
        subl      53384(%rsp), %esi                             #8.40[spill] c5
        imulq     %r15, %rdx                                    #9.40 c5
        addl      53352(%rsp), %esi                             #8.92[spill] c7
        movslq    %esi, %rsi                                    #8.92 c9
        subl      %ebx, %edx                                    #9.40 c9
        addl      53360(%rsp), %edx                             #9.92[spill] c11
        movslq    %edx, %rdx                                    #9.92 c13
        testq     %rsi, %rsi                                    #10.19 c13
        jl        ..B1.72       # Prob 16%                      #10.19 c15
                                # LOE rdx rcx rsi r12 r14 r15 ebx r13b
..B1.66:                        # Preds ..B1.65
                                # Execution count [9.51e+03]: Infreq
        cmpq      53344(%rsp), %rsi                             #10.52[spill] c1
        jge       ..B1.72       # Prob 50%                      #10.52 c3
                                # LOE rdx rcx rsi r12 r14 r15 ebx r13b
..B1.67:                        # Preds ..B1.66
                                # Execution count [4.75e+03]: Infreq
        testq     %rdx, %rdx                                    #11.21 c1
        jl        ..B1.71       # Prob 16%                      #11.21 c3
                                # LOE rdx rcx rsi r12 r14 r15 ebx r13b
..B1.68:                        # Preds ..B1.67
                                # Execution count [3.99e+03]: Infreq
        cmpq      20480(%rsp), %rdx                             #11.54[spill] c1
        jge       ..B1.71       # Prob 50%                      #11.54 c3
                                # LOE rdx rcx rsi r12 r14 r15 ebx r13b
..B1.69:                        # Preds ..B1.68
                                # Execution count [9.99e+00]: Infreq
        cmpq      $24, 20488(%rsp)                              #12.7[spill] c1
        je        ..B1.215      # Prob 0%                       #12.7 c3
                                # LOE rdx rcx rsi r12 r14 r15 ebx r13b
..B1.70:                        # Preds ..B1.69
                                # Execution count [2.00e+03]: Infreq
        imulq     20320(%rsp), %rsi                             #13.9[spill] c1
        lea       128(%rsp,%r14), %rdi                          #13.9 c1
        addq      20328(%rsp), %rsi                             #13.9[spill] c5 stall 1
        addq      %rdx, %rsi                                    #13.9 c7
        movq      20296(%rsp), %rdx                             #13.9[spill] c7
        imulq     20312(%rsp), %rsi                             #13.9[spill] c9
        addq      20304(%rsp), %rsi                             #13.9[spill] c13 stall 1
        call      __intel_mic_avx512f_memcpy@PLT                #13.9 c15
                                # LOE r12 r14 r15 ebx r13b
..B1.292:                       # Preds ..B1.70
                                # Execution count [2.00e+03]: Infreq
        xorl      %ecx, %ecx                                    # c1
        jmp       ..B1.73       # Prob 100%                     # c1
                                # LOE rcx r12 r14 r15 ebx r13b
..B1.71:                        # Preds ..B1.67 ..B1.68
                                # Execution count [1.38e+01]: Infreq
        lea       128(%rsp,%r14), %rdx                          #17.9 c1
        movl      $512, %eax                                    #17.9 c1
                                # LOE rax rdx rcx r12 r14 r15 ebx r13b
..B1.235:                       # Preds ..B1.71
                                # Execution count [1.38e+01]: Infreq
        vpxord    %zmm0, %zmm0, %zmm0                           # c1
                                # LOE rax rdx rcx r12 r14 r15 ebx r13b zmm0
..B1.236:                       # Preds ..B1.236 ..B1.235
                                # Execution count [2.76e+01]: Infreq
        vmovups   %zmm0, -64(%rdx,%rax)                         #17.9 c1
        vmovups   %zmm0, -128(%rdx,%rax)                        #17.9 c1
        vmovups   %zmm0, -192(%rdx,%rax)                        #17.9 c7 stall 2
        vmovups   %zmm0, -256(%rdx,%rax)                        #17.9 c7
        subq      $256, %rax                                    #17.9 c7
        jne       ..B1.236      # Prob 50%                      #17.9 c9
        jmp       ..B1.73       # Prob 100%                     #17.9 c9
                                # LOE rax rdx rcx r12 r14 r15 ebx r13b zmm0
..B1.72:                        # Preds ..B1.65 ..B1.66
                                # Execution count [3.28e+01]: Infreq
        lea       128(%rsp,%r14), %rdx                          #22.7 c1
        movl      $512, %eax                                    #22.7 c1
                                # LOE rax rdx rcx r12 r14 r15 ebx r13b
..B1.238:                       # Preds ..B1.72
                                # Execution count [3.28e+01]: Infreq
        vpxord    %zmm0, %zmm0, %zmm0                           # c1
                                # LOE rax rdx rcx r12 r14 r15 ebx r13b zmm0
..B1.239:                       # Preds ..B1.239 ..B1.238
                                # Execution count [6.57e+01]: Infreq
        vmovups   %zmm0, -64(%rdx,%rax)                         #22.7 c1
        vmovups   %zmm0, -128(%rdx,%rax)                        #22.7 c1
        vmovups   %zmm0, -192(%rdx,%rax)                        #22.7 c7 stall 2
        vmovups   %zmm0, -256(%rdx,%rax)                        #22.7 c7
        subq      $256, %rax                                    #22.7 c7
        jne       ..B1.239      # Prob 50%                      #22.7 c9
                                # LOE rax rdx rcx r12 r14 r15 ebx r13b zmm0
..B1.73:                        # Preds ..B1.239 ..B1.236 ..B1.292 ..B1.219 ..B1.220
                                #      
                                # Execution count [1.13e+04]: Infreq
        addq      $1, %r15                                      #25.3 c1
        addb      $1, %r13b                                     #7.39 c1
        lea       1(%r12), %rax                                 #27.5 c1
        cmpq      53488(%rsp), %r15                             #27.5[spill] c3
        cmovae    %rax, %r12                                    #27.5 c5
        cmovae    %rcx, %r15                                    #28.5 c5
        addq      $512, %r14                                    #7.39 c7
        cmpb      $36, %r13b                                    #7.28 c7
        jb        ..B1.65       # Prob 97%                      #7.28 c9
                                # LOE rcx r12 r14 r15 ebx r13b
..B1.74:                        # Preds ..B1.73
                                # Execution count [3.14e+02]: Infreq
        movq      53424(%rsp), %r12                             #[spill] c1
        movq      53416(%rsp), %r8                              #[spill] c1
        movq      %rcx, %r13                                    # c1
        vpxord    %zmm1, %zmm1, %zmm1                           # c1
        movq      %r13, %r15                                    #171.7 c3
        movq      18672(%rsp), %rbx                             #[spill] c5
        movq      18664(%rsp), %rcx                             #[spill] c5
        movq      %r15, %r14                                    #172.25 c5
        movq      %r8, %rdi                                     #172.25 c5
        movq      53496(%rsp), %rdx                             #[spill] c9 stall 1
        movq      20392(%rsp), %rax                             #[spill] c9
        movq      20456(%rsp), %r9                              #[spill] c13 stall 1
        movq      20488(%rsp), %r10                             #[spill] c13
        testq     %r12, %r12                                    #171.34 c13
        jbe       ..B1.60       # Prob 10%                      #171.34 c15
                                # LOE rax rdx rcx rbx rdi r8 r9 r10 r12 r13 r14 r15 zmm1
..B1.75:                        # Preds ..B1.74
                                # Execution count [0.00e+00]: Infreq
        lea       128(%rsp), %rsi                               #104.39 c1
        movq      %rdx, 53368(%rsi)                             #104.39[spill] c3
        vmovaps   %zmm1, %zmm0                                  #104.39 c3
        movq      %rcx, 18536(%rsi)                             #104.39[spill] c3
        movq      20256(%rsi), %rbx                             #104.39[spill] c5
        movq      20232(%rsi), %rdx                             #104.39[spill] c5
        movq      53384(%rsi), %rcx                             #104.39[spill] c9 stall 1
        movq      53360(%rsi), %r8                              #104.39[spill] c9
                                # LOE rax rdx rcx rbx rsi rdi r8 r12 r13 r14 r15 zmm0 zmm1
..B1.76:                        # Preds ..B1.90 ..B1.75
                                # Execution count [0.00e+00]: Infreq
        movq      %rdx, %r9                                     #30.40 c1
        movq      %r13, %r10                                    #28.1 c1
        movq      24(%rsp), %r12                                #30.40[spill] c1
        movq      20488(%rsp), %r13                             #30.40[spill] c1
        imulq     %rax, %r9                                     #30.40 c3
        addq      %rbx, %r9                                     #30.40 c7 stall 1
        addq      %r14, %r9                                     #30.40 c9
                                # LOE rax rdx rcx rbx rsi rdi r9 r10 r12 r13 r14 r15 zmm0 zmm1
..B1.77:                        # Preds ..B1.78 ..B1.76
                                # Execution count [5.80e+04]: Infreq
        movq      %r12, %r8                                     #30.5 c1
        movq      %r10, %r11                                    #30.5 c1
        imulq     %r10, %r8                                     #30.5 c3
        shlq      $8, %r11                                      #30.5 c3
        vmovups   (%r9,%r8), %zmm2                              #30.5 c7 stall 1
        vmovups   %zmm2, 20544(%rsp,%r11)                       #30.5 c13 stall 2
        vmovups   64(%r9,%r8), %zmm3                            #30.5 c13
        vmovups   %zmm3, 20608(%rsp,%r11)                       #30.5 c19 stall 2
        vmovups   128(%r9,%r8), %zmm4                           #30.5 c19
        vmovups   %zmm4, 20672(%rsp,%r11)                       #30.5 c25 stall 2
        vmovups   192(%r9,%r8), %zmm5                           #30.5 c25
        vmovups   %zmm5, 20736(%rsp,%r11)                       #30.5 c31 stall 2
                                # LOE rax rdx rcx rbx rsi rdi r9 r10 r12 r13 r14 r15 zmm0 zmm1
..B1.78:                        # Preds ..B1.77
                                # Execution count [1.16e+07]: Infreq
        addq      $1, %r10                                      #28.1 c1
        cmpq      %r13, %r10                                    #28.1 c3
        jb        ..B1.77       # Prob 99%                      #28.1 c5
                                # LOE rax rdx rcx rbx rsi rdi r9 r10 r12 r13 r14 r15 zmm0 zmm1
..B1.79:                        # Preds ..B1.78
                                # Execution count [1.10e+03]: Infreq
        xorl      %r13d, %r13d                                  # c1
        movq      %r14, 20368(%rsp)                             #189.39[spill] c1
        movq      53488(%rsp), %r8                              #[spill] c1
        movq      %r15, 20376(%rsp)                             #189.39[spill] c3
        xorb      %r11b, %r11b                                  #174.9 c3
        movq      %rbx, 20384(%rsp)                             #189.39[spill] c5
        movq      %r13, %r10                                    #176.11 c5
        movq      %rax, 20392(%rsp)                             #189.39[spill] c5
        movq      %rsi, %r9                                     #189.39 c5
        movq      %rcx, 53512(%rsp)                             #189.39[spill] c7
        movq      53496(%rsp), %rsi                             #189.39[spill] c7
        movq      %rdx, 20360(%rsp)                             #189.39[spill] c9
        movq      53504(%rsp), %rcx                             #189.39[spill] c11
        movq      53536(%rsp), %rbx                             #189.39[spill] c11
                                # LOE rcx rbx rsi rdi r8 r9 r10 r13 r11b zmm0 zmm1
..B1.80:                        # Preds ..B1.88 ..B1.79
                                # Execution count [4.25e+03]: Infreq
        movq      %r13, %r12                                    #181.11 c1
        vmovaps   %zmm0, %zmm25                                 #178.31 c1
        vmovaps   %zmm1, %zmm24                                 #178.31 c1
        movq      %r9, %rax                                     #189.39 c1
        movq      20488(%rsp), %r14                             #189.39[spill] c1
        vmovaps   %zmm1, %zmm23                                 #178.31 c3
        vmovaps   %zmm1, %zmm22                                 #178.31 c3
        movq      %r12, %rdx                                    #183.13 c3
        vmovaps   %zmm1, %zmm21                                 #178.31 c5
        vmovaps   %zmm1, %zmm20                                 #178.31 c5
        vmovaps   %zmm1, %zmm19                                 #178.31 c7
        vmovaps   %zmm1, %zmm18                                 #178.31 c7
        vmovaps   %zmm1, %zmm17                                 #178.31 c9
        vmovaps   %zmm1, %zmm16                                 #178.31 c9
        vmovaps   %zmm1, %zmm15                                 #178.31 c11
        vmovaps   %zmm1, %zmm14                                 #178.31 c11
        vmovaps   %zmm1, %zmm13                                 #178.31 c13
        vmovaps   %zmm1, %zmm12                                 #178.31 c13
        vmovaps   %zmm1, %zmm11                                 #178.31 c15
        vmovaps   %zmm1, %zmm10                                 #178.31 c15
        vmovaps   %zmm1, %zmm9                                  #178.31 c17
        vmovaps   %zmm1, %zmm8                                  #178.31 c17
        vmovaps   %zmm1, %zmm7                                  #178.31 c19
        vmovaps   %zmm1, %zmm6                                  #178.31 c19
        vmovaps   %zmm1, %zmm5                                  #178.31 c21
        vmovaps   %zmm1, %zmm4                                  #178.31 c21
        vmovaps   %zmm1, %zmm3                                  #178.31 c23
        vmovaps   %zmm1, %zmm2                                  #178.31 c23
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r12 r13 r14 r11b zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 zmm8 zmm9 zmm10 zmm11 zmm12 zmm13 zmm14 zmm15 zmm16 zmm17 zmm18 zmm19 zmm20 zmm21 zmm22 zmm23 zmm24 zmm25
..B1.81:                        # Preds ..B1.81 ..B1.80
                                # Execution count [3.48e+07]: Infreq
        vmovups   20544(%rsp,%rdx), %zmm0                       #186.42 c1
        vmovups   20608(%rsp,%rdx), %zmm1                       #186.42 c1
        addq      $1, %r12                                      #181.11 c1
        vmovups   20672(%rsp,%rdx), %zmm26                      #186.42 c7 stall 2
        vmovups   20736(%rsp,%rdx), %zmm27                      #186.42 c7
        addq      $256, %rdx                                    #181.11 c7
        vfmadd231ps (%rax){1to16}, %zmm0, %zmm25                #192.33 c13 stall 2
        vfmadd231ps (%rax){1to16}, %zmm1, %zmm24                #192.33 c13
        vfmadd231ps (%rax){1to16}, %zmm26, %zmm23               #192.33 c19 stall 2
        vfmadd231ps (%rax){1to16}, %zmm27, %zmm22               #192.33 c19
        vfmadd231ps 512(%rax){1to16}, %zmm0, %zmm21             #192.33 c25 stall 2
        vfmadd231ps 512(%rax){1to16}, %zmm1, %zmm20             #192.33 c25
        vfmadd231ps 512(%rax){1to16}, %zmm26, %zmm19            #192.33 c31 stall 2
        vfmadd231ps 512(%rax){1to16}, %zmm27, %zmm18            #192.33 c31
        vfmadd231ps 1024(%rax){1to16}, %zmm0, %zmm17            #192.33 c37 stall 2
        vfmadd231ps 1024(%rax){1to16}, %zmm1, %zmm16            #192.33 c37
        vfmadd231ps 1024(%rax){1to16}, %zmm26, %zmm15           #192.33 c43 stall 2
        vfmadd231ps 1024(%rax){1to16}, %zmm27, %zmm14           #192.33 c43
        vfmadd231ps 1536(%rax){1to16}, %zmm0, %zmm13            #192.33 c49 stall 2
        vfmadd231ps 1536(%rax){1to16}, %zmm1, %zmm12            #192.33 c49
        vfmadd231ps 1536(%rax){1to16}, %zmm26, %zmm11           #192.33 c55 stall 2
        vfmadd231ps 1536(%rax){1to16}, %zmm27, %zmm10           #192.33 c55
        vfmadd231ps 2048(%rax){1to16}, %zmm0, %zmm9             #192.33 c61 stall 2
        vfmadd231ps 2048(%rax){1to16}, %zmm1, %zmm8             #192.33 c61
        vfmadd231ps 2048(%rax){1to16}, %zmm26, %zmm7            #192.33 c67 stall 2
        vfmadd231ps 2048(%rax){1to16}, %zmm27, %zmm6            #192.33 c67
        vfmadd231ps 2560(%rax){1to16}, %zmm0, %zmm5             #192.33 c73 stall 2
        vfmadd231ps 2560(%rax){1to16}, %zmm1, %zmm4             #192.33 c73
        vfmadd231ps 2560(%rax){1to16}, %zmm26, %zmm3            #192.33 c79 stall 2
        vfmadd231ps 2560(%rax){1to16}, %zmm27, %zmm2            #192.33 c79
        addq      $4, %rax                                      #181.11 c79
        cmpq      %r14, %r12                                    #181.11 c79
        jb        ..B1.81       # Prob 99%                      #181.11 c81
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r12 r13 r14 r11b zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 zmm8 zmm9 zmm10 zmm11 zmm12 zmm13 zmm14 zmm15 zmm16 zmm17 zmm18 zmm19 zmm20 zmm21 zmm22 zmm23 zmm24 zmm25
..B1.82:                        # Preds ..B1.81
                                # Execution count [4.72e+03]: Infreq
        lea       (%rcx,%r10), %rax                             #196.28 c1
        vmovups   %zmm4, 20096(%rsp)                            #192.17 c1
        xorl      %edx, %edx                                    #196.37 c1
        vmovups   %zmm5, 20032(%rsp)                            #192.17 c3
        divq      %r8                                           #196.37 c3
        vmovups   %zmm2, 20224(%rsp)                            #192.17 c7 stall 1
        movq      %r8, %r12                                     #197.11 c7
        vmovups   %zmm3, 20160(%rsp)                            #192.17 c9
        movq      %r13, %r14                                    #198.11 c9
        vmovups   %zmm6, 19968(%rsp)                            #192.17 c13 stall 1
        vpxord    %zmm0, %zmm0, %zmm0                           # c13
        vmovups   %zmm7, 19904(%rsp)                            #192.17 c15
        vpxord    %zmm1, %zmm1, %zmm1                           # c15
        vmovups   %zmm8, 19840(%rsp)                            #192.17 c19 stall 1
        movq      53512(%rsp), %rcx                             #199.13[spill] c21
        vmovups   %zmm9, 19776(%rsp)                            #192.17 c25 stall 1
        addq      %rsi, %rax                                    #197.42 c103 stall 38
        vmovups   %zmm10, 19712(%rsp)                           #192.17 c103
        movq      %rdx, %r15                                    #196.37 c103
        vmovups   %zmm11, 19648(%rsp)                           #192.17 c103
        imulq     %rax, %r12                                    #197.11 c105
        vmovups   %zmm12, 19584(%rsp)                           #192.17 c109 stall 1
        movq      %r14, %rdx                                    #199.13 c109
        vmovups   %zmm13, 19520(%rsp)                           #192.17 c109
        vmovups   %zmm14, 19456(%rsp)                           #192.17 c115 stall 2
        vmovups   %zmm15, 19392(%rsp)                           #192.17 c115
        vmovups   %zmm16, 19328(%rsp)                           #192.17 c121 stall 2
        vmovups   %zmm17, 19264(%rsp)                           #192.17 c121
        vmovups   %zmm18, 19200(%rsp)                           #192.17 c127 stall 2
        vmovups   %zmm19, 19136(%rsp)                           #192.17 c127
        vmovups   %zmm20, 19072(%rsp)                           #192.17 c133 stall 2
        vmovups   %zmm21, 19008(%rsp)                           #192.17 c133
        vmovups   %zmm22, 18944(%rsp)                           #192.17 c139 stall 2
        vmovups   %zmm23, 18880(%rsp)                           #192.17 c139
        vmovups   %zmm24, 18816(%rsp)                           #192.17 c145 stall 2
        vmovups   %zmm25, 18752(%rsp)                           #192.17 c145
        movb      %r11b, 20496(%rsp)                            #199.13[spill] c151 stall 2
        movq      53544(%rsp), %r11                             #199.13[spill] c151
                                # LOE rax rdx rcx rbx rdi r8 r9 r10 r11 r12 r13 r14 r15 zmm0 zmm1
..B1.83:                        # Preds ..B1.86 ..B1.85 ..B1.82
                                # Execution count [1.42e+04]: Infreq
        cmpq      %rbx, %rax                                    #199.23 c1
        jae       ..B1.214      # Prob 20%                      #199.23 c3
                                # LOE rax rdx rcx rbx rdi r8 r9 r10 r11 r12 r13 r14 r15 zmm0 zmm1
..B1.84:                        # Preds ..B1.83
                                # Execution count [1.13e+04]: Infreq
        lea       (%r15,%rcx), %rsi                             #205.46 c1
        addq      $1, %r15                                      #207.13 c1
        addq      $1, %r14                                      #198.11 c1
        addq      %r12, %rsi                                    #205.46 c3
        imulq     %r11, %rsi                                    #205.46 c5
        vmovups   (%rdi,%rsi,4), %zmm2                          #205.46 c9 stall 1
        vmovups   64(%rdi,%rsi,4), %zmm4                        #205.46 c9
        vmovups   128(%rdi,%rsi,4), %zmm6                       #205.46 c15 stall 2
        vmovups   192(%rdi,%rsi,4), %zmm8                       #205.46 c15
        vaddps    18752(%rsp,%rdx), %zmm2, %zmm3                #205.17 c21 stall 2
        vmovups   %zmm3, (%rdi,%rsi,4)                          #204.31 c27 stall 2
        vaddps    18816(%rsp,%rdx), %zmm4, %zmm5                #205.17 c27
        vmovups   %zmm5, 64(%rdi,%rsi,4)                        #204.31 c33 stall 2
        vaddps    18880(%rsp,%rdx), %zmm6, %zmm7                #205.17 c33
        vmovups   %zmm7, 128(%rdi,%rsi,4)                       #204.31 c39 stall 2
        vaddps    18944(%rsp,%rdx), %zmm8, %zmm9                #205.17 c39
        vmovups   %zmm9, 192(%rdi,%rsi,4)                       #204.31 c45 stall 2
        addq      $256, %rdx                                    #198.11 c45
        cmpq      %r8, %r15                                     #208.23 c45
        jb        ..B1.86       # Prob 38%                      #208.23 c47
                                # LOE rax rdx rcx rbx rdi r8 r9 r10 r11 r12 r13 r14 r15 zmm0 zmm1
..B1.85:                        # Preds ..B1.84
                                # Execution count [7.02e+03]: Infreq
        addq      %r8, %r12                                     #209.15 c1
        addq      $1, %rax                                      #209.15 c1
        movq      %r13, %r15                                    #210.15 c3
        cmpq      $6, %r14                                      #198.11 c3
        jb        ..B1.83       # Prob 83%                      #198.11 c5
        jmp       ..B1.92       # Prob 100%                     #198.11 c5
                                # LOE rax rdx rcx rbx rdi r8 r9 r10 r11 r12 r13 r14 r15 zmm0 zmm1
..B1.86:                        # Preds ..B1.84
                                # Execution count [4.30e+03]: Infreq
        cmpq      $6, %r14                                      #198.11 c1
        jb        ..B1.83       # Prob 83%                      #198.11 c3
                                # LOE rax rdx rcx rbx rdi r8 r9 r10 r11 r12 r13 r14 r15 zmm0 zmm1
..B1.87:                        # Preds ..B1.86
                                # Execution count [7.17e+02]: Infreq
        movq      %rcx, 53512(%rsp)                             #[spill] c1
        movb      20496(%rsp), %r11b                            #[spill] c1
        movq      53496(%rsp), %rsi                             #[spill] c3
        movq      53504(%rsp), %rcx                             #[spill] c5
                                # LOE rcx rbx rsi rdi r8 r9 r10 r13 r11b zmm0 zmm1
..B1.88:                        # Preds ..B1.92 ..B1.87
                                # Execution count [3.77e+03]: Infreq
        addb      $1, %r11b                                     #174.9 c1
        addq      $6, %r10                                      #174.9 c1
        addq      $3072, %r9                                    #174.9 c3
        cmpb      $6, %r11b                                     #174.9 c3
        jb        ..B1.80       # Prob 83%                      #174.9 c5
                                # LOE rcx rbx rsi rdi r8 r9 r10 r13 r11b zmm0 zmm1
..B1.89:                        # Preds ..B1.92 ..B1.88
                                # Execution count [6.29e+02]: Infreq
        lea       128(%rsp), %rsi                               # c1
        movq      20240(%rsi), %r14                             #[spill] c3
        movq      20248(%rsi), %r15                             #[spill] c3
        movq      20256(%rsi), %rbx                             #[spill] c7 stall 1
        movq      20264(%rsi), %rax                             #[spill] c7
        movq      20232(%rsi), %rdx                             #[spill] c11 stall 1
        movq      53384(%rsi), %rcx                             #[spill] c11
        movq      53296(%rsi), %r12                             #[spill] c15 stall 1
                                # LOE rax rdx rcx rbx rsi rdi r8 r12 r13 r14 r15 zmm0 zmm1
..B1.90:                        # Preds ..B1.89 ..B1.214
                                # Execution count [1.57e+03]: Infreq
        addq      $1, %r15                                      #171.7 c1
        addq      $256, %rdi                                    #171.7 c1
        addq      $256, %r14                                    #171.7 c3
        cmpq      %r12, %r15                                    #171.7 c3
        jb        ..B1.76       # Prob 82%                      #171.7 c5
                                # LOE rax rdx rcx rbx rsi rdi r8 r12 r13 r14 r15 zmm0 zmm1
..B1.91:                        # Preds ..B1.90
                                # Execution count [2.83e+02]: Infreq
        movq      %rbx, 20384(%rsp)                             #[spill] c1
        movq      18672(%rsp), %rbx                             #[spill] c1
        movq      %rcx, 53512(%rsp)                             #[spill] c3
        movq      20488(%rsp), %r10                             #[spill] c5
        movq      %rdx, 20360(%rsp)                             #[spill] c5
        movq      53496(%rsp), %rdx                             #[spill] c7
        movq      20456(%rsp), %r9                              #[spill] c9
        movq      18664(%rsp), %rcx                             #[spill] c11
        movq      53416(%rsp), %r8                              #[spill] c13
        jmp       ..B1.60       # Prob 100%                     # c13
                                # LOE rax rdx rcx rbx r8 r9 r10 r12 r13 zmm1
..B1.92:                        # Preds ..B1.85
                                # Execution count [1.17e+03]: Infreq
        movq      %rcx, 53512(%rsp)                             #[spill] c1
        movb      20496(%rsp), %r11b                            #[spill] c1
        movq      53496(%rsp), %rsi                             #[spill] c3
        movq      53504(%rsp), %rcx                             #[spill] c5
        cmpq      %rbx, %rax                                    #213.21 c5
        jae       ..B1.89       # Prob 20%                      #213.21 c7
        jmp       ..B1.88       # Prob 100%                     #213.21 c7
                                # LOE rcx rbx rsi rdi r8 r9 r10 r13 r11b zmm0 zmm1
..B1.94:                        # Preds ..B1.63
                                # Execution count [4.08e+00]: Infreq
        movq      %r12, 18600(%rsp)                             #[spill] c1
        movq      20528(%rsp), %rdx                             #[spill] c1
        movq      %r11, 53488(%rsp)                             #[spill] c3
        movq      72(%rsp), %rbx                                #[spill] c5
        movq      %rcx, 18664(%rsp)                             #[spill] c5
        movq      20520(%rsp), %rcx                             #[spill] c7
        movq      80(%rsp), %rax                                #[spill] c9
        movq      88(%rsp), %r11                                #[spill] c11
        movq      96(%rsp), %r12                                #[spill] c13
                                # LOE rax rdx rcx rbx rsi rdi r8 r11 r12 r13 zmm1
..B1.95:                        # Preds ..B1.94 ..B1.7
                                # Execution count [4.58e+00]: Infreq
        movq      %r13, %r10                                    #5.15 c1
        movq      %r10, %r9                                     #5.15 c3
        testq     %rsi, %rsi                                    #5.24 c3
        jbe       ..B1.150      # Prob 10%                      #5.24 c5
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 zmm1
..B1.96:                        # Preds ..B1.95
                                # Execution count [4.53e+00]: Infreq
        movq      %rax, %r15                                    #141.46 c1
        movq      %rbx, 72(%rsp)                                #13.37[spill] c1
        movq      %rbx, %r14                                    #13.37 c1
        movq      %r11, 88(%rsp)                                #13.37[spill] c1
        imulq     %r11, %r15                                    #141.46 c3
        movq      %r15, 20536(%rsp)                             #13.37[spill] c7 stall 1
        imulq     %r11, %r14                                    #13.37 c7
        movq      %r14, 18656(%rsp)                             #13.37[spill] c11 stall 1
        movq      18600(%rsp), %r14                             #13.37[spill] c11
        movq      18664(%rsp), %r8                              #13.37[spill] c13
        movq      18624(%rsp), %r15                             #13.37[spill] c15
                                # LOE rdx rcx rsi rdi r8 r9 r10 r13 r14 r15 zmm1
..B1.97:                        # Preds ..B1.148 ..B1.96
                                # Execution count [2.52e+01]: Infreq
        movq      %r13, %rax                                    #6.17 c1
        testq     %r8, %r8                                      #6.26 c1
        jbe       ..B1.148      # Prob 10%                      #6.26 c3
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r13 r14 r15 zmm1
..B1.98:                        # Preds ..B1.97
                                # Execution count [2.26e+01]: Infreq
        movl      %r10d, %r12d                                  #8.92 c1
        movq      %r9, 18568(%rsp)                              #30.40[spill] c1
        lea       (%r15,%r9), %r11                              #30.40 c1
        movq      %r11, 18560(%rsp)                             #30.40[spill] c3
        lea       (%r14,%r9), %rbx                              #30.40 c3
        movq      %rbx, 18696(%rsp)                             #30.40[spill] c5
        movq      18672(%rsp), %r11                             #30.40[spill] c5
        movl      %r12d, 20344(%rsp)                            #30.40[spill] c7
        movq      53424(%rsp), %r12                             #30.40[spill] c9
        movq      %r10, 18576(%rsp)                             #30.40[spill] c9
        movq      20488(%rsp), %r10                             #30.40[spill] c11
        movq      %rdi, 18608(%rsp)                             #30.40[spill] c13
        movq      20456(%rsp), %r9                              #30.40[spill] c15
                                # LOE rax rdx rcx r8 r9 r10 r11 r12 r13 zmm1
..B1.99:                        # Preds ..B1.146 ..B1.98
                                # Execution count [1.26e+02]: Infreq
        movq      %r13, %r14                                    #7.19 c1
        movq      %r11, %r15                                    #7.19 c1
        testq     %r9, %r9                                      #7.32 c3
        jbe       ..B1.145      # Prob 10%                      #7.32 c5
                                # LOE rax rdx rcx r8 r9 r10 r11 r12 r13 r14 r15 zmm1
..B1.100:                       # Preds ..B1.99
                                # Execution count [1.13e+02]: Infreq
        movl      %eax, %ebx                                    #9.92 c1
        movq      %rax, 18704(%rsp)                             #9.92[spill] c1
        movl      %ebx, 18728(%rsp)                             #9.92[spill] c3
                                # LOE r12 r13 r14 r15
..B1.101:                       # Preds ..B1.143 ..B1.100
                                # Execution count [6.29e+02]: Infreq
        cpuid                                                   #11.0
        rdtsc                                                   #11.0
        movl      %edx, %edi                                    #11.0
        movl      %eax, %r8d                                    #11.0
        movq      %r13, %rax                                    #7.1 c1
        movq      %r15, 18720(%rsp)                             #7.1[spill] c1
        movq      20528(%rsp), %rcx                             #5.13[spill] c3
        movl      %r8d, 18744(%rsp)                             #7.1[spill] c3
        movq      20520(%rsp), %rdx                             #6.13[spill] c5
        movl      %edi, 18736(%rsp)                             #7.1[spill] c7
        movl      20344(%rsp), %r12d                            #7.1[spill] c9
        movq      %r14, 18712(%rsp)                             #7.1[spill] c9
        movl      18728(%rsp), %r14d                            #7.1[spill] c11
        movq      53368(%rsp), %r11                             #7.1[spill] c13
        movq      53376(%rsp), %r10                             #7.1[spill] c15
        movl      53384(%rsp), %edi                             #7.1[spill] c17
        movl      20408(%rsp), %r9d                             #7.1[spill] c19
        movq      53488(%rsp), %r8                              #7.1[spill] c21
                                # LOE rax rdx rcx r8 r10 r11 r13 edi r9d r12d r14d
..B1.102:                       # Preds ..B1.109 ..B1.101
                                # Execution count [2.26e+04]: Infreq
        movq      %r10, %rbx                                    #8.40 c1
        movq      %r11, %rsi                                    #9.40 c1
        imulq     %rdx, %rbx                                    #8.40 c3
        imulq     %rcx, %rsi                                    #9.40 c3
        subl      %edi, %ebx                                    #8.40 c7 stall 1
        subl      %r9d, %esi                                    #9.40 c7
        addl      %r14d, %esi                                   #9.92 c9
        addl      %r12d, %ebx                                   #8.92 c9
        js        ..B1.108      # Prob 16%                      #10.19 c11
                                # LOE rax rdx rcx r8 r10 r11 r13 ebx esi edi r9d r12d r14d
..B1.103:                       # Preds ..B1.102
                                # Execution count [1.90e+04]: Infreq
        cmpl      53552(%rsp), %ebx                             #10.52[spill] c1
        jge       ..B1.108      # Prob 50%                      #10.52 c3
                                # LOE rax rdx rcx r8 r10 r11 r13 ebx esi edi r9d r12d r14d
..B1.104:                       # Preds ..B1.103
                                # Execution count [9.51e+03]: Infreq
        testl     %esi, %esi                                    #11.21 c1
        js        ..B1.107      # Prob 16%                      #11.21 c3
                                # LOE rax rdx rcx r8 r10 r11 r13 ebx esi edi r9d r12d r14d
..B1.105:                       # Preds ..B1.104
                                # Execution count [7.99e+03]: Infreq
        cmpl      53456(%rsp), %esi                             #11.54[spill] c1
        jge       ..B1.107      # Prob 50%                      #11.54 c3
                                # LOE rax rdx rcx r8 r10 r11 r13 ebx esi edi r9d r12d r14d
..B1.106:                       # Preds ..B1.105
                                # Execution count [1.80e+01]: Infreq
        movslq    %ebx, %rbx                                    #13.9 c1
        movslq    %esi, %rsi                                    #13.9 c1
        imulq     20320(%rsp), %rbx                             #13.9[spill] c3
        movq      %rax, %r15                                    #13.9 c3
        shlq      $9, %r15                                      #13.9 c5
        addq      18656(%rsp), %rbx                             #13.9[spill] c7
        lea       128(%rsp,%r15), %r15                          #13.9 c7
        movq      %r15, 18584(%rsp)                             #13.9[spill] c9
        addq      %rsi, %rbx                                    #13.9 c9
        movl      $512, %r15d                                   #13.9 c9
        imulq     20312(%rsp), %rbx                             #13.9[spill] c11
        addq      18720(%rsp), %rbx                             #13.9[spill] c15 stall 1
                                # LOE rax rdx rcx rbx r8 r10 r11 r13 r15 edi r9d r12d r14d
..B1.241:                       # Preds ..B1.241 ..B1.106
                                # Execution count [3.60e+01]: Infreq
        vmovups   -64(%rbx,%r15), %zmm0                         #13.9 c1
        movq      18584(%rsp), %rsi                             #13.9[spill] c1
        vmovups   %zmm0, -64(%rsi,%r15)                         #13.9 c7 stall 2
        vmovups   -128(%rbx,%r15), %zmm1                        #13.9 c7
        vmovups   %zmm1, -128(%rsi,%r15)                        #13.9 c13 stall 2
        vmovups   -192(%rbx,%r15), %zmm2                        #13.9 c13
        vmovups   %zmm2, -192(%rsi,%r15)                        #13.9 c19 stall 2
        vmovups   -256(%rbx,%r15), %zmm3                        #13.9 c19
        vmovups   %zmm3, -256(%rsi,%r15)                        #13.9 c25 stall 2
        subq      $256, %r15                                    #13.9 c25
        jne       ..B1.241      # Prob 50%                      #13.9 c27
        jmp       ..B1.109      # Prob 100%                     #13.9 c27
                                # LOE rax rdx rcx rbx r8 r10 r11 r13 r15 edi r9d r12d r14d
..B1.107:                       # Preds ..B1.104 ..B1.105
                                # Execution count [2.76e+01]: Infreq
        movq      %rax, %rbx                                    #17.9 c1
        shlq      $9, %rbx                                      #17.9 c3
        lea       128(%rsp,%rbx), %rsi                          #17.9 c5
        movl      $512, %ebx                                    #17.9 c5
                                # LOE rax rdx rcx rbx rsi r8 r10 r11 r13 edi r9d r12d r14d
..B1.242:                       # Preds ..B1.107
                                # Execution count [2.76e+01]: Infreq
        vpxord    %zmm0, %zmm0, %zmm0                           # c1
                                # LOE rax rdx rcx rbx rsi r8 r10 r11 r13 edi r9d r12d r14d zmm0
..B1.243:                       # Preds ..B1.243 ..B1.242
                                # Execution count [5.52e+01]: Infreq
        vmovups   %zmm0, -64(%rsi,%rbx)                         #17.9 c1
        vmovups   %zmm0, -128(%rsi,%rbx)                        #17.9 c1
        vmovups   %zmm0, -192(%rsi,%rbx)                        #17.9 c7 stall 2
        vmovups   %zmm0, -256(%rsi,%rbx)                        #17.9 c7
        subq      $256, %rbx                                    #17.9 c7
        jne       ..B1.243      # Prob 50%                      #17.9 c9
        jmp       ..B1.109      # Prob 100%                     #17.9 c9
                                # LOE rax rdx rcx rbx rsi r8 r10 r11 r13 edi r9d r12d r14d zmm0
..B1.108:                       # Preds ..B1.102 ..B1.103
                                # Execution count [6.57e+01]: Infreq
        movq      %rax, %rbx                                    #22.7 c1
        shlq      $9, %rbx                                      #22.7 c3
        lea       128(%rsp,%rbx), %rsi                          #22.7 c5
        movl      $512, %ebx                                    #22.7 c5
                                # LOE rax rdx rcx rbx rsi r8 r10 r11 r13 edi r9d r12d r14d
..B1.245:                       # Preds ..B1.108
                                # Execution count [6.57e+01]: Infreq
        vpxord    %zmm0, %zmm0, %zmm0                           # c1
                                # LOE rax rdx rcx rbx rsi r8 r10 r11 r13 edi r9d r12d r14d zmm0
..B1.246:                       # Preds ..B1.246 ..B1.245
                                # Execution count [1.31e+02]: Infreq
        vmovups   %zmm0, -64(%rsi,%rbx)                         #22.7 c1
        vmovups   %zmm0, -128(%rsi,%rbx)                        #22.7 c1
        vmovups   %zmm0, -192(%rsi,%rbx)                        #22.7 c7 stall 2
        vmovups   %zmm0, -256(%rsi,%rbx)                        #22.7 c7
        subq      $256, %rbx                                    #22.7 c7
        jne       ..B1.246      # Prob 50%                      #22.7 c9
                                # LOE rax rdx rcx rbx rsi r8 r10 r11 r13 edi r9d r12d r14d zmm0
..B1.109:                       # Preds ..B1.246 ..B1.243 ..B1.241
                                # Execution count [2.26e+04]: Infreq
        addq      $1, %rcx                                      #25.3 c1
        addq      $1, %rax                                      #7.1 c1
        lea       1(%rdx), %rbx                                 #27.5 c1
        cmpq      %r8, %rcx                                     #27.5 c3
        cmovae    %rbx, %rdx                                    #27.5 c5
        cmovae    %r13, %rcx                                    #28.5 c5
        cmpq      $36, %rax                                     #7.1 c7
        jb        ..B1.102      # Prob 97%                      #7.1 c9
                                # LOE rax rdx rcx r8 r10 r11 r13 edi r9d r12d r14d
..B1.110:                       # Preds ..B1.109
                                # Execution count [6.29e+02]: Infreq
        movl      18744(%rsp), %r8d                             #[spill] c1
        movl      18736(%rsp), %edi                             #[spill] c1
        shlq      $32, %rdi                                     #26.53 c1
        orq       %r8, %rdi                                     #26.59 c3
        movq      18720(%rsp), %r15                             #[spill] c5
        movq      18712(%rsp), %r14                             #[spill] c5
        movq      53424(%rsp), %r12                             #[spill] c9 stall 1
        rdtscp                                                  #20.0
        movl      %edx, %esi                                    #20.0
        movl      %eax, %r9d                                    #20.0
        cpuid                                                   #20.0
        movl      %esi, %ebx                                    #27.36 c11
        movl      %r9d, %r9d                                    #27.58 c11
        shlq      $32, %rbx                                     #27.52 c13
        lea       .L_2__STRING.1(%rip), %rsi                    #29.13 c13
        orq       %r9, %rbx                                     #27.58 c15
        subq      %rdi, %rbx                                    #28.22 c17
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi                #29.13 c17
        vcvtusi2sdq %rbx, %xmm16, %xmm16                        #28.27 c19
        vaddsd    20416(%rsp), %xmm16, %xmm0                    #28.8[spill] c21
        vmovsd    %xmm0, 20416(%rsp)                            #28.8[spill] c27 stall 2
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.47:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #29.13
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.48:
                                # LOE rax rbx r12 r13 r14 r15
..B1.111:                       # Preds ..B1.110
                                # Execution count [6.29e+02]: Infreq
        movq      %rax, %rdi                                    #29.35 c1
        movq      %rbx, %rsi                                    #29.35 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.49:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, unsigned long long)
        call      _ZNSolsEy@PLT                                 #29.35
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.50:
                                # LOE rax r12 r13 r14 r15
..B1.112:                       # Preds ..B1.111
                                # Execution count [6.29e+02]: Infreq
        movq      %rax, %rdi                                    #29.50 c1
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rsi #29.50 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.51:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E@PLT                          #29.50
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.52:
                                # LOE r12 r13 r14 r15
..B1.113:                       # Preds ..B1.112
                                # Execution count [6.29e+02]: Infreq
        movq      %r13, %rax                                    #31.21 c1
        testq     %r12, %r12                                    #31.34 c1
        jbe       ..B1.143      # Prob 10%                      #31.34 c3
                                # LOE rax r12 r13 r14 r15
..B1.114:                       # Preds ..B1.113
                                # Execution count [0.00e+00]: Infreq
        movq      20360(%rsp), %r10                             #30.40[spill] c1
        movq      %r15, 18720(%rsp)                             #30.40[spill] c1
        lea       .L_2__STRING.2(%rip), %r9                     #30.40 c1
        movq      %r14, 18712(%rsp)                             #30.40[spill] c3
        xorb      %r8b, %r8b                                    #30.40 c3
        lea       .L_2__STRING.3(%rip), %rsi                    #30.40 c3
        movq      16(%rsp), %rdx                                #8.23[spill] c5
        imulq     18704(%rsp), %r10                             #30.40[spill] c5
        movq      %rax, %r13                                    #30.40 c5
        imulq     %r14, %rdx                                    #8.23 c9 stall 1
        addq      18560(%rsp), %r10                             #30.40[spill] c9
        addq      %rdx, %r10                                    #30.40 c13 stall 1
        movq      %r10, (%rsp)                                  #30.40[spill] c15
                                # LOE r13
..B1.115:                       # Preds ..B1.141 ..B1.114
                                # Execution count [0.00e+00]: Infreq
        cpuid                                                   #34.0
        rdtsc                                                   #34.0
        movl      %edx, %esi                                    #34.0
        movl      %eax, %r14d                                   #34.0
        xorl      %ecx, %ecx                                    #28.1 c1
        movl      %r14d, 20472(%rsp)                            #34.0[spill] c3
        movq      (%rsp), %rdx                                  #30.40[spill] c3
        movl      %esi, 20464(%rsp)                             #34.0[spill] c5
        movq      %r13, %r14                                    #30.40 c5
        shlq      $8, %r14                                      #30.40 c7
        movq      24(%rsp), %rdi                                #30.40[spill] c7
        addq      %r14, %rdx                                    #30.40 c9
                                # LOE rdx rcx rdi r13 r14
..B1.116:                       # Preds ..B1.117 ..B1.115
                                # Execution count [1.16e+05]: Infreq
        movq      %rdi, %rbx                                    #30.5 c1
        movq      %rcx, %rsi                                    #30.5 c1
        imulq     %rcx, %rbx                                    #30.5 c3
        shlq      $8, %rsi                                      #30.5 c3
        vmovups   (%rdx,%rbx), %zmm0                            #30.5 c7 stall 1
        vmovups   %zmm0, 20544(%rsp,%rsi)                       #30.5 c13 stall 2
        vmovups   64(%rdx,%rbx), %zmm1                          #30.5 c13
        vmovups   %zmm1, 20608(%rsp,%rsi)                       #30.5 c19 stall 2
        vmovups   128(%rdx,%rbx), %zmm2                         #30.5 c19
        vmovups   %zmm2, 20672(%rsp,%rsi)                       #30.5 c25 stall 2
        vmovups   192(%rdx,%rbx), %zmm3                         #30.5 c25
        vmovups   %zmm3, 20736(%rsp,%rsi)                       #30.5 c31 stall 2
                                # LOE rdx rcx rdi r13 r14
..B1.117:                       # Preds ..B1.116
                                # Execution count [2.32e+07]: Infreq
        addq      $1, %rcx                                      #28.1 c1
        cmpq      $128, %rcx                                    #28.1 c3
        jb        ..B1.116      # Prob 99%                      #28.1 c5
                                # LOE rdx rcx rdi r13 r14
..B1.118:                       # Preds ..B1.117
                                # Execution count [3.15e+03]: Infreq
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi                #51.14 c1
        rdtscp                                                  #43.0
        movl      %edx, %r15d                                   #43.0
        movl      %eax, %r12d                                   #43.0
        cpuid                                                   #43.0
        lea       .L_2__STRING.2(%rip), %rsi                    #51.14 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.53:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #51.14
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.54:
                                # LOE rax r13 r14 r12d r15d
..B1.119:                       # Preds ..B1.118
                                # Execution count [3.15e+03]: Infreq
        movl      20464(%rsp), %ecx                             #49.39[spill] c1
        movl      20472(%rsp), %edx                             #49.60[spill] c1
        movl      %r15d, %r15d                                  #50.37 c1
        movl      %r12d, %r12d                                  #50.59 c1
        shlq      $32, %r15                                     #50.53 c3
        movq      %rax, %rdi                                    #51.36 c3
        shlq      $32, %rcx                                     #49.54 c5
        orq       %r12, %r15                                    #50.59 c5
        orq       %rdx, %rcx                                    #49.60 c7
        subq      %rcx, %r15                                    #51.39 c9
        movq      %r15, %rsi                                    #51.36 c11
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.55:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, unsigned long long)
        call      _ZNSolsEy@PLT                                 #51.36
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.56:
                                # LOE rax r13 r14 r15
..B1.120:                       # Preds ..B1.119
                                # Execution count [3.15e+03]: Infreq
        movq      %rax, %rdi                                    #51.51 c1
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rsi #51.51 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.57:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E@PLT                          #51.51
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.58:
                                # LOE r13 r14 r15
..B1.121:                       # Preds ..B1.120
                                # Execution count [3.15e+03]: Infreq
        vcvtusi2sdq %r15, %xmm16, %xmm16                        #52.28 c1
        addq      53416(%rsp), %r14                             #141.46[spill] c1
        xorb      %dl, %dl                                      #54.25 c1
        lea       128(%rsp), %rcx                               #104.39 c1
        movq      %rcx, 53208(%rcx)                             #104.39[spill] c3
        vaddsd    53408(%rsp), %xmm16, %xmm0                    #52.9[spill] c3
        movq      %r14, 53192(%rcx)                             #104.39[spill] c5
        xorl      %r12d, %r12d                                  #54.25 c5
        movb      %dl, 20384(%rcx)                              #104.39[spill] c7
        vmovsd    %xmm0, 53408(%rsp)                            #52.9[spill] c9
        movq      %r13, 20376(%rcx)                             #104.39[spill] c9
                                # LOE r12
..B1.122:                       # Preds ..B1.139 ..B1.121
                                # Execution count [9.44e+03]: Infreq
        nop                                                     #57.0
        cpuid                                                   #57.0
        rdtsc                                                   #57.0
        movl      %edx, %r13d                                   #57.0
        movl      %eax, %r15d                                   #57.0
        vpxord    %zmm0, %zmm0, %zmm0                           #68.15 c1
        vmovups   %zmm0, 18752(%rsp)                            #68.15 c3
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi                #80.14 c3
        movl      %r13d, 53328(%rsp)                            #57.0[spill] c7 stall 1
        lea       .L_2__STRING.3(%rip), %rsi                    #80.14 c7
        vmovups   %zmm0, 18816(%rsp)                            #68.15 c9
        vmovups   %zmm0, 18880(%rsp)                            #68.15 c9
        vmovups   %zmm0, 18944(%rsp)                            #68.15 c15 stall 2
        vmovups   %zmm0, 19008(%rsp)                            #68.15 c15
        vmovups   %zmm0, 19072(%rsp)                            #68.15 c21 stall 2
        vmovups   %zmm0, 19136(%rsp)                            #68.15 c21
        vmovups   %zmm0, 19200(%rsp)                            #68.15 c27 stall 2
        vmovups   %zmm0, 19264(%rsp)                            #68.15 c27
        vmovups   %zmm0, 19328(%rsp)                            #68.15 c33 stall 2
        vmovups   %zmm0, 19392(%rsp)                            #68.15 c33
        vmovups   %zmm0, 19456(%rsp)                            #68.15 c39 stall 2
        vmovups   %zmm0, 19520(%rsp)                            #68.15 c39
        vmovups   %zmm0, 19584(%rsp)                            #68.15 c45 stall 2
        vmovups   %zmm0, 19648(%rsp)                            #68.15 c45
        vmovups   %zmm0, 19712(%rsp)                            #68.15 c51 stall 2
        vmovups   %zmm0, 19776(%rsp)                            #68.15 c51
        vmovups   %zmm0, 19840(%rsp)                            #68.15 c57 stall 2
        vmovups   %zmm0, 19904(%rsp)                            #68.15 c57
        vmovups   %zmm0, 19968(%rsp)                            #68.15 c63 stall 2
        vmovups   %zmm0, 20032(%rsp)                            #68.15 c63
        vmovups   %zmm0, 20096(%rsp)                            #68.15 c69 stall 2
        vmovups   %zmm0, 20160(%rsp)                            #68.15 c69
        vmovups   %zmm0, 20224(%rsp)                            #68.15 c75 stall 2
        rdtscp                                                  #72.0
        movl      %edx, %r13d                                   #72.0
        movl      %eax, %r14d                                   #72.0
        cpuid                                                   #72.0
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.59:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #80.14
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.60:
                                # LOE rax r12 r13d r14d r15d
..B1.270:                       # Preds ..B1.122
                                # Execution count [9.44e+03]: Infreq
        movq      %rax, %rdi                                    #80.14 c1
                                # LOE rdi r12 r13d r14d r15d
..B1.123:                       # Preds ..B1.270
                                # Execution count [9.44e+03]: Infreq
        movl      53328(%rsp), %eax                             #80.33[spill] c1
        movl      %r13d, %r13d                                  #80.33 c1
        movl      %r14d, %r14d                                  #80.33 c1
        shlq      $32, %r13                                     #80.33 c3
        movl      %r15d, %r15d                                  #80.33 c3
        shlq      $32, %rax                                     #80.33 c5
        orq       %r14, %r13                                    #80.33 c5
        orq       %r15, %rax                                    #80.33 c7
        subq      %rax, %r13                                    #80.33 c9
        movq      %r13, %rsi                                    #80.33 c11
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.61:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, unsigned long long)
        call      _ZNSolsEy@PLT                                 #80.33
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.62:
                                # LOE rax r12
..B1.124:                       # Preds ..B1.123
                                # Execution count [9.44e+03]: Infreq
        movq      %rax, %rdi                                    #80.48 c1
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rsi #80.48 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.63:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E@PLT                          #80.48
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.64:
                                # LOE r12
..B1.125:                       # Preds ..B1.124
                                # Execution count [9.44e+03]: Infreq
        nop                                                     #85.0
        nop                                                     #85.0
        cpuid                                                   #85.0
        rdtsc                                                   #85.0
        movl      %edx, %r8d                                    #85.0
        movl      %eax, %edi                                    #85.0
        xorl      %ecx, %ecx                                    #94.11 c1
        xorl      %edx, %edx                                    #97.13 c1
        vmovups   18752(%rsp), %zmm23                           #107.33 c1
        vmovups   18816(%rsp), %zmm22                           #107.33 c3
        vmovups   18880(%rsp), %zmm21                           #107.33 c7 stall 1
        vmovups   18944(%rsp), %zmm20                           #107.33 c9
        vmovups   19008(%rsp), %zmm19                           #107.33 c13 stall 1
        vmovups   19072(%rsp), %zmm18                           #107.33 c15
        vmovups   19136(%rsp), %zmm17                           #107.33 c19 stall 1
        vmovups   19200(%rsp), %zmm16                           #107.33 c21
        vmovups   19264(%rsp), %zmm15                           #107.33 c25 stall 1
        vmovups   19328(%rsp), %zmm14                           #107.33 c27
        vmovups   19392(%rsp), %zmm13                           #107.33 c31 stall 1
        vmovups   19456(%rsp), %zmm12                           #107.33 c33
        vmovups   19520(%rsp), %zmm11                           #107.33 c37 stall 1
        vmovups   19584(%rsp), %zmm10                           #107.33 c39
        vmovups   19648(%rsp), %zmm9                            #107.33 c43 stall 1
        vmovups   19712(%rsp), %zmm8                            #107.33 c45
        vmovups   19776(%rsp), %zmm7                            #107.33 c49 stall 1
        vmovups   19840(%rsp), %zmm6                            #107.33 c51
        vmovups   19904(%rsp), %zmm5                            #107.33 c55 stall 1
        vmovups   19968(%rsp), %zmm4                            #107.33 c57
        vmovups   20032(%rsp), %zmm3                            #107.33 c61 stall 1
        vmovups   20096(%rsp), %zmm2                            #107.33 c63
        vmovups   20160(%rsp), %zmm1                            #107.33 c67 stall 1
        vmovups   20224(%rsp), %zmm0                            #107.33 c69
        movq      53336(%rsp), %rax                             #104.39[spill] c73 stall 1
                                # LOE rax rdx r12 ecx edi r8d zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 zmm8 zmm9 zmm10 zmm11 zmm12 zmm13 zmm14 zmm15 zmm16 zmm17 zmm18 zmm19 zmm20 zmm21 zmm22 zmm23
..B1.126:                       # Preds ..B1.126 ..B1.125
                                # Execution count [1.21e+06]: Infreq
        vmovups   20544(%rsp,%rdx), %zmm24                      #100.42 c1
        vmovups   20608(%rsp,%rdx), %zmm25                      #100.42 c1
        addl      $1, %ecx                                      #94.11 c1
        vmovups   20672(%rsp,%rdx), %zmm26                      #100.42 c7 stall 2
        vmovups   20736(%rsp,%rdx), %zmm27                      #100.42 c7
        addq      $256, %rdx                                    #94.11 c7
        vfmadd231ps (%rax){1to16}, %zmm24, %zmm23               #107.33 c13 stall 2
        vfmadd231ps (%rax){1to16}, %zmm25, %zmm22               #107.33 c13
        vfmadd231ps (%rax){1to16}, %zmm26, %zmm21               #107.33 c19 stall 2
        vfmadd231ps (%rax){1to16}, %zmm27, %zmm20               #107.33 c19
        vfmadd231ps 512(%rax){1to16}, %zmm24, %zmm19            #107.33 c25 stall 2
        vfmadd231ps 512(%rax){1to16}, %zmm25, %zmm18            #107.33 c25
        vfmadd231ps 512(%rax){1to16}, %zmm26, %zmm17            #107.33 c31 stall 2
        vfmadd231ps 512(%rax){1to16}, %zmm27, %zmm16            #107.33 c31
        vfmadd231ps 1024(%rax){1to16}, %zmm24, %zmm15           #107.33 c37 stall 2
        vfmadd231ps 1024(%rax){1to16}, %zmm25, %zmm14           #107.33 c37
        vfmadd231ps 1024(%rax){1to16}, %zmm26, %zmm13           #107.33 c43 stall 2
        vfmadd231ps 1024(%rax){1to16}, %zmm27, %zmm12           #107.33 c43
        vfmadd231ps 1536(%rax){1to16}, %zmm24, %zmm11           #107.33 c49 stall 2
        vfmadd231ps 1536(%rax){1to16}, %zmm25, %zmm10           #107.33 c49
        vfmadd231ps 1536(%rax){1to16}, %zmm26, %zmm9            #107.33 c55 stall 2
        vfmadd231ps 1536(%rax){1to16}, %zmm27, %zmm8            #107.33 c55
        vfmadd231ps 2048(%rax){1to16}, %zmm24, %zmm7            #107.33 c61 stall 2
        vfmadd231ps 2048(%rax){1to16}, %zmm25, %zmm6            #107.33 c61
        vfmadd231ps 2048(%rax){1to16}, %zmm26, %zmm5            #107.33 c67 stall 2
        vfmadd231ps 2048(%rax){1to16}, %zmm27, %zmm4            #107.33 c67
        vfmadd231ps 2560(%rax){1to16}, %zmm24, %zmm3            #107.33 c73 stall 2
        vfmadd231ps 2560(%rax){1to16}, %zmm25, %zmm2            #107.33 c73
        vfmadd231ps 2560(%rax){1to16}, %zmm26, %zmm1            #107.33 c79 stall 2
        vfmadd231ps 2560(%rax){1to16}, %zmm27, %zmm0            #107.33 c79
        addq      $4, %rax                                      #94.11 c79
        cmpl      $128, %ecx                                    #94.11 c79
        jb        ..B1.126      # Prob 99%                      #94.11 c81
                                # LOE rax rdx r12 ecx edi r8d zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 zmm8 zmm9 zmm10 zmm11 zmm12 zmm13 zmm14 zmm15 zmm16 zmm17 zmm18 zmm19 zmm20 zmm21 zmm22 zmm23
..B1.127:                       # Preds ..B1.126
                                # Execution count [9.44e+03]: Infreq
        vmovups   %zmm2, 20096(%rsp)                            #192.17 c1
        movl      %r8d, %r8d                                    #118.41 c1
        vmovups   %zmm3, 20032(%rsp)                            #192.17 c1
        movl      %edi, %edi                                    #118.62 c1
        vmovups   %zmm0, 20224(%rsp)                            #192.17 c7 stall 2
        shlq      $32, %r8                                      #118.56 c7
        vmovups   %zmm1, 20160(%rsp)                            #192.17 c7
        lea       .L_2__STRING.4(%rip), %rsi                    #121.16 c7
        vmovups   %zmm4, 19968(%rsp)                            #192.17 c13 stall 2
        orq       %rdi, %r8                                     #118.62 c13
        vmovups   %zmm5, 19904(%rsp)                            #192.17 c13
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi                #121.16 c19 stall 2
        vmovups   %zmm6, 19840(%rsp)                            #192.17 c19
        vmovups   %zmm7, 19776(%rsp)                            #192.17 c23 stall 1
        vmovups   %zmm8, 19712(%rsp)                            #192.17 c25
        vmovups   %zmm9, 19648(%rsp)                            #192.17 c29 stall 1
        vmovups   %zmm10, 19584(%rsp)                           #192.17 c31
        vmovups   %zmm11, 19520(%rsp)                           #192.17 c35 stall 1
        vmovups   %zmm12, 19456(%rsp)                           #192.17 c37
        vmovups   %zmm13, 19392(%rsp)                           #192.17 c41 stall 1
        vmovups   %zmm14, 19328(%rsp)                           #192.17 c43
        vmovups   %zmm15, 19264(%rsp)                           #192.17 c47 stall 1
        vmovups   %zmm16, 19200(%rsp)                           #192.17 c49
        vmovups   %zmm17, 19136(%rsp)                           #192.17 c53 stall 1
        vmovups   %zmm18, 19072(%rsp)                           #192.17 c55
        vmovups   %zmm19, 19008(%rsp)                           #192.17 c59 stall 1
        vmovups   %zmm20, 18944(%rsp)                           #192.17 c61
        vmovups   %zmm21, 18880(%rsp)                           #192.17 c65 stall 1
        vmovups   %zmm22, 18816(%rsp)                           #192.17 c67
        vmovups   %zmm23, 18752(%rsp)                           #192.17 c71 stall 1
        rdtscp                                                  #112.0
        movl      %edx, %r13d                                   #112.0
        movl      %eax, %r9d                                    #112.0
        cpuid                                                   #112.0
        movl      %r13d, %r13d                                  #119.39 c75
        movl      %r9d, %r9d                                    #119.61 c75
        shlq      $32, %r13                                     #119.55 c77
        orq       %r9, %r13                                     #119.61 c79
        subq      %r8, %r13                                     #120.25 c81
        vcvtusi2sdq %r13, %xmm16, %xmm16                        #120.31 c83
        vaddsd    53472(%rsp), %xmm16, %xmm0                    #120.11[spill] c85
        vmovsd    %xmm0, 53472(%rsp)                            #120.11[spill] c91 stall 2
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.65:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #121.16
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.66:
                                # LOE rax r12 r13
..B1.128:                       # Preds ..B1.127
                                # Execution count [9.44e+03]: Infreq
        movq      %rax, %rdi                                    #121.34 c1
        movq      %r13, %rsi                                    #121.34 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.67:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, unsigned long long)
        call      _ZNSolsEy@PLT                                 #121.34
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.68:
                                # LOE rax r12
..B1.129:                       # Preds ..B1.128
                                # Execution count [9.44e+03]: Infreq
        movq      %rax, %rdi                                    #121.49 c1
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rsi #121.49 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.69:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E@PLT                          #121.49
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.70:
                                # LOE r12
..B1.130:                       # Preds ..B1.129
                                # Execution count [9.44e+03]: Infreq
        cpuid                                                   #125.0
        rdtsc                                                   #125.0
        movl      %edx, %r8d                                    #125.0
        movl      %eax, %edi                                    #125.0
        xorl      %edx, %edx                                    #132.37 c1
        movq      %r12, 53312(%rsp)                             #135.13[spill] c1
        xorl      %r14d, %r14d                                  #135.13 c1
        movq      20528(%rsp), %rcx                             #132.28[spill] c3
        movq      20536(%rsp), %r11                             #135.13[spill] c3
        lea       (%rcx,%r12), %rax                             #132.28 c7 stall 1
        movq      53488(%rsp), %rcx                             #133.11[spill] c7
        divq      53488(%rsp)                                   #132.37[spill] c9
        movq      53488(%rsp), %r12                             #135.13[spill] c11
        movq      53536(%rsp), %r13                             #135.13[spill] c15 stall 1
        movq      53544(%rsp), %r15                             #135.13[spill] c19 stall 1
        movq      53320(%rsp), %r10                             #135.13[spill] c23 stall 1
        movq      %rax, %rsi                                    #132.37 c109 stall 42
        movq      %rdx, %rbx                                    #132.37 c109
        addq      20520(%rsp), %rsi                             #133.42[spill] c111
        xorl      %edx, %edx                                    #134.11 c111
        xorl      %eax, %eax                                    #135.13 c111
        imulq     %rsi, %rcx                                    #133.11 c113
                                # LOE rax rdx rcx rbx rsi r10 r11 r12 r13 r14 r15 edi r8d
..B1.131:                       # Preds ..B1.134 ..B1.133 ..B1.130
                                # Execution count [2.83e+04]: Infreq
        cmpq      %r13, %rsi                                    #135.23 c1
        jae       ..B1.140      # Prob 20%                      #135.23 c3
                                # LOE rax rdx rcx rbx rsi r10 r11 r12 r13 r14 r15 edi r8d
..B1.132:                       # Preds ..B1.131
                                # Execution count [2.26e+04]: Infreq
        lea       (%rbx,%r11), %r9                              #141.46 c1
        addq      $1, %rbx                                      #143.13 c1
        addq      $1, %rdx                                      #134.11 c1
        addq      %rcx, %r9                                     #141.46 c3
        imulq     %r15, %r9                                     #141.46 c5
        vmovups   (%r10,%r9,4), %zmm0                           #141.46 c9 stall 1
        vmovups   64(%r10,%r9,4), %zmm2                         #141.46 c9
        vmovups   128(%r10,%r9,4), %zmm4                        #141.46 c15 stall 2
        vmovups   192(%r10,%r9,4), %zmm6                        #141.46 c15
        vaddps    18752(%rsp,%rax), %zmm0, %zmm1                #141.17 c21 stall 2
        vmovups   %zmm1, (%r10,%r9,4)                           #140.31 c27 stall 2
        vaddps    18816(%rsp,%rax), %zmm2, %zmm3                #141.17 c27
        vmovups   %zmm3, 64(%r10,%r9,4)                         #140.31 c33 stall 2
        vaddps    18880(%rsp,%rax), %zmm4, %zmm5                #141.17 c33
        vmovups   %zmm5, 128(%r10,%r9,4)                        #140.31 c39 stall 2
        vaddps    18944(%rsp,%rax), %zmm6, %zmm7                #141.17 c39
        vmovups   %zmm7, 192(%r10,%r9,4)                        #140.31 c45 stall 2
        addq      $256, %rax                                    #134.11 c45
        cmpq      %r12, %rbx                                    #144.23 c45
        jb        ..B1.134      # Prob 38%                      #144.23 c47
                                # LOE rax rdx rcx rbx rsi r10 r11 r12 r13 r14 r15 edi r8d
..B1.133:                       # Preds ..B1.132
                                # Execution count [1.40e+04]: Infreq
        addq      %r12, %rcx                                    #145.15 c1
        addq      $1, %rsi                                      #145.15 c1
        movq      %r14, %rbx                                    #146.15 c3
        cmpq      $6, %rdx                                      #134.11 c3
        jb        ..B1.131      # Prob 83%                      #134.11 c5
        jmp       ..B1.211      # Prob 100%                     #134.11 c5
                                # LOE rax rdx rcx rbx rsi r10 r11 r12 r13 r14 r15 edi r8d
..B1.134:                       # Preds ..B1.132
                                # Execution count [8.60e+03]: Infreq
        cmpq      $6, %rdx                                      #134.11 c1
        jb        ..B1.131      # Prob 83%                      #134.11 c3
                                # LOE rax rdx rcx rbx rsi r10 r11 r12 r13 r14 r15 edi r8d
..B1.135:                       # Preds ..B1.134
                                # Execution count [1.43e+03]: Infreq
        movq      %r10, 53320(%rsp)                             #[spill] c1
        movq      53312(%rsp), %r12                             #[spill] c1
                                # LOE r12 edi r8d
..B1.136:                       # Preds ..B1.211 ..B1.135
                                # Execution count [7.55e+03]: Infreq
        rdtscp                                                  #153.0
        movl      %edx, %r13d                                   #153.0
        movl      %eax, %r9d                                    #153.0
        cpuid                                                   #153.0
        movl      %r8d, %r8d                                    #159.41 c1
        movl      %edi, %edi                                    #159.62 c1
        movl      %r13d, %r13d                                  #160.39 c3
        movl      %r9d, %r9d                                    #160.61 c3
        shlq      $32, %r13                                     #160.55 c5
        shlq      $32, %r8                                      #159.56 c5
        orq       %r9, %r13                                     #160.61 c7
        orq       %rdi, %r8                                     #159.62 c7
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi                #162.16 c7
        subq      %r8, %r13                                     #161.25 c9
        lea       .L_2__STRING.5(%rip), %rsi                    #162.16 c9
        vcvtusi2sdq %r13, %xmm16, %xmm16                        #161.30 c11
        vaddsd    53440(%rsp), %xmm16, %xmm0                    #161.11[spill] c13
        vmovsd    %xmm0, 53440(%rsp)                            #161.11[spill] c19 stall 2
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.71:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #162.16
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.72:
                                # LOE rax r12 r13
..B1.137:                       # Preds ..B1.136
                                # Execution count [7.55e+03]: Infreq
        movq      %rax, %rdi                                    #162.36 c1
        movq      %r13, %rsi                                    #162.36 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.73:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, unsigned long long)
        call      _ZNSolsEy@PLT                                 #162.36
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.74:
                                # LOE rax r12
..B1.138:                       # Preds ..B1.137
                                # Execution count [7.55e+03]: Infreq
        movq      %rax, %rdi                                    #162.51 c1
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rsi #162.51 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.75:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E@PLT                          #162.51
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.76:
                                # LOE r12
..B1.139:                       # Preds ..B1.138
                                # Execution count [7.55e+03]: Infreq
        movb      20512(%rsp), %al                              #54.55[spill] c1
        addq      $3072, 53336(%rsp)                            #54.55[spill] c1
        addq      $6, %r12                                      #54.55 c1
        addb      $1, %al                                       #54.55 c5 stall 1
        movb      %al, 20512(%rsp)                              #54.55[spill] c7
        cmpb      $6, %al                                       #54.36 c7
        jb        ..B1.122      # Prob 83%                      #54.36 c9
                                # LOE r12
..B1.140:                       # Preds ..B1.131 ..B1.211 ..B1.139
                                # Execution count [1.26e+03]: Infreq
        movq      20504(%rsp), %r13                             #[spill] c1
                                # LOE r13
..B1.141:                       # Preds ..B1.140
                                # Execution count [3.15e+03]: Infreq
        addq      $1, %r13                                      #31.54 c1
        cmpq      53424(%rsp), %r13                             #31.34[spill] c3
        jb        ..B1.115      # Prob 82%                      #31.34 c5
                                # LOE r13
..B1.142:                       # Preds ..B1.141
                                # Execution count [5.66e+02]: Infreq
        movq      18720(%rsp), %r15                             #[spill] c1
        movq      18712(%rsp), %r14                             #[spill] c1
        xorl      %r13d, %r13d                                  # c1
        movq      53424(%rsp), %r12                             #[spill] c5 stall 1
                                # LOE r12 r13 r14 r15
..B1.143:                       # Preds ..B1.142 ..B1.113
                                # Execution count [6.29e+02]: Infreq
        addq      $1, %r14                                      #7.42 c1
        addq      $512, %r15                                    #7.42 c1
        cmpq      20456(%rsp), %r14                             #7.32[spill] c3
        jb        ..B1.101      # Prob 82%                      #7.32 c5
                                # LOE r12 r13 r14 r15
..B1.144:                       # Preds ..B1.143
                                # Execution count [1.13e+02]: Infreq
        vpxord    %zmm1, %zmm1, %zmm1                           # c1
        movq      20520(%rsp), %rcx                             #[spill] c1
        movq      20528(%rsp), %rdx                             #[spill] c1
        movq      20488(%rsp), %r10                             #[spill] c5 stall 1
        movq      20456(%rsp), %r9                              #[spill] c5
        movq      18672(%rsp), %r11                             #[spill] c9 stall 1
        movq      18704(%rsp), %rax                             #[spill] c9
        movq      18664(%rsp), %r8                              #[spill] c13 stall 1
                                # LOE rax rdx rcx r8 r9 r10 r11 r12 r13 zmm1
..B1.145:                       # Preds ..B1.144 ..B1.99
                                # Execution count [1.26e+02]: Infreq
        testq     %r10, %r10                                    #169.14 c1
        jne       ..B1.174      # Prob 50%                      #169.14 c3
                                # LOE rax rdx rcx r8 r9 r10 r11 r12 r13 zmm1
..B1.146:                       # Preds ..B1.145 ..B1.184 ..B1.201
                                # Execution count [1.26e+02]: Infreq
        addq      $1, %rax                                      #6.31 c1
        cmpq      %r8, %rax                                     #6.26 c3
        jb        ..B1.99       # Prob 82%                      #6.26 c5
                                # LOE rax rdx rcx r8 r9 r10 r11 r12 r13 zmm1
..B1.147:                       # Preds ..B1.146
                                # Execution count [2.26e+01]: Infreq
        movq      18568(%rsp), %r9                              #[spill] c1
        movq      18576(%rsp), %r10                             #[spill] c1
        movq      18608(%rsp), %rdi                             #[spill] c5 stall 1
        movq      18600(%rsp), %r14                             #[spill] c5
        movq      18616(%rsp), %rsi                             #[spill] c9 stall 1
        movq      18624(%rsp), %r15                             #[spill] c9
                                # LOE rdx rcx rsi rdi r8 r9 r10 r13 r14 r15 zmm1
..B1.148:                       # Preds ..B1.147 ..B1.97
                                # Execution count [2.52e+01]: Infreq
        addq      $1, %r10                                      #5.29 c1
        addq      %rdi, %r9                                     #5.29 c1
        cmpq      %rsi, %r10                                    #5.24 c3
        jb        ..B1.97       # Prob 82%                      #5.24 c5
                                # LOE rdx rcx rsi rdi r8 r9 r10 r13 r14 r15 zmm1
..B1.149:                       # Preds ..B1.148
                                # Execution count [4.53e+00]: Infreq
        movq      72(%rsp), %rbx                                #[spill] c1
        movq      104(%rsp), %r8                                #[spill] c1
        movq      80(%rsp), %rax                                #[spill] c5 stall 1
        movq      88(%rsp), %r11                                #[spill] c5
        movq      96(%rsp), %r12                                #[spill] c9 stall 1
                                # LOE rax rdx rcx rbx rsi rdi r8 r11 r12 r13 zmm1
..B1.150:                       # Preds ..B1.225 ..B1.149 ..B1.95
                                # Execution count [5.03e+00]: Infreq
        addq      $1, %r11                                      #104.31 c1
        cmpq      %r12, %r11                                    #104.26 c3
        jb        ..B1.7        # Prob 82%                      #104.26 c5
                                # LOE rax rdx rcx rbx rsi rdi r8 r11 r12 r13 zmm1
..B1.152:                       # Preds ..B1.150 ..B1.5
                                # Execution count [1.01e+00]: Infreq
        movq      _ZSt4cout@GOTPCREL(%rip), %r12                #115.8 c1
        lea       .L_2__STRING.6(%rip), %rsi                    #115.8 c1
        movq      %r12, %rdi                                    #115.8 c5 stall 1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.77:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #115.8
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.78:
                                # LOE rax r12
..B1.153:                       # Preds ..B1.152
                                # Execution count [1.01e+00]: Infreq
        movq      %rax, %rdi                                    #115.25 c1
        vmovsd    20416(%rsp), %xmm0                            #115.25[spill] c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.79:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, double)
        call      _ZNSolsEd@PLT                                 #115.25
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.80:
                                # LOE rax r12
..B1.154:                       # Preds ..B1.153
                                # Execution count [1.01e+00]: Infreq
        movq      %rax, %rdi                                    #115.39 c1
        lea       .L_2__STRING.7(%rip), %rsi                    #115.39 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.81:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #115.39
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.82:
                                # LOE rax r12
..B1.155:                       # Preds ..B1.154
                                # Execution count [1.01e+00]: Infreq
        movq      %rax, %rdi                                    #115.57 c1
        vmovsd    53408(%rsp), %xmm0                            #115.57[spill] c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.83:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, double)
        call      _ZNSolsEd@PLT                                 #115.57
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.84:
                                # LOE rax r12
..B1.156:                       # Preds ..B1.155
                                # Execution count [1.01e+00]: Infreq
        movq      %rax, %rdi                                    #115.71 c1
        lea       .L_2__STRING.8(%rip), %rsi                    #115.71 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.85:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #115.71
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.86:
                                # LOE rax r12
..B1.157:                       # Preds ..B1.156
                                # Execution count [1.01e+00]: Infreq
        movq      %rax, %rdi                                    #116.5 c1
        vmovsd    53472(%rsp), %xmm0                            #116.5[spill] c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.87:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, double)
        call      _ZNSolsEd@PLT                                 #116.5
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.88:
                                # LOE rax r12
..B1.158:                       # Preds ..B1.157
                                # Execution count [1.01e+00]: Infreq
        movq      %rax, %rdi                                    #116.19 c1
        lea       .L_2__STRING.9(%rip), %rsi                    #116.19 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.89:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #116.19
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.90:
                                # LOE rax r12
..B1.159:                       # Preds ..B1.158
                                # Execution count [1.01e+00]: Infreq
        movq      %rax, %rdi                                    #116.37 c1
        vmovsd    53440(%rsp), %xmm0                            #116.37[spill] c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.91:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, double)
        call      _ZNSolsEd@PLT                                 #116.37
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.92:
                                # LOE rax r12
..B1.160:                       # Preds ..B1.159
                                # Execution count [1.01e+00]: Infreq
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rbx #116.51 c1
        movq      %rax, %rdi                                    #116.51 c1
        movq      %rbx, %rsi                                    #116.51 c5 stall 1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.93:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E@PLT                          #116.51
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.94:
                                # LOE rbx r12
..B1.161:                       # Preds ..B1.160
                                # Execution count [1.01e+00]: Infreq
        movq      %r12, %rdi                                    #117.8 c1
        lea       .L_2__STRING.10(%rip), %rsi                   #117.8 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.95:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #117.8
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.96:
                                # LOE rax rbx r12
..B1.162:                       # Preds ..B1.161
                                # Execution count [1.01e+00]: Infreq
        vmovsd    20416(%rsp), %xmm0                            #117.55[spill] c1
        vmovsd    .L_2il0floatpacket.1(%rip), %xmm23            #117.25 c1
        movq      %rax, %rdi                                    #117.25 c1
        vaddsd    53472(%rsp), %xmm0, %xmm16                    #117.55[spill] c7 stall 2
        vgetmantsd $0, %xmm0, %xmm0, %xmm22                     #117.25 c7
        vgetexpsd %xmm0, %xmm0, %xmm18                          #117.25 c7
        vaddsd    53440(%rsp), %xmm16, %xmm17                   #117.68[spill] c13 stall 2
        vgetmantsd $0, %xmm17, %xmm17, %xmm21                   #117.25 c19 stall 2
        vmovsd    %xmm21, 24(%rsp)                              #117.25[spill] c25 stall 2
        vrcp28sd  %xmm21, %xmm21, %xmm20                        #117.25 c25
        vmovsd    %xmm20, 16(%rsp)                              #117.25[spill] c33 stall 3
        vmulsd    {rn-sae}, %xmm22, %xmm20, %xmm24              #117.25 c33
        vfnmadd231sd {rn-sae}, %xmm21, %xmm20, %xmm23           #117.25 c33
        vgetexpsd %xmm17, %xmm17, %xmm19                        #117.25 c39 stall 2
        vmovsd    %xmm19, (%rsp)                                #117.25[spill] c45 stall 2
        vfnmadd231sd {rn-sae}, %xmm21, %xmm24, %xmm22           #117.25 c45
        vfmadd132sd {rn-sae}, %xmm20, %xmm20, %xmm23            #117.25 c45
        vmovsd    %xmm23, 8(%rsp)                               #117.25[spill] c47
        vsubsd    %xmm19, %xmm18, %xmm25                        #117.25 c47
        vfmadd231sd {rn-sae}, %xmm23, %xmm22, %xmm24            #117.25 c51 stall 1
        vscalefsd %xmm25, %xmm24, %xmm0                         #117.25 c57 stall 2
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.97:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, double)
        call      _ZNSolsEd@PLT                                 #117.25
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.98:
                                # LOE rax rbx r12
..B1.163:                       # Preds ..B1.162
                                # Execution count [1.01e+00]: Infreq
        movq      %rax, %rdi                                    #117.80 c1
        movq      %rbx, %rsi                                    #117.80 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.99:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E@PLT                          #117.80
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.100:
                                # LOE rbx r12
..B1.164:                       # Preds ..B1.163
                                # Execution count [1.01e+00]: Infreq
        movq      %r12, %rdi                                    #118.8 c1
        lea       .L_2__STRING.11(%rip), %rsi                   #118.8 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.101:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #118.8
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.102:
                                # LOE rax rbx r12
..B1.165:                       # Preds ..B1.164
                                # Execution count [1.01e+00]: Infreq
        vgetmantsd $0, 53408(%rsp), %xmm19, %xmm19              #118.25[spill] c1
        vmovsd    16(%rsp), %xmm17                              #118.25[spill] c1
        movq      %rax, %rdi                                    #118.25 c1
        vmulsd    {rn-sae}, %xmm19, %xmm17, %xmm21              #118.25 c7 stall 2
        vmovsd    24(%rsp), %xmm18                              #118.25[spill] c7
        vgetexpsd 53408(%rsp), %xmm16, %xmm16                   #118.25[spill] c7
        vfnmadd231sd {rn-sae}, %xmm18, %xmm21, %xmm19           #118.25 c13 stall 2
        vmovsd    8(%rsp), %xmm20                               #118.25[spill] c13
        vsubsd    (%rsp), %xmm16, %xmm22                        #118.25[spill] c13
        vfmadd231sd {rn-sae}, %xmm20, %xmm19, %xmm21            #118.25 c19 stall 2
        vscalefsd %xmm22, %xmm21, %xmm0                         #118.25 c25 stall 2
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.103:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, double)
        call      _ZNSolsEd@PLT                                 #118.25
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.104:
                                # LOE rax rbx r12
..B1.166:                       # Preds ..B1.165
                                # Execution count [1.01e+00]: Infreq
        movq      %rax, %rdi                                    #118.80 c1
        movq      %rbx, %rsi                                    #118.80 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.105:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E@PLT                          #118.80
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.106:
                                # LOE rbx r12
..B1.167:                       # Preds ..B1.166
                                # Execution count [1.01e+00]: Infreq
        movq      %r12, %rdi                                    #119.8 c1
        lea       .L_2__STRING.12(%rip), %rsi                   #119.8 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.107:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #119.8
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.108:
                                # LOE rax rbx r12
..B1.168:                       # Preds ..B1.167
                                # Execution count [1.01e+00]: Infreq
        vgetmantsd $0, 53472(%rsp), %xmm19, %xmm19              #119.25[spill] c1
        vmovsd    16(%rsp), %xmm17                              #119.25[spill] c1
        movq      %rax, %rdi                                    #119.25 c1
        vmulsd    {rn-sae}, %xmm19, %xmm17, %xmm21              #119.25 c7 stall 2
        vmovsd    24(%rsp), %xmm18                              #119.25[spill] c7
        vgetexpsd 53472(%rsp), %xmm16, %xmm16                   #119.25[spill] c7
        vfnmadd231sd {rn-sae}, %xmm18, %xmm21, %xmm19           #119.25 c13 stall 2
        vmovsd    8(%rsp), %xmm20                               #119.25[spill] c13
        vsubsd    (%rsp), %xmm16, %xmm22                        #119.25[spill] c13
        vfmadd231sd {rn-sae}, %xmm20, %xmm19, %xmm21            #119.25 c19 stall 2
        vscalefsd %xmm22, %xmm21, %xmm0                         #119.25 c25 stall 2
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.109:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, double)
        call      _ZNSolsEd@PLT                                 #119.25
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.110:
                                # LOE rax rbx r12
..B1.169:                       # Preds ..B1.168
                                # Execution count [1.01e+00]: Infreq
        movq      %rax, %rdi                                    #119.80 c1
        movq      %rbx, %rsi                                    #119.80 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.111:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E@PLT                          #119.80
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.112:
                                # LOE rbx r12
..B1.170:                       # Preds ..B1.169
                                # Execution count [1.01e+00]: Infreq
        movq      %r12, %rdi                                    #120.8 c1
        lea       .L_2__STRING.13(%rip), %rsi                   #120.8 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.113:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #120.8
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.114:
                                # LOE rax rbx
..B1.171:                       # Preds ..B1.170
                                # Execution count [1.01e+00]: Infreq
        vgetmantsd $0, 53440(%rsp), %xmm19, %xmm19              #120.25[spill] c1
        vmovsd    16(%rsp), %xmm17                              #120.25[spill] c1
        movq      %rax, %rdi                                    #120.25 c1
        vmulsd    {rn-sae}, %xmm19, %xmm17, %xmm21              #120.25 c7 stall 2
        vmovsd    24(%rsp), %xmm18                              #120.25[spill] c7
        vgetexpsd 53440(%rsp), %xmm16, %xmm16                   #120.25[spill] c7
        vfnmadd231sd {rn-sae}, %xmm18, %xmm21, %xmm19           #120.25 c13 stall 2
        vmovsd    8(%rsp), %xmm20                               #120.25[spill] c13
        vsubsd    (%rsp), %xmm16, %xmm22                        #120.25[spill] c13
        vfmadd231sd {rn-sae}, %xmm20, %xmm19, %xmm21            #120.25 c19 stall 2
        vscalefsd %xmm22, %xmm21, %xmm0                         #120.25 c25 stall 2
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.115:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, double)
        call      _ZNSolsEd@PLT                                 #120.25
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.116:
                                # LOE rax rbx
..B1.172:                       # Preds ..B1.171
                                # Execution count [1.01e+00]: Infreq
        movq      %rax, %rdi                                    #120.80 c1
        movq      %rbx, %rsi                                    #120.80 c1
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.117:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E@PLT                          #120.80
..___tag_value__Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm.118:
                                # LOE
..B1.173:                       # Preds ..B1.172
                                # Execution count [1.01e+00]: Infreq
        movq      64(%rsp), %rbx                                #122.1[spill] c1
	.cfi_restore 3
        movq      32(%rsp), %r12                                #122.1[spill] c1
	.cfi_restore 12
        movq      40(%rsp), %r13                                #122.1[spill] c5 stall 1
	.cfi_restore 13
        movq      48(%rsp), %r14                                #122.1[spill] c5
	.cfi_restore 14
        movq      56(%rsp), %r15                                #122.1[spill] c9 stall 1
	.cfi_restore 15
        movq      %rbp, %rsp                                    #122.1 c11
        popq      %rbp                                          #122.1
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #122.1
	.cfi_def_cfa 6, 16
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x00, 0x2f, 0xff, 0xff, 0x22
	.cfi_offset 6, -16
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0x2e, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0x2e, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0x2e, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0x2e, 0xff, 0xff, 0x22
                                # LOE
..B1.174:                       # Preds ..B1.145
                                # Execution count [6.29e+01]: Infreq
        xorb      %sil, %sil                                    #7.17 c1
        movq      %rax, 18704(%rsp)                             #7.17[spill] c1
        movl      %eax, %edi                                    #9.92 c1
        movl      %edi, 20352(%rsp)                             #7.17[spill] c3
        movq      %rdx, %r14                                    #5.13 c3
        movq      %rcx, %r15                                    #6.13 c3
        movl      20408(%rsp), %r12d                            #7.17[spill] c3
        movq      %r13, %rbx                                    #7.17 c5
        movq      %r13, %rcx                                    #7.17 c5
        movb      %sil, %r13b                                   #7.17 c7
                                # LOE rcx rbx r14 r15 r12d r13b
..B1.175:                       # Preds ..B1.183 ..B1.174
                                # Execution count [2.26e+03]: Infreq
        movq      53376(%rsp), %rsi                             #8.40[spill] c1
        movq      53368(%rsp), %rdx                             #9.40[spill] c1
        imulq     %r15, %rsi                                    #8.40 c5 stall 1
        subl      53384(%rsp), %esi                             #8.40[spill] c5
        imulq     %r14, %rdx                                    #9.40 c5
        addl      20344(%rsp), %esi                             #8.92[spill] c7
        movslq    %esi, %rsi                                    #8.92 c9
        subl      %r12d, %edx                                   #9.40 c9
        addl      20352(%rsp), %edx                             #9.92[spill] c11
        movslq    %edx, %rdx                                    #9.92 c13
        testq     %rsi, %rsi                                    #10.19 c13
        jl        ..B1.182      # Prob 16%                      #10.19 c15
                                # LOE rdx rcx rbx rsi r14 r15 r12d r13b
..B1.176:                       # Preds ..B1.175
                                # Execution count [1.90e+03]: Infreq
        cmpq      53344(%rsp), %rsi                             #10.52[spill] c1
        jge       ..B1.182      # Prob 50%                      #10.52 c3
                                # LOE rdx rcx rbx rsi r14 r15 r12d r13b
..B1.177:                       # Preds ..B1.176
                                # Execution count [9.51e+02]: Infreq
        testq     %rdx, %rdx                                    #11.21 c1
        jl        ..B1.181      # Prob 16%                      #11.21 c3
                                # LOE rdx rcx rbx rsi r14 r15 r12d r13b
..B1.178:                       # Preds ..B1.177
                                # Execution count [7.99e+02]: Infreq
        cmpq      20480(%rsp), %rdx                             #11.54[spill] c1
        jge       ..B1.181      # Prob 50%                      #11.54 c3
                                # LOE rdx rcx rbx rsi r14 r15 r12d r13b
..B1.179:                       # Preds ..B1.178
                                # Execution count [2.00e+00]: Infreq
        cmpq      $24, 20488(%rsp)                              #12.7[spill] c1
        je        ..B1.204      # Prob 0%                       #12.7 c3
                                # LOE rdx rcx rbx rsi r14 r15 r12d r13b
..B1.180:                       # Preds ..B1.179
                                # Execution count [3.99e+02]: Infreq
        imulq     20320(%rsp), %rsi                             #13.9[spill] c1
        lea       128(%rsp,%rbx), %rdi                          #13.9 c1
        addq      18656(%rsp), %rsi                             #13.9[spill] c5 stall 1
        addq      %rdx, %rsi                                    #13.9 c7
        movq      20296(%rsp), %rdx                             #13.9[spill] c7
        imulq     20312(%rsp), %rsi                             #13.9[spill] c9
        addq      20304(%rsp), %rsi                             #13.9[spill] c13 stall 1
        call      __intel_mic_avx512f_memcpy@PLT                #13.9 c15
                                # LOE rbx r14 r15 r12d r13b
..B1.293:                       # Preds ..B1.180
                                # Execution count [3.99e+02]: Infreq
        xorl      %ecx, %ecx                                    # c1
        jmp       ..B1.183      # Prob 100%                     # c1
                                # LOE rcx rbx r14 r15 r12d r13b
..B1.181:                       # Preds ..B1.177 ..B1.178
                                # Execution count [2.76e+00]: Infreq
        lea       128(%rsp,%rbx), %rdx                          #17.9 c1
        movl      $512, %eax                                    #17.9 c1
                                # LOE rax rdx rcx rbx r14 r15 r12d r13b
..B1.248:                       # Preds ..B1.181
                                # Execution count [2.76e+00]: Infreq
        vpxord    %zmm0, %zmm0, %zmm0                           # c1
                                # LOE rax rdx rcx rbx r14 r15 r12d r13b zmm0
..B1.249:                       # Preds ..B1.249 ..B1.248
                                # Execution count [5.52e+00]: Infreq
        vmovups   %zmm0, -64(%rdx,%rax)                         #17.9 c1
        vmovups   %zmm0, -128(%rdx,%rax)                        #17.9 c1
        vmovups   %zmm0, -192(%rdx,%rax)                        #17.9 c7 stall 2
        vmovups   %zmm0, -256(%rdx,%rax)                        #17.9 c7
        subq      $256, %rax                                    #17.9 c7
        jne       ..B1.249      # Prob 50%                      #17.9 c9
        jmp       ..B1.183      # Prob 100%                     #17.9 c9
                                # LOE rax rdx rcx rbx r14 r15 r12d r13b zmm0
..B1.182:                       # Preds ..B1.175 ..B1.176
                                # Execution count [6.57e+00]: Infreq
        lea       128(%rsp,%rbx), %rdx                          #22.7 c1
        movl      $512, %eax                                    #22.7 c1
                                # LOE rax rdx rcx rbx r14 r15 r12d r13b
..B1.251:                       # Preds ..B1.182
                                # Execution count [6.57e+00]: Infreq
        vpxord    %zmm0, %zmm0, %zmm0                           # c1
                                # LOE rax rdx rcx rbx r14 r15 r12d r13b zmm0
..B1.252:                       # Preds ..B1.252 ..B1.251
                                # Execution count [1.31e+01]: Infreq
        vmovups   %zmm0, -64(%rdx,%rax)                         #22.7 c1
        vmovups   %zmm0, -128(%rdx,%rax)                        #22.7 c1
        vmovups   %zmm0, -192(%rdx,%rax)                        #22.7 c7 stall 2
        vmovups   %zmm0, -256(%rdx,%rax)                        #22.7 c7
        subq      $256, %rax                                    #22.7 c7
        jne       ..B1.252      # Prob 50%                      #22.7 c9
                                # LOE rax rdx rcx rbx r14 r15 r12d r13b zmm0
..B1.183:                       # Preds ..B1.252 ..B1.249 ..B1.293 ..B1.208 ..B1.209
                                #      
                                # Execution count [2.26e+03]: Infreq
        addq      $1, %r14                                      #25.3 c1
        addb      $1, %r13b                                     #7.39 c1
        lea       1(%r15), %rax                                 #27.5 c1
        cmpq      53488(%rsp), %r14                             #27.5[spill] c3
        cmovae    %rax, %r15                                    #27.5 c5
        cmovae    %rcx, %r14                                    #28.5 c5
        addq      $512, %rbx                                    #7.39 c7
        cmpb      $36, %r13b                                    #7.28 c7
        jb        ..B1.175      # Prob 97%                      #7.28 c9
                                # LOE rcx rbx r14 r15 r12d r13b
..B1.184:                       # Preds ..B1.183
                                # Execution count [6.29e+01]: Infreq
        movq      53424(%rsp), %r12                             #[spill] c1
        movq      %rcx, %r13                                    # c1
        movq      53416(%rsp), %rdi                             #172.25[spill] c1
        vpxord    %zmm1, %zmm1, %zmm1                           # c1
        movq      %r13, %r14                                    #171.7 c3
        movq      20520(%rsp), %rcx                             #[spill] c5
        movq      20528(%rsp), %rdx                             #[spill] c5
        movq      %r14, %rbx                                    #172.25 c5
        movq      20488(%rsp), %r10                             #[spill] c9 stall 1
        movq      20456(%rsp), %r9                              #[spill] c9
        movq      18672(%rsp), %r11                             #[spill] c13 stall 1
        movq      18704(%rsp), %rax                             #[spill] c13
        movq      18664(%rsp), %r8                              #[spill] c17 stall 1
        testq     %r12, %r12                                    #171.34 c17
        jbe       ..B1.146      # Prob 9%                       #171.34 c19
                                # LOE rax rdx rcx rbx rdi r8 r9 r10 r11 r12 r13 r14 zmm1
..B1.185:                       # Preds ..B1.184
                                # Execution count [0.00e+00]: Infreq
        lea       128(%rsp), %rsi                               #104.39 c1
        vmovaps   %zmm1, %zmm0                                  #104.39 c1
        movq      18568(%rsi), %r15                             #104.39[spill] c3
        movq      20408(%rsi), %rcx                             #104.39[spill] c3
        movq      20232(%rsi), %rdx                             #104.39[spill] c7 stall 1
        movq      53360(%rsi), %r8                              #104.39[spill] c7
                                # LOE rax rdx rcx rbx rsi rdi r8 r12 r13 r14 r15 zmm0 zmm1
..B1.186:                       # Preds ..B1.200 ..B1.185
                                # Execution count [0.00e+00]: Infreq
        movq      %rdx, %r9                                     #30.40 c1
        movq      %r8, 53488(%rsp)                              #30.40[spill] c1
        movq      %r13, %r10                                    #28.1 c1
        movq      24(%rsp), %r12                                #30.40[spill] c1
        imulq     %rax, %r9                                     #30.40 c3
        movq      20488(%rsp), %r13                             #30.40[spill] c3
        addq      %r15, %r9                                     #30.40 c7 stall 1
        addq      %rbx, %r9                                     #30.40 c9
                                # LOE rax rdx rcx rbx rsi rdi r9 r10 r12 r13 r14 r15 zmm0 zmm1
..B1.187:                       # Preds ..B1.188 ..B1.186
                                # Execution count [1.16e+04]: Infreq
        movq      %r12, %r8                                     #30.5 c1
        movq      %r10, %r11                                    #30.5 c1
        imulq     %r10, %r8                                     #30.5 c3
        shlq      $8, %r11                                      #30.5 c3
        vmovups   (%r9,%r8), %zmm2                              #30.5 c7 stall 1
        vmovups   %zmm2, 20544(%rsp,%r11)                       #30.5 c13 stall 2
        vmovups   64(%r9,%r8), %zmm3                            #30.5 c13
        vmovups   %zmm3, 20608(%rsp,%r11)                       #30.5 c19 stall 2
        vmovups   128(%r9,%r8), %zmm4                           #30.5 c19
        vmovups   %zmm4, 20672(%rsp,%r11)                       #30.5 c25 stall 2
        vmovups   192(%r9,%r8), %zmm5                           #30.5 c25
        vmovups   %zmm5, 20736(%rsp,%r11)                       #30.5 c31 stall 2
                                # LOE rax rdx rcx rbx rsi rdi r9 r10 r12 r13 r14 r15 zmm0 zmm1
..B1.188:                       # Preds ..B1.187
                                # Execution count [2.32e+06]: Infreq
        addq      $1, %r10                                      #28.1 c1
        cmpq      %r13, %r10                                    #28.1 c3
        jb        ..B1.187      # Prob 99%                      #28.1 c5
                                # LOE rax rdx rcx rbx rsi rdi r9 r10 r12 r13 r14 r15 zmm0 zmm1
..B1.189:                       # Preds ..B1.188
                                # Execution count [2.20e+02]: Infreq
        xorl      %r13d, %r13d                                  # c1
        movq      %rbx, 18680(%rsp)                             #189.39[spill] c1
        movq      53488(%rsp), %r8                              #[spill] c1
        movq      %r14, 18688(%rsp)                             #189.39[spill] c3
        xorb      %r11b, %r11b                                  #174.9 c3
        movq      %r15, 18696(%rsp)                             #189.39[spill] c5
        movq      %r13, %r10                                    #176.11 c5
        movq      %rax, 18704(%rsp)                             #189.39[spill] c5
        movq      %rsi, %r9                                     #189.39 c5
        movq      %rcx, 20536(%rsp)                             #189.39[spill] c7
        movq      20520(%rsp), %rsi                             #189.39[spill] c7
        movq      %rdx, 20360(%rsp)                             #189.39[spill] c9
        movq      20528(%rsp), %rcx                             #189.39[spill] c11
        movq      53536(%rsp), %rbx                             #189.39[spill] c11
                                # LOE rcx rbx rsi rdi r8 r9 r10 r13 r11b zmm0 zmm1
..B1.190:                       # Preds ..B1.198 ..B1.189
                                # Execution count [8.50e+02]: Infreq
        movq      %r13, %r12                                    #181.11 c1
        vmovaps   %zmm0, %zmm25                                 #178.31 c1
        vmovaps   %zmm1, %zmm24                                 #178.31 c1
        movq      %r9, %rax                                     #189.39 c1
        movq      20488(%rsp), %r14                             #189.39[spill] c1
        vmovaps   %zmm1, %zmm23                                 #178.31 c3
        vmovaps   %zmm1, %zmm22                                 #178.31 c3
        movq      %r12, %rdx                                    #183.13 c3
        vmovaps   %zmm1, %zmm21                                 #178.31 c5
        vmovaps   %zmm1, %zmm20                                 #178.31 c5
        vmovaps   %zmm1, %zmm19                                 #178.31 c7
        vmovaps   %zmm1, %zmm18                                 #178.31 c7
        vmovaps   %zmm1, %zmm17                                 #178.31 c9
        vmovaps   %zmm1, %zmm16                                 #178.31 c9
        vmovaps   %zmm1, %zmm15                                 #178.31 c11
        vmovaps   %zmm1, %zmm14                                 #178.31 c11
        vmovaps   %zmm1, %zmm13                                 #178.31 c13
        vmovaps   %zmm1, %zmm12                                 #178.31 c13
        vmovaps   %zmm1, %zmm11                                 #178.31 c15
        vmovaps   %zmm1, %zmm10                                 #178.31 c15
        vmovaps   %zmm1, %zmm9                                  #178.31 c17
        vmovaps   %zmm1, %zmm8                                  #178.31 c17
        vmovaps   %zmm1, %zmm7                                  #178.31 c19
        vmovaps   %zmm1, %zmm6                                  #178.31 c19
        vmovaps   %zmm1, %zmm5                                  #178.31 c21
        vmovaps   %zmm1, %zmm4                                  #178.31 c21
        vmovaps   %zmm1, %zmm3                                  #178.31 c23
        vmovaps   %zmm1, %zmm2                                  #178.31 c23
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r12 r13 r14 r11b zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 zmm8 zmm9 zmm10 zmm11 zmm12 zmm13 zmm14 zmm15 zmm16 zmm17 zmm18 zmm19 zmm20 zmm21 zmm22 zmm23 zmm24 zmm25
..B1.191:                       # Preds ..B1.191 ..B1.190
                                # Execution count [6.96e+06]: Infreq
        vmovups   20544(%rsp,%rdx), %zmm0                       #186.42 c1
        vmovups   20608(%rsp,%rdx), %zmm1                       #186.42 c1
        addq      $1, %r12                                      #181.11 c1
        vmovups   20672(%rsp,%rdx), %zmm26                      #186.42 c7 stall 2
        vmovups   20736(%rsp,%rdx), %zmm27                      #186.42 c7
        addq      $256, %rdx                                    #181.11 c7
        vfmadd231ps (%rax){1to16}, %zmm0, %zmm25                #192.33 c13 stall 2
        vfmadd231ps (%rax){1to16}, %zmm1, %zmm24                #192.33 c13
        vfmadd231ps (%rax){1to16}, %zmm26, %zmm23               #192.33 c19 stall 2
        vfmadd231ps (%rax){1to16}, %zmm27, %zmm22               #192.33 c19
        vfmadd231ps 512(%rax){1to16}, %zmm0, %zmm21             #192.33 c25 stall 2
        vfmadd231ps 512(%rax){1to16}, %zmm1, %zmm20             #192.33 c25
        vfmadd231ps 512(%rax){1to16}, %zmm26, %zmm19            #192.33 c31 stall 2
        vfmadd231ps 512(%rax){1to16}, %zmm27, %zmm18            #192.33 c31
        vfmadd231ps 1024(%rax){1to16}, %zmm0, %zmm17            #192.33 c37 stall 2
        vfmadd231ps 1024(%rax){1to16}, %zmm1, %zmm16            #192.33 c37
        vfmadd231ps 1024(%rax){1to16}, %zmm26, %zmm15           #192.33 c43 stall 2
        vfmadd231ps 1024(%rax){1to16}, %zmm27, %zmm14           #192.33 c43
        vfmadd231ps 1536(%rax){1to16}, %zmm0, %zmm13            #192.33 c49 stall 2
        vfmadd231ps 1536(%rax){1to16}, %zmm1, %zmm12            #192.33 c49
        vfmadd231ps 1536(%rax){1to16}, %zmm26, %zmm11           #192.33 c55 stall 2
        vfmadd231ps 1536(%rax){1to16}, %zmm27, %zmm10           #192.33 c55
        vfmadd231ps 2048(%rax){1to16}, %zmm0, %zmm9             #192.33 c61 stall 2
        vfmadd231ps 2048(%rax){1to16}, %zmm1, %zmm8             #192.33 c61
        vfmadd231ps 2048(%rax){1to16}, %zmm26, %zmm7            #192.33 c67 stall 2
        vfmadd231ps 2048(%rax){1to16}, %zmm27, %zmm6            #192.33 c67
        vfmadd231ps 2560(%rax){1to16}, %zmm0, %zmm5             #192.33 c73 stall 2
        vfmadd231ps 2560(%rax){1to16}, %zmm1, %zmm4             #192.33 c73
        vfmadd231ps 2560(%rax){1to16}, %zmm26, %zmm3            #192.33 c79 stall 2
        vfmadd231ps 2560(%rax){1to16}, %zmm27, %zmm2            #192.33 c79
        addq      $4, %rax                                      #181.11 c79
        cmpq      %r14, %r12                                    #181.11 c79
        jb        ..B1.191      # Prob 99%                      #181.11 c81
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r12 r13 r14 r11b zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 zmm8 zmm9 zmm10 zmm11 zmm12 zmm13 zmm14 zmm15 zmm16 zmm17 zmm18 zmm19 zmm20 zmm21 zmm22 zmm23 zmm24 zmm25
..B1.192:                       # Preds ..B1.191
                                # Execution count [9.44e+02]: Infreq
        lea       (%rcx,%r10), %rax                             #196.28 c1
        vmovups   %zmm4, 20096(%rsp)                            #192.17 c1
        xorl      %edx, %edx                                    #196.37 c1
        vmovups   %zmm5, 20032(%rsp)                            #192.17 c3
        divq      %r8                                           #196.37 c3
        vmovups   %zmm2, 20224(%rsp)                            #192.17 c7 stall 1
        movq      %r8, %r12                                     #197.11 c7
        vmovups   %zmm3, 20160(%rsp)                            #192.17 c9
        movq      %r13, %r14                                    #198.11 c9
        vmovups   %zmm6, 19968(%rsp)                            #192.17 c13 stall 1
        vpxord    %zmm0, %zmm0, %zmm0                           # c13
        vmovups   %zmm7, 19904(%rsp)                            #192.17 c15
        vpxord    %zmm1, %zmm1, %zmm1                           # c15
        vmovups   %zmm8, 19840(%rsp)                            #192.17 c19 stall 1
        movq      20536(%rsp), %rcx                             #199.13[spill] c21
        vmovups   %zmm9, 19776(%rsp)                            #192.17 c25 stall 1
        addq      %rsi, %rax                                    #197.42 c103 stall 38
        vmovups   %zmm10, 19712(%rsp)                           #192.17 c103
        movq      %rdx, %r15                                    #196.37 c103
        vmovups   %zmm11, 19648(%rsp)                           #192.17 c103
        imulq     %rax, %r12                                    #197.11 c105
        vmovups   %zmm12, 19584(%rsp)                           #192.17 c109 stall 1
        movq      %r14, %rdx                                    #199.13 c109
        vmovups   %zmm13, 19520(%rsp)                           #192.17 c109
        vmovups   %zmm14, 19456(%rsp)                           #192.17 c115 stall 2
        vmovups   %zmm15, 19392(%rsp)                           #192.17 c115
        vmovups   %zmm16, 19328(%rsp)                           #192.17 c121 stall 2
        vmovups   %zmm17, 19264(%rsp)                           #192.17 c121
        vmovups   %zmm18, 19200(%rsp)                           #192.17 c127 stall 2
        vmovups   %zmm19, 19136(%rsp)                           #192.17 c127
        vmovups   %zmm20, 19072(%rsp)                           #192.17 c133 stall 2
        vmovups   %zmm21, 19008(%rsp)                           #192.17 c133
        vmovups   %zmm22, 18944(%rsp)                           #192.17 c139 stall 2
        vmovups   %zmm23, 18880(%rsp)                           #192.17 c139
        vmovups   %zmm24, 18816(%rsp)                           #192.17 c145 stall 2
        vmovups   %zmm25, 18752(%rsp)                           #192.17 c145
        movb      %r11b, 20288(%rsp)                            #199.13[spill] c151 stall 2
        movq      53544(%rsp), %r11                             #199.13[spill] c151
                                # LOE rax rdx rcx rbx rdi r8 r9 r10 r11 r12 r13 r14 r15 zmm0 zmm1
..B1.193:                       # Preds ..B1.196 ..B1.195 ..B1.192
                                # Execution count [2.83e+03]: Infreq
        cmpq      %rbx, %rax                                    #199.23 c1
        jae       ..B1.210      # Prob 20%                      #199.23 c3
                                # LOE rax rdx rcx rbx rdi r8 r9 r10 r11 r12 r13 r14 r15 zmm0 zmm1
..B1.194:                       # Preds ..B1.193
                                # Execution count [2.26e+03]: Infreq
        lea       (%r15,%rcx), %rsi                             #205.46 c1
        addq      $1, %r15                                      #207.13 c1
        addq      $1, %r14                                      #198.11 c1
        addq      %r12, %rsi                                    #205.46 c3
        imulq     %r11, %rsi                                    #205.46 c5
        vmovups   (%rdi,%rsi,4), %zmm2                          #205.46 c9 stall 1
        vmovups   64(%rdi,%rsi,4), %zmm4                        #205.46 c9
        vmovups   128(%rdi,%rsi,4), %zmm6                       #205.46 c15 stall 2
        vmovups   192(%rdi,%rsi,4), %zmm8                       #205.46 c15
        vaddps    18752(%rsp,%rdx), %zmm2, %zmm3                #205.17 c21 stall 2
        vmovups   %zmm3, (%rdi,%rsi,4)                          #204.31 c27 stall 2
        vaddps    18816(%rsp,%rdx), %zmm4, %zmm5                #205.17 c27
        vmovups   %zmm5, 64(%rdi,%rsi,4)                        #204.31 c33 stall 2
        vaddps    18880(%rsp,%rdx), %zmm6, %zmm7                #205.17 c33
        vmovups   %zmm7, 128(%rdi,%rsi,4)                       #204.31 c39 stall 2
        vaddps    18944(%rsp,%rdx), %zmm8, %zmm9                #205.17 c39
        vmovups   %zmm9, 192(%rdi,%rsi,4)                       #204.31 c45 stall 2
        addq      $256, %rdx                                    #198.11 c45
        cmpq      %r8, %r15                                     #208.23 c45
        jb        ..B1.196      # Prob 38%                      #208.23 c47
                                # LOE rax rdx rcx rbx rdi r8 r9 r10 r11 r12 r13 r14 r15 zmm0 zmm1
..B1.195:                       # Preds ..B1.194
                                # Execution count [1.40e+03]: Infreq
        addq      %r8, %r12                                     #209.15 c1
        addq      $1, %rax                                      #209.15 c1
        movq      %r13, %r15                                    #210.15 c3
        cmpq      $6, %r14                                      #198.11 c3
        jb        ..B1.193      # Prob 83%                      #198.11 c5
        jmp       ..B1.202      # Prob 100%                     #198.11 c5
                                # LOE rax rdx rcx rbx rdi r8 r9 r10 r11 r12 r13 r14 r15 zmm0 zmm1
..B1.196:                       # Preds ..B1.194
                                # Execution count [8.60e+02]: Infreq
        cmpq      $6, %r14                                      #198.11 c1
        jb        ..B1.193      # Prob 83%                      #198.11 c3
                                # LOE rax rdx rcx rbx rdi r8 r9 r10 r11 r12 r13 r14 r15 zmm0 zmm1
..B1.197:                       # Preds ..B1.196
                                # Execution count [1.43e+02]: Infreq
        movq      %rcx, 20536(%rsp)                             #[spill] c1
        movb      20288(%rsp), %r11b                            #[spill] c1
        movq      20520(%rsp), %rsi                             #[spill] c3
        movq      20528(%rsp), %rcx                             #[spill] c5
                                # LOE rcx rbx rsi rdi r8 r9 r10 r13 r11b zmm0 zmm1
..B1.198:                       # Preds ..B1.197 ..B1.202
                                # Execution count [7.55e+02]: Infreq
        addb      $1, %r11b                                     #174.9 c1
        addq      $6, %r10                                      #174.9 c1
        addq      $3072, %r9                                    #174.9 c3
        cmpb      $6, %r11b                                     #174.9 c3
        jb        ..B1.190      # Prob 83%                      #174.9 c5
                                # LOE rcx rbx rsi rdi r8 r9 r10 r13 r11b zmm0 zmm1
..B1.199:                       # Preds ..B1.202 ..B1.198
                                # Execution count [1.26e+02]: Infreq
        lea       128(%rsp), %rsi                               # c1
        movq      18552(%rsi), %rbx                             #[spill] c3
        movq      18560(%rsi), %r14                             #[spill] c3
        movq      18568(%rsi), %r15                             #[spill] c7 stall 1
        movq      18576(%rsi), %rax                             #[spill] c7
        movq      20408(%rsi), %rcx                             #[spill] c11 stall 1
        movq      20232(%rsi), %rdx                             #[spill] c11
        movq      53296(%rsi), %r12                             #[spill] c15 stall 1
                                # LOE rax rdx rcx rbx rsi rdi r8 r12 r13 r14 r15 zmm0 zmm1
..B1.200:                       # Preds ..B1.210 ..B1.199
                                # Execution count [3.15e+02]: Infreq
        addq      $1, %r14                                      #171.7 c1
        addq      $256, %rdi                                    #171.7 c1
        addq      $256, %rbx                                    #171.7 c3
        cmpq      %r12, %r14                                    #171.7 c3
        jb        ..B1.186      # Prob 82%                      #171.7 c5
                                # LOE rax rdx rcx rbx rsi rdi r8 r12 r13 r14 r15 zmm0 zmm1
..B1.201:                       # Preds ..B1.200
                                # Execution count [5.66e+01]: Infreq
        movq      %r15, 18696(%rsp)                             #[spill] c1
        movq      18672(%rsp), %r11                             #[spill] c1
        movq      %rcx, 20536(%rsp)                             #[spill] c3
        movq      20520(%rsp), %rcx                             #[spill] c5
        movq      %rdx, 20360(%rsp)                             #[spill] c5
        movq      20528(%rsp), %rdx                             #[spill] c7
        movq      %r8, 53488(%rsp)                              #[spill] c9
        movq      20488(%rsp), %r10                             #[spill] c11
        movq      20456(%rsp), %r9                              #[spill] c11
        movq      18664(%rsp), %r8                              #[spill] c15 stall 1
        jmp       ..B1.146      # Prob 100%                     # c15 stall 1
                                # LOE rax rdx rcx r8 r9 r10 r11 r12 r13 zmm1
..B1.202:                       # Preds ..B1.195
                                # Execution count [2.34e+02]: Infreq
        movq      %rcx, 20536(%rsp)                             #[spill] c1
        movb      20288(%rsp), %r11b                            #[spill] c1
        movq      20520(%rsp), %rsi                             #[spill] c3
        movq      20528(%rsp), %rcx                             #[spill] c5
        cmpq      %rbx, %rax                                    #213.21 c5
        jae       ..B1.199      # Prob 20%                      #213.21 c7
        jmp       ..B1.198      # Prob 100%                     #213.21 c7
                                # LOE rcx rbx rsi rdi r8 r9 r10 r13 r11b zmm0 zmm1
..B1.204:                       # Preds ..B1.179
                                # Execution count [4.44e+02]: Infreq
        movl      $1, %edi                                      #12.7 c1
        movq      %rcx, %rax                                    #12.7 c1
        cmpq      $0, 20336(%rsp)                               #12.7[spill] c1
        jbe       ..B1.208      # Prob 10%                      #12.7 c3
                                # LOE rax rdx rcx rbx rsi rdi r14 r15 r12d r13b
..B1.205:                       # Preds ..B1.204
                                # Execution count [4.00e+02]: Infreq
        movq      20320(%rsp), %rdi                             #13.37[spill] c1
        movq      20336(%rsp), %r11                             #13.37[spill] c1
        imulq     %rsi, %rdi                                    #13.37 c5 stall 1
        lea       128(%rsp,%rbx), %r8                           #13.9 c5
        addq      18656(%rsp), %rdi                             #13.37[spill] c9 stall 1
        addq      %rdx, %rdi                                    #13.37 c11
        imulq     20312(%rsp), %rdi                             #13.37[spill] c13
        addq      20304(%rsp), %rdi                             #13.37[spill] c17 stall 1
                                # LOE rax rdx rcx rbx rsi rdi r8 r11 r14 r15 r12d r13b
..B1.206:                       # Preds ..B1.206 ..B1.205
                                # Execution count [9.20e+05]: Infreq
        movl      (%rdi,%rax,8), %r9d                           #13.37 c1
        movl      %r9d, (%r8,%rax,8)                            #13.9 c5 stall 1
        movl      4(%rdi,%rax,8), %r10d                         #13.37 c5
        movl      %r10d, 4(%r8,%rax,8)                          #13.9 c9 stall 1
        addq      $1, %rax                                      #12.7 c9
        cmpq      %r11, %rax                                    #12.7 c11
        jb        ..B1.206      # Prob 99%                      #12.7 c13
                                # LOE rax rdx rcx rbx rsi rdi r8 r11 r14 r15 r12d r13b
..B1.207:                       # Preds ..B1.206
                                # Execution count [3.99e+02]: Infreq
        lea       1(,%rax,2), %rdi                              #13.9 c1
                                # LOE rdx rcx rbx rsi rdi r14 r15 r12d r13b
..B1.208:                       # Preds ..B1.207 ..B1.204
                                # Execution count [4.44e+02]: Infreq
        lea       -1(%rdi), %rax                                #13.9 c1
        cmpq      $24, %rax                                     #12.7 c3
        jae       ..B1.183      # Prob 10%                      #12.7 c5
                                # LOE rax rdx rcx rbx rsi rdi r14 r15 r12d r13b
..B1.209:                       # Preds ..B1.208
                                # Execution count [3.99e+02]: Infreq
        imulq     20320(%rsp), %rsi                             #13.37[spill] c1
        addq      18656(%rsp), %rsi                             #13.37[spill] c5 stall 1
        addq      %rdx, %rsi                                    #13.37 c7
        lea       124(%rsp,%rdi,4), %rdx                        #13.9 c7
        imulq     20312(%rsp), %rsi                             #13.37[spill] c9
        addq      20304(%rsp), %rsi                             #13.37[spill] c13 stall 1
        movl      (%rsi,%rax,4), %eax                           #13.37 c15
        movl      %eax, (%rdx,%rbx)                             #13.9 c19 stall 1
        jmp       ..B1.183      # Prob 100%                     #13.9 c19 stall 1
                                # LOE rcx rbx r14 r15 r12d r13b
..B1.210:                       # Preds ..B1.193
                                # Execution count [5.66e+02]: Infreq
        lea       128(%rsp), %rsi                               # c1
        movq      18552(%rsi), %rbx                             #[spill] c3
        movq      18560(%rsi), %r14                             #[spill] c3
        movq      18568(%rsi), %r15                             #[spill] c7 stall 1
        movq      18576(%rsi), %rax                             #[spill] c7
        movq      20232(%rsi), %rdx                             #[spill] c11 stall 1
        movq      53296(%rsi), %r12                             #[spill] c11
        jmp       ..B1.200      # Prob 100%                     # c11
                                # LOE rax rdx rcx rbx rsi rdi r8 r12 r13 r14 r15 zmm0 zmm1
..B1.211:                       # Preds ..B1.133
                                # Execution count [2.34e+03]: Infreq
        movq      %r10, 53320(%rsp)                             #[spill] c1
        movq      53312(%rsp), %r12                             #[spill] c1
        cmpq      53536(%rsp), %rsi                             #149.21[spill] c3
        jae       ..B1.140      # Prob 20%                      #149.21 c5
        jmp       ..B1.136      # Prob 100%                     #149.21 c5
                                # LOE r12 edi r8d
..B1.214:                       # Preds ..B1.83
                                # Execution count [2.83e+03]: Infreq
        lea       128(%rsp), %rsi                               # c1
        movq      20240(%rsi), %r14                             #[spill] c3
        movq      20248(%rsi), %r15                             #[spill] c3
        movq      20256(%rsi), %rbx                             #[spill] c7 stall 1
        movq      20264(%rsi), %rax                             #[spill] c7
        movq      20232(%rsi), %rdx                             #[spill] c11 stall 1
        movq      53296(%rsi), %r12                             #[spill] c11
        jmp       ..B1.90       # Prob 100%                     # c11
                                # LOE rax rdx rcx rbx rsi rdi r8 r12 r13 r14 r15 zmm0 zmm1
..B1.215:                       # Preds ..B1.69
                                # Execution count [2.22e+03]: Infreq
        movl      $1, %r8d                                      #12.7 c1
        movq      %rcx, %rax                                    #12.7 c1
        cmpq      $0, 20336(%rsp)                               #12.7[spill] c1
        jbe       ..B1.219      # Prob 9%                       #12.7 c3
                                # LOE rax rdx rcx rsi r8 r12 r14 r15 ebx r13b
..B1.216:                       # Preds ..B1.215
                                # Execution count [2.00e+03]: Infreq
        movq      20320(%rsp), %r8                              #13.37[spill] c1
        movq      20336(%rsp), %rdi                             #13.37[spill] c1
        imulq     %rsi, %r8                                     #13.37 c5 stall 1
        lea       128(%rsp,%r14), %r9                           #13.9 c5
        addq      20328(%rsp), %r8                              #13.37[spill] c9 stall 1
        addq      %rdx, %r8                                     #13.37 c11
        imulq     20312(%rsp), %r8                              #13.37[spill] c13
        addq      20304(%rsp), %r8                              #13.37[spill] c17 stall 1
                                # LOE rax rdx rcx rsi rdi r8 r9 r12 r14 r15 ebx r13b
..B1.217:                       # Preds ..B1.217 ..B1.216
                                # Execution count [4.60e+06]: Infreq
        movl      (%r8,%rax,8), %r10d                           #13.37 c1
        movl      %r10d, (%r9,%rax,8)                           #13.9 c5 stall 1
        movl      4(%r8,%rax,8), %r11d                          #13.37 c5
        movl      %r11d, 4(%r9,%rax,8)                          #13.9 c9 stall 1
        addq      $1, %rax                                      #12.7 c9
        cmpq      %rdi, %rax                                    #12.7 c11
        jb        ..B1.217      # Prob 99%                      #12.7 c13
                                # LOE rax rdx rcx rsi rdi r8 r9 r12 r14 r15 ebx r13b
..B1.218:                       # Preds ..B1.217
                                # Execution count [2.00e+03]: Infreq
        lea       1(,%rax,2), %r8                               #13.9 c1
                                # LOE rdx rcx rsi r8 r12 r14 r15 ebx r13b
..B1.219:                       # Preds ..B1.218 ..B1.215
                                # Execution count [2.22e+03]: Infreq
        lea       -1(%r8), %rax                                 #13.9 c1
        cmpq      $24, %rax                                     #12.7 c3
        jae       ..B1.73       # Prob 9%                       #12.7 c5
                                # LOE rax rdx rcx rsi r8 r12 r14 r15 ebx r13b
..B1.220:                       # Preds ..B1.219
                                # Execution count [2.00e+03]: Infreq
        imulq     20320(%rsp), %rsi                             #13.37[spill] c1
        addq      20328(%rsp), %rsi                             #13.37[spill] c5 stall 1
        addq      %rdx, %rsi                                    #13.37 c7
        lea       124(%rsp,%r8,4), %rdx                         #13.9 c7
        imulq     20312(%rsp), %rsi                             #13.37[spill] c9
        addq      20304(%rsp), %rsi                             #13.37[spill] c13 stall 1
        movl      (%rsi,%rax,4), %eax                           #13.37 c15
        movl      %eax, (%rdx,%r14)                             #13.9 c19 stall 1
        jmp       ..B1.73       # Prob 100%                     #13.9 c19 stall 1
                                # LOE rcx r12 r14 r15 ebx r13b
..B1.221:                       # Preds ..B1.47
                                # Execution count [1.17e+04]: Infreq
        movq      %r10, 53528(%rsp)                             #[spill] c1
        movq      53520(%rsp), %r12                             #[spill] c1
        cmpq      53536(%rsp), %rsi                             #149.21[spill] c3
        jae       ..B1.54       # Prob 20%                      #149.21 c5
        jmp       ..B1.50       # Prob 100%                     #149.21 c5
                                # LOE r12 edi r8d
..B1.224:                       # Preds ..B1.9
                                # Execution count [2.52e+00]: Infreq
        addq      $1, %r9                                       #105.49 c1
        addq      $36, %r10                                     #105.49 c1
        cmpq      %r8, %r9                                      #105.38 c3
        jb        ..B1.9        # Prob 82%                      #105.38 c5
                                # LOE rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 zmm1
..B1.225:                       # Preds ..B1.224
                                # Execution count [4.53e-01]: Infreq
        movq      %r12, 18600(%rsp)                             #[spill] c1
        movq      20528(%rsp), %rdx                             #[spill] c1
        movq      %r11, 53488(%rsp)                             #[spill] c3
        movq      72(%rsp), %rbx                                #[spill] c5
        movq      %rcx, 18664(%rsp)                             #[spill] c5
        movq      20520(%rsp), %rcx                             #[spill] c7
        movq      80(%rsp), %rax                                #[spill] c9
        movq      88(%rsp), %r11                                #[spill] c11
        movq      96(%rsp), %r12                                #[spill] c13
        jmp       ..B1.150      # Prob 100%                     # c13
        .align    16,0x90
                                # LOE rax rdx rcx rbx rsi rdi r8 r11 r12 r13 zmm1
	.cfi_endproc
# mark_end;
	.type	_Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm,@function
	.size	_Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm,.-_Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm
	.data
# -- End  _Z28ConvolutionForwardVectorImplPKfS0_Pfmmmmmmmmmmmmm
	.section .text._ZNSt11char_traitsIcE6lengthEPKc, "xaG",@progbits,_ZNSt11char_traitsIcE6lengthEPKc,comdat
..TXTST1:
# -- Begin  _ZNSt11char_traitsIcE6lengthEPKc
	.section .text._ZNSt11char_traitsIcE6lengthEPKc, "xaG",@progbits,_ZNSt11char_traitsIcE6lengthEPKc,comdat
# mark_begin;
# Threads 2
        .align    16,0x90
	.weak _ZNSt11char_traitsIcE6lengthEPKc
# --- std::char_traits<char>::length(const std::char_traits<char>::char_type *)
_ZNSt11char_traitsIcE6lengthEPKc:
# parameter 1: %rdi
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x93,DW.ref.__gxx_personality_v0
..___tag_value__ZNSt11char_traitsIcE6lengthEPKc.134:
..L135:
                                                        #259.7
        pushq     %rsi                                          #259.7 c1
	.cfi_def_cfa_offset 16
        movq      %rdi, %rdx                                    #259.16 c1
        movq      %rdx, %rcx                                    #259.16 c3
        andq      $-16, %rdx                                    #259.16
        vpxor     %xmm0, %xmm0, %xmm0                           #259.16
        vpcmpeqb  (%rdx), %xmm0, %xmm0                          #259.16
        vpmovmskb %xmm0, %eax                                   #259.16
        andl      $15, %ecx                                     #259.16
        shrl      %cl, %eax                                     #259.16
        bsf       %eax, %eax                                    #259.16
        jne       ..L137        # Prob 60%                      #259.16
        movq      %rdx, %rax                                    #259.16
        addq      %rcx, %rdx                                    #259.16
        call      __intel_sse4_strlen@PLT                       #259.16
..L137:                                                         #
                                # LOE rax rbx rbp r12 r13 r14 r15
..B2.4:                         # Preds ..B2.1
                                # Execution count [1.00e+00]
        popq      %rcx                                          #259.16 c1
	.cfi_def_cfa_offset 8
        ret                                                     #259.16 c3
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	_ZNSt11char_traitsIcE6lengthEPKc,@function
	.size	_ZNSt11char_traitsIcE6lengthEPKc,.-_ZNSt11char_traitsIcE6lengthEPKc
	.data
# -- End  _ZNSt11char_traitsIcE6lengthEPKc
	.text
# -- Begin  __sti__$E
	.text
# mark_begin;
# Threads 2
        .align    16,0x90
# --- __sti__$E()
__sti__$E:
..B3.1:                         # Preds ..B3.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x93,DW.ref.__gxx_personality_v0
..___tag_value___sti__$E.140:
..L141:
                                                        #
        pushq     %rsi                                          # c1
	.cfi_def_cfa_offset 16
        lea       _ZSt8__ioinit(%rip), %rdi                     #74.25 c1
..___tag_value___sti__$E.143:
#       std::ios_base::Init::Init(std::ios_base::Init *)
        call      _ZNSt8ios_base4InitC1Ev@PLT                   #74.25
..___tag_value___sti__$E.144:
                                # LOE rbx rbp r12 r13 r14 r15
..B3.2:                         # Preds ..B3.1
                                # Execution count [1.00e+00]
        movq      _ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi  #74.25 c1
        lea       _ZSt8__ioinit(%rip), %rsi                     #74.25 c1
        lea       __dso_handle(%rip), %rdx                      #74.25 c1
        addq      $8, %rsp                                      #74.25 c3
	.cfi_def_cfa_offset 8
#       __cxa_atexit()
        jmp       __cxa_atexit@PLT                              #74.25 c5
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	__sti__$E,@function
	.size	__sti__$E,.-__sti__$E
	.data
# -- End  __sti__$E
	.bss
	.align 4
	.align 1
_ZSt8__ioinit:
	.type	_ZSt8__ioinit,@object
	.size	_ZSt8__ioinit,1
	.space 1	# pad
	.section .rodata, "a"
	.align 8
	.align 8
.L_2il0floatpacket.1:
	.long	0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.1,@object
	.size	.L_2il0floatpacket.1,8
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.0:
	.long	544501582
	.long	1886418291
	.long	1702130287
	.long	743120996
	.long	1701605408
	.long	543519585
	.long	544499059
	.long	1629516905
	.long	543236211
	.long	1953265005
	.long	1701605481
	.long	979791648
	.word	32
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,50
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.1:
	.long	1818370129
	.long	543908719
	.long	1818458467
	.long	540701541
	.byte	0
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,17
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.2:
	.long	1818370123
	.long	543908719
	.long	1818458467
	.long	540701541
	.byte	0
	.type	.L_2__STRING.2,@object
	.size	.L_2__STRING.2,17
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.3:
	.long	1869768058
	.long	1668899616
	.long	980641132
	.word	32
	.type	.L_2__STRING.3,@object
	.size	.L_2__STRING.3,14
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.4:
	.long	541150534
	.long	1818458467
	.long	540701541
	.byte	0
	.type	.L_2__STRING.4,@object
	.size	.L_2__STRING.4,13
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.5:
	.long	1919906931
	.long	2036539493
	.long	1936026723
	.word	8250
	.byte	0
	.type	.L_2__STRING.5,@object
	.size	.L_2__STRING.5,15
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.6:
	.long	1835627632
	.long	1868783461
	.long	3830899
	.type	.L_2__STRING.6,@object
	.size	.L_2__STRING.6,12
	.align 4
.L_2__STRING.7:
	.long	1769237280
	.long	1667196269
	.long	980710255
	.byte	0
	.type	.L_2__STRING.7,@object
	.size	.L_2__STRING.7,13
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.8:
	.long	1769236000
	.long	1667196269
	.long	980710255
	.byte	0
	.type	.L_2__STRING.8,@object
	.size	.L_2__STRING.8,13
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.9:
	.long	1769239328
	.long	1667196269
	.long	980710255
	.byte	0
	.type	.L_2__STRING.9,@object
	.size	.L_2__STRING.9,13
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.10:
	.long	1835627632
	.long	1634869349
	.long	3827060
	.type	.L_2__STRING.10,@object
	.size	.L_2__STRING.10,12
	.align 4
.L_2__STRING.11:
	.long	1835627642
	.long	1634869349
	.long	3827060
	.type	.L_2__STRING.11,@object
	.size	.L_2__STRING.11,12
	.align 4
.L_2__STRING.12:
	.long	1835627622
	.long	1634869349
	.long	3827060
	.type	.L_2__STRING.12,@object
	.size	.L_2__STRING.12,12
	.align 4
.L_2__STRING.13:
	.long	1835627635
	.long	1634869349
	.long	3827060
	.type	.L_2__STRING.13,@object
	.size	.L_2__STRING.13,12
	.section .ctors, "wa"
	.align 8
__init_0:
	.type	__init_0,@object
	.size	__init_0,8
	.quad	__sti__$E
	.data
	.hidden __dso_handle
# mark_proc_addr_taken __sti__$E;
	.section .note.GNU-stack, ""
	.weak DW.ref.__gxx_personality_v0
	.hidden DW.ref.__gxx_personality_v0
	.type	DW.ref.__gxx_personality_v0,@object
	.size	DW.ref.__gxx_personality_v0,8
// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg:
	.align 1
// -- Begin DWARF2 SEGMENT .gnu.linkonce.d.DW.ref.__gxx_personality_v0
	.section .gnu.linkonce.d.DW.ref.__gxx_personality_v0,"a",@progbits
	.weak DW.ref.__gxx_personality_v0
	.align 1
.hidden DW.ref.__gxx_personality_v0
DW.ref.__gxx_personality_v0:
	.8byte __gxx_personality_v0
# End
