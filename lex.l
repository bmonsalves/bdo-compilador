%{
#include <stdio.h>
#include "y.tab.h"
char *tabla[100][2];
int i = 0;
%}

letra       [a-zA-Z]
digito      [0-9]

%%

"INICIO"                        {return(INICIO);}
                                
"FIN"                           {return(FIN);}
                                
"SUMATORIA"                     {return(SUMATORIA);}
                                
{letra}({letra}|{digito})*      {tablaSimbolos(i,yytext,"INICIO"); yylval.s = yytext; return(ID);}
                                
{digito}*                       {tablaSimbolos(i,yytext,"NUM"); yylval.dval=atof(yytext); return(NUM);}
                                 
"("                             {tablaSimbolos(i,yytext,"AP"); return(AP);}
                                
")"                             {tablaSimbolos(i,yytext,"CP"); return(CP);}
                                
"="                             {tablaSimbolos(i,yytext,"IGUAL"); return(IGUAL);}
                                
","                             {tablaSimbolos(i,yytext,"COMA"); return(COMA);}
                                
"+"                             {tablaSimbolos(i,yytext,"MAS"); return(MAS);}
                                 
"-"                             {tablaSimbolos(i,yytext,"MENOS"); return(MENOS);}
                                
"*"                             {tablaSimbolos(i,yytext,"POR"); return(POR);}
                                
"/"                             {tablaSimbolos(i,yytext,"DIV"); return(DIV);}
                                
"^"                             {tablaSimbolos(i,yytext,"POTENCIA"); return(POTENCIA);}
                                
";"                             {tablaSimbolos(i,yytext,"PCOMA"); return(PCOMA);}
                                
" "                             ;
"\n"                            ;
"\t"                            ;

%%

tablaSimbolos(int r, char *a,char *b){
	int largo = 10;
	tabla[r][0] = (char*) calloc(sizeof(char),largo+1);
	tabla[r][1] = (char*) calloc(sizeof(char),largo+1);
	strcpy(tabla[r][0],a);
	strcpy(tabla[r][1],b);
	i++;
}
void verTabla(){
	int k;

	for(k = 0; k<i;k++){
		printf("valor: %s\t| ",tabla[k][0]);
		printf("token: %s\t|\n",tabla[k][1]);
	}
}

char * valor(int valor){
	return tabla[valor][0];	
}

