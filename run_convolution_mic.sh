#!/bin/bash
#export OMP_NUM_THREADS=68
#MNIST
#forward
#./samples/mic/convolution/convolution forward convolution_xsmm_direct 128 1 28 28 5 5 16 24 24 0 0 1 1 2
#./samples/mic/convolution/convolution forward convolution_xsmm_direct 128 16 24 24 5 5 32 20 20 0 0 1 1 2

export KMP_PLACE_THREADS=1T
export KMP_AFFINITY=compact,granularity=fine
export OMP_NUM_THREADS=66
#phase iter H W N C K R S pad str P Q 
###forward:
#numactl -m 1 ./samples/mic/convolution/convolution forward convolution_blas_gemm 2 224 224 128 3   64  11 11 3 4 55 55
#numactl -m 1 ./bin/main forward convolution_blas_gemm 3 27  27  128 128  192 5  5  2 1 27 27
numactl -m 1 ./bin/main forward convolution_blas_gemm 3 31  31  128 128  192 5  5  0 1 27 27
#numactl -m 1 ./main forward convolution_blas_gemm 2 13  13  128 192 384 3  3  1 1 13 13
#numactl -m 1 ./main forward convolution_blas_gemm 2 13  13  128 384 256 3  3  1 1 13 13
#numactl -m 1 ./main forward convolution_blas_gemm 2 13  13  128 256 256 3  3  1 1 13 13
###backward:
#numactl -m 1 ./samples/mic/convolution/convolution backward convolution_blas_gemm 2 224 224 128 3   64  11 11 3 4 55 55
#numactl -m 1 ./samples/mic/convolution/convolution backward convolution_blas_gemm 2 27  27  128 64  192 5  5  2 1 27 27
#numactl -m 1 ./samples/mic/convolution/convolution backward convolution_blas_gemm 2 13  13  128 192 384 3  3  1 1 13 13
#numactl -m 1 ./samples/mic/convolution/convolution backward convolution_blas_gemm 2 13  13  128 384 256 3  3  1 1 13 13
#numactl -m 1 ./samples/mic/convolution/convolution backward convolution_blas_gemm 2 13  13  128 256 256 3  3  1 1 13 13
###update:
#numactl -m 1 ./samples/mic/convolution/convolution update convolution_blas_gemm 2 224 224 128 3   64  11 11 3 4 55 55 
#numactl -m 1 ./samples/mic/convolution/convolution update convolution_blas_gemm 2 27  27  128 64  192 5  5  2 1 27 27 
#numactl -m 1 ./samples/mic/convolution/convolution update convolution_blas_gemm 2 13  13  128 192 384 3  3  1 1 13 13 
#numactl -m 1 ./samples/mic/convolution/convolution update convolution_blas_gemm 2 13  13  128 384 256 3  3  1 1 13 13 
#numactl -m 1 ./samples/mic/convolution/convolution update convolution_blas_gemm 2 13  13  128 256 256 3  3  1 1 13 13 

#Vgg-a
#phase iter H W N C K R S pad str P Q 
###forward:
#numactl -m 1 ./main forward convolution_blas_gemm 2 224 224 128 3   64  3 3 1 1 224 224     
#numactl -m 1 ./main forward convolution_blas_gemm 2 112 112 128 64  128 3 3 1 1 112 112     
#numactl -m 1 ./main forward convolution_blas_gemm 2 56  56  128 128 256 3 3 1 1 56  56       
#numactl -m 1 ./main forward convolution_blas_gemm 2 56  56  128 256 256 3 3 1 1 56  56      
#numactl -m 1 ./main forward convolution_blas_gemm 2 28  28  128 256 512 3 3 1 1 28  28      
#numactl -m 1 ./main forward convolution_blas_gemm 2 28  28  128 512 512 3 3 1 1 28  28      
#numactl -m 1 ./main forward convolution_blas_gemm 2 14  14  128 512 512 3 3 1 1 14  14      
#numactl -m 1 ./main forward convolution_blas_gemm 2 14  14  128 512 512 3 3 1 1 14  14      
###backward
#numactl -m 1 ./samples/mic/convolution/convolution backward convolution_blas_gemm 2 224 224 128 3   64  3 3 1 1 224 224     
#numactl -m 1 ./samples/mic/convolution/convolution backward convolution_blas_gemm 2 112 112 128 64  128 3 3 1 1 112 112     
#numactl -m 1 ./samples/mic/convolution/convolution backward convolution_blas_gemm 2 56  56  128 128 256 3 3 1 1 56  56       
#numactl -m 1 ./samples/mic/convolution/convolution backward convolution_blas_gemm 2 56  56  128 256 256 3 3 1 1 56  56      
#numactl -m 1 ./samples/mic/convolution/convolution backward convolution_blas_gemm 2 28  28  128 256 512 3 3 1 1 28  28      
#numactl -m 1 ./samples/mic/convolution/convolution backward convolution_blas_gemm 2 28  28  128 512 512 3 3 1 1 28  28      
#numactl -m 1 ./samples/mic/convolution/convolution backward convolution_blas_gemm 2 14  14  128 512 512 3 3 1 1 14  14      
#numactl -m 1 ./samples/mic/convolution/convolution backward convolution_blas_gemm 2 14  14  128 512 512 3 3 1 1 14  14      
###update
#numactl -m 1 ./samples/mic/convolution/convolution  update convolution_blas_gemm 2 224 224 128 3   64  3 3 1 1 224 224     
#numactl -m 1 ./samples/mic/convolution/convolution  update convolution_blas_gemm 2 112 112 128 64  128 3 3 1 1 112 112     
#numactl -m 1 ./samples/mic/convolution/convolution  update convolution_blas_gemm 2 56  56  128 128 256 3 3 1 1 56  56       
#numactl -m 1 ./samples/mic/convolution/convolution  update convolution_blas_gemm 2 56  56  128 256 256 3 3 1 1 56  56      
#numactl -m 1 ./samples/mic/convolution/convolution  update convolution_blas_gemm 2 28  28  128 256 512 3 3 1 1 28  28      
#numactl -m 1 ./samples/mic/convolution/convolution  update convolution_blas_gemm 2 28  28  128 512 512 3 3 1 1 28  28      
#numactl -m 1 ./samples/mic/convolution/convolution  update convolution_blas_gemm 2 14  14  128 512 512 3 3 1 1 14  14      
#numactl -m 1 ./samples/mic/convolution/convolution  update convolution_blas_gemm 2 14  14  128 512 512 3 3 1 1 14  14      

##Overfeat
##phase iter H W N C K R S pad str P Q 
###forward:
#numactl -m 1 ./samples/mic/convolution/convolution forward convolution_blas_gemm 2 231 231 128 3    96   11 11 0 4 56 56
#numactl -m 1 ./main forward convolution_blas_gemm 2 28  28  128 96   256  5  5  0 1 24 24
#numactl -m 1 ./main forward convolution_blas_gemm 2 14  14  128 256  512  3  3  0 1 12 12
#numactl -m 1 ./main forward convolution_blas_gemm 2 14  14  128 512  1024 3  3  0 1 12 12
#numactl -m 1 ./main forward convolution_blas_gemm 2 14  14  128 1024 1024 3  3  0 1 12 12
###backward:
#numactl -m 1 ./samples/mic/convolution/convolution backward convolution_blas_gemm 2 231 231 128 3    96   11 11 0 4 56 56
#numactl -m 1 ./samples/mic/convolution/convolution backward convolution_blas_gemm 2 28  28  128 96   256  5  5  0 1 24 24
#numactl -m 1 ./samples/mic/convolution/convolution backward convolution_blas_gemm 2 14  14  128 256  512  3  3  0 1 12 12
#numactl -m 1 ./samples/mic/convolution/convolution backward convolution_blas_gemm 2 14  14  128 512  1024 3  3  0 1 12 12
#numactl -m 1 ./samples/mic/convolution/convolution backward convolution_blas_gemm 2 14  14  128 1024 1024 3  3  0 1 12 12
###update:
#numactl -m 1 ./samples/mic/convolution/convolution update convolution_blas_gemm 2 231 231 128 3    96   11 11 0 4 56 56
#numactl -m 1 ./samples/mic/convolution/convolution update convolution_blas_gemm 2 28  28  128 96   256  5  5  0 1 24 24
#numactl -m 1 ./samples/mic/convolution/convolution update convolution_blas_gemm 2 14  14  128 256  512  3  3  0 1 12 12
#numactl -m 1 ./samples/mic/convolution/convolution update convolution_blas_gemm 2 14  14  128 512  1024 3  3  0 1 12 12
#numactl -m 1 ./samples/mic/convolution/convolution update convolution_blas_gemm 2 14  14  128 1024 1024 3  3  0 1 12 12

