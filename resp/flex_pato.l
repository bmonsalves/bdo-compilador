%{
#include <stdio.h>
#include "y.tab.h"
char *test[200][2];
int j = 0;
%}

letra [a-zA-Z]
digito [0-9]

%%

INICIO 				return(BEGINP);
FIN 				return(ENDP);
SUMATORIA			return(SUMA);

{letra}({letra}|{digito})*	{
					yylval.sval = yytext;
					addArray(j,yytext,"ID");
					return(ID);
				}
{digito}+			{
					addArray(j,yytext,"NUM");
					yylval.dval = atof(yytext);
					return(NUM);
				}
"("				{
					addArray(j,yytext,"APAR");
					return(APAR);
				}
")"				{
					addArray(j,yytext,"CPAR");
					return(CPAR);}
"="				{
					addArray(j,yytext,"IGUAL");
					return(IGUAL);
				}
","				{
					addArray(j,yytext,"COMA");
					return(COMA);
				}
"+"				{
					addArray(j,yytext,"MAS");
					return(MAS);
				}
"-"				{
					addArray(j,yytext,"MENOS");
					return(MENOS);
				}
"*"				{
					addArray(j,yytext,"POR");
					return(POR);
				}
"/"				{
					addArray(j,yytext,"DIVIDIDO");
					return(DIVIDIDO);
				}
"^"				{
					addArray(j,yytext,"POTENCIA");
					return(POTENCIA);
				}
";"				{
					addArray(j,yytext,"PCOMA");
					return(PCOMA);
				}
\n				;
.				;
%%

void addArray(int p, char *a,char *b){
	int largo = 10;
	test[p][0] = (char*) calloc(sizeof(char),largo+1);
	test[p][1] = (char*) calloc(sizeof(char),largo+1);
	strcpy(test[p][0],a);
	strcpy(test[p][1],b);
	j++;
}

void showDataArray(){
	int k;
	for(k = 0; k<j;k++){
		printf("VALOR: %s ",test[k][0]);
		printf("TIPO: %s\n",test[k][1]);
	}
}

char * showToValue(int a){
	return test[a][0];	
}

void showDataArrayPure(FILE *fp){
	int t;
	for(t = 7; t<(j-2);t++){
		fprintf(fp,test[t][0]);
	}
}
