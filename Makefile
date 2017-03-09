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
OPTIMIZE_OPTIONS := -O2

#avx types
ifeq ($(BLITZ_AVX), 512)
	OPTIMIZE_OPTIONS +=  -xMIC-AVX512
else ifeq ($(BLITZ_AVX), 3)
	OPTIMIZE_OPTIONS += -xCORE-AVX512
else ifeq ($(BLITZ_AVX), 2)
	OPTIMIZE_OPTIONS += -march=core-avx2
else 
	OPTIMIZE_OPTIONS += -mavx
endif

#openmp
ifeq ($(BLITZ_CC), icc)
	OPENMP_OPTIONS := -fopenmp
else
	OPENMP_OPTIONS := -fopenmp
endif

#compiler options
CXXFLAGS := -Wall -Wno-unused-parameter -Wunknown-pragmas -fPIC $(OPTIMIZE_OPTIONS) $(OPENMP_OPTIONS) $(MODE)

main: main.o cnn.o naive_conv.o blitz_forward.o
	$(BLITZ_CC) -o main cnn.o naive_conv.o blitz_forward.o main.o $(CXXFLAGS)
main.o: main.cpp 
	$(BLITZ_CC) -c main.cpp $(CXXFLAGS)
cnn.o: cnn.cpp 
	$(BLITZ_CC) -c cnn.cpp $(CXXFLAGS)
naive_conv.o: naive_conv.cpp
	$(BLITZ_CC) -c naive_conv.cpp $(CXXFLAGS)
blitz_forward.o: blitz_forward.s
	$(BLITZ_CC) -c blitz_forward.s $(CXXFLAGS)
blitz_forward.s: blitz_forward.cpp
	$(BLITZ_CC) -S blitz_forward.cpp $(CXXFLAGS) 

#clean
clean:
	rm -f *.o main *.s
