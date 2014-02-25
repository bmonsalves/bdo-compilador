/* A Bison parser, made by GNU Bison 2.5.  */

/* Bison interface for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2011 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     INICIO = 258,
     FIN = 259,
     SUMATORIA = 260,
     ID = 261,
     AP = 262,
     CP = 263,
     IGUAL = 264,
     COMA = 265,
     MAS = 266,
     MENOS = 267,
     POR = 268,
     DIV = 269,
     POTENCIA = 270,
     PCOMA = 271,
     NUM = 272,
     ESP = 273,
     NL = 274
   };
#endif
/* Tokens.  */
#define INICIO 258
#define FIN 259
#define SUMATORIA 260
#define ID 261
#define AP 262
#define CP 263
#define IGUAL 264
#define COMA 265
#define MAS 266
#define MENOS 267
#define POR 268
#define DIV 269
#define POTENCIA 270
#define PCOMA 271
#define NUM 272
#define ESP 273
#define NL 274




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 2068 of yacc.c  */
#line 9 "yacc.y"

    int dval;
    char * s;



/* Line 2068 of yacc.c  */
#line 95 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


