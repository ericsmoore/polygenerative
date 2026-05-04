CXX = clang++
CXXFLAGS = -std=c++17 -O2 -I/opt/homebrew/include
LIBS = $(shell pkg-config --libs cairo)

SKETCH ?= cpp00

run:
	$(CXX) $(CXXFLAGS) $(SKETCH)/$(SKETCH).cpp -o $(SKETCH)/a.out $(LIBS)
	@cd $(SKETCH) && ./a.out
