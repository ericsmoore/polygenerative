CXX = clang++
CXXFLAGS = -std=c++17 -O2 -I/opt/homebrew/include
LIBS = $(shell pkg-config --libs cairo)

SKETCH ?= cpp00

SRC = $(SKETCH)/main.cpp
OUT_DIR = $(SKETCH)/out
OUT = $(OUT_DIR)/a.out

build:
	mkdir -p $(OUT_DIR)
	$(CXX) $(CXXFLAGS) $(SRC) -o $(OUT) $(LIBS)

run: build
	cd $(OUT_DIR) && ./a.out

clean:
	rm -rf cpp*/build
