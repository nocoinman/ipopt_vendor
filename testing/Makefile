.DEFAULT_GOAL := all

CC = g++

SRCS := $(wildcard *.cpp)
BINS := $(SRCS:.cpp=.out)

CPPFLAGS ?= -std=c++14 -O2

LD_LIBS += -lipopt

%.out: %.cpp
	$(CC) $(CPPFLAGS) -o $@ $< $(LD_LIBS)

.PHONY: all test clean
.SILENT: test

all: $(BINS)

test: $(BINS)
	for binary in ${BINS}; do \
  		echo "Executing: $$binary"; \
  		./$$binary; \
  	  done

clean:
	rm -f $(BINS)
