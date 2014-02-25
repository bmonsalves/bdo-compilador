#! /bin/bash
flex flex.l
bison -yd yacc.y 
gcc y.tab.c lex.yy.c -lfl -o salida
./salida < entrada.txt
