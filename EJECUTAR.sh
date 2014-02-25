#! /bin/bash
flex lex.l
yacc -yd yacc.y 
gcc y.tab.c lex.yy.c -lfl -o salida
./salida < entrada

