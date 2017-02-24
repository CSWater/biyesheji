#project
PROJECT := blitz

#config
CONFIG_FILE := Makefile.config
include $(CONFIG_FILE)

#dirs
BIN_DIR := bin
BUILD_DIR := build
SRC_ROOT := src
LIB_DIR =:= lib

#compiler optimize options
OPTIMIZE_OPTIONS := -O1

#avx types
ifeq ($(BLITZ_AVX), 512)
	OPTIMIZE_OPTIONS += -DBLITZ_AVX_WIDTH=64 -xMIC-AVX512
else ifeq ($(BLITZ_AVX), 3)
	OPTIMIZE_OPTIONS += -DBLITZ_AVX_WIDTH=64 -xCORE-AVX512
else ifeq ($(BLITZ_AVX), 2)
	OPTIMIZE_OPTIONS += -DBLITZ_AVX_WIDTH=32 -march=core-avx2
else 
	OPTIMIZE_OPTIONS += -DBLITZ_AVX_WIDTH=32 -mavx
endif

#openmp
ifeq ($(BLITZ_CC), icc)
	OPENMP_OPTIONS := -fopenmp
else
	OPENMP_OPTIONS := -fopenmp
endif

#compiler options
CXXFLAGS := -g -Wall -Wno-unused-parameter -Wunknown-pragmas -fPIC $(OPENMP_OPTIONS)

main: main.o cnn.o naive_conv.o
	$(BLITZ_CC) -o main cnn.o naive_conv.o main.o $(CXXFLAGS)
main.o: main.cpp 
	$(BLITZ_CC) -c main.cpp $(CXXFLAGS)
cnn.o: cnn.cpp 
	$(BLITZ_CC) -c cnn.cpp $(CXXFLAGS)
naive_conv.o: naive_conv.cpp
	$(BLITZ_CC) -c naive_conv.cpp $(CXXFLAGS)

#clean
clean:
	rm -f *.o main
