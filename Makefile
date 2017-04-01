#project
PROJECT := blitz

#config
CONFIG_FILE := Makefile.config
include $(CONFIG_FILE)

#dirs
BIN_DIR := ./bin
BUILD_DIR := ./build
SRC_DIR := ./src

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
ifeq ($(MODE), DEBUG)
	CXXFLAGS := -Wall -Wno-unused-parameter -g -O0
else 
	CXXFLAGS := -Wall -Wno-unused-parameter $(OPTIMIZE_OPTIONS) $(OPENMP_OPTIONS) -falign-functions=16 -no-prec-div
endif
	

SRC_LIST := $(wildcard $(SRC_DIR)/*.cpp) $(wildcard $(SRC_DIR)/kernels/*.cpp) $(wildcard $(SRC_DIR)/pack/*.cpp)
OBJ_LIST := $(patsubst %.cpp, $(BUILD_DIR)/%.o, $(notdir $(SRC_LIST)))
TARGET := main
BIN_TARGET := $(BIN_DIR)/$(TARGET)

$(BIN_TARGET): $(OBJ_LIST)
	$(BLITZ_CC) -o $@ $(OBJ_LIST) $(CXXFLAGS)
$(BUILD_DIR)/%.o: $(BUILD_DIR)/%.s
	$(BLITZ_CC) -o $@ -c $< $(CXXFLAGS)
.SECONDARY:
$(BUILD_DIR)/%.s: $(SRC_DIR)/%.cpp
	$(BLITZ_CC) -o $@ -S $(CXXFLAGS) $<
$(BUILD_DIR)/%.s: $(SRC_DIR)/kernels/%.cpp
	$(BLITZ_CC) -o $@ -S $(CXXFLAGS) $<
$(BUILD_DIR)/%.s: $(SRC_DIR)/pack/%.cpp
	$(BLITZ_CC) -o $@ -S $(CXXFLAGS) $<

#inc test
test:
	@echo $(SRC_LIST)
	@echo $(OBJ_LIST)
	@echo $(BIN_TARGET)

#clean
clean:
	find $(BUILD_DIR) -name *.o -exec rm -rf {} \;
	find $(BUILD_DIR) -name *.s -exec rm -rf {} \;
	find $(BIN_DIR) -name main -exec rm -rf {} \;
