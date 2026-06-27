TARGET = KatziJS
GIT_HASH := $(shell git rev-parse --short HEAD)

CXX = g++
CXXFLAGS = -Wall -Wextra -O2 -std=c++17
CXXFLAGS += -DGIT_HASH=\"$(GIT_HASH)\"
CXXFLAGS += -DTARGET=\"$(TARGET)\"

VKATZI_REPO_URL = https://github.com/KatziIndustries/vkatzi.git
VKATZI_DIR = vkatzi
VKATZI_O = build/vkatzi.o

SRCS := $(wildcard src/*.cpp)
OBJS := $(SRCS:.cpp=.o)

.PHONY: all clone build-vkatzi clean run

all: clone build-vkatzi $(TARGET)

clone: 
	rm -rf $(VKATZI_DIR)
	git clone $(VKATZI_REPO_URL)

build-vkatzi:
	cd $(VKATZI_DIR) && chmod +x build.sh && ./build.sh

$(TARGET): $(OBJS)
	$(CXX) $(OBJS) $(VKATZI_DIR)/$(VKATZI_O) -o $(TARGET)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(VKATZI_DIR) *.o $(TARGET)