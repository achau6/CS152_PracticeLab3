CC = g++
CFLAGS = -g -O0 -std=c++11

SRC  = lib.cpp                        # list of C++ source files
OBJS = $(patsubst %.cpp, %.o, $(SRC)) # list of object files

all: practice
bison.tab.c bison.tab.h:	bison.y
	bison -t -v -d bison.y
lex.yy.c: lexer.lex bison.tab.h
	flex lexer.lex 
practice: lex.yy.c bison.tab.c bison.tab.h
	g++ -o practice bison.tab.c lex.yy.c -lfl
clean:
	rm practice bison.tab.c lex.yy.c bison.tab.h bison.output
