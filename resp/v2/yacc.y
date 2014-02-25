%{
#include <stdio.h>
#include <string.h>

char *itoa(long n);
void addArray(int p, char *a);
%}

%union{
	int dval;
	char * sval;
}

%token BEGINP ENDP NUM ID SUMA APAR CPAR IGUAL COMA MAS MENOS POR DIVIDIDO POTENCIA PCOMA
%type <dval> NUM 
%type <sval> ID A B E T F PROGRAMA
%start PROGRAMA

%%

PROGRAMA : BEGINP SUMA APAR A COMA B COMA E CPAR PCOMA ENDP
		{
		    showDataArray();
			int a = atoi(showToValue(3));
			int b = atoi(showToValue(7));
			printf("ASDF: %s",$A);	
			if(a < b){
				printf("PROBLEMAS\n\n");
				return 0;
			}
			//showDataArray();
			int p;
			FILE *fp;
			fp = fopen("TEST.c","w");
			fprintf(fp,"#include <stdio.h>\n");
			fprintf(fp,"#include <stdlib.h>\n");
			fprintf(fp,"int main(){\n");
			fprintf(fp,"\tint suma = 0;\n");
			fprintf(fp,"\tint i;\n");
			fprintf(fp,"\tfor(");
			fprintf(fp,$A);
			//fprintf(fp,"i=");
			//fprintf(fp,showToValue(3));
			fprintf(fp,";");
			fprintf(fp,"i<=");
			fprintf(fp,$B);
			//fprintf(fp,showToValue(5));
			fprintf(fp,";");
			fprintf(fp,"i++");
			fprintf(fp,"){\n");
			fprintf(fp,"\t\tsuma = suma+");
			fprintf(fp,$E);
			//showDataArrayPure(fp);
			fprintf(fp,";\n");
			fprintf(fp,"\t}\n");
			fprintf(fp,"}\n");
			printf("LLEGO BIEN EXPRESION COMPLETA\n");
		}
	;

A : ID IGUAL NUM 
    	{	
		char * a = (char*) calloc(sizeof(char),11);
		strcat(a,"i=");
		strcat(a,itoa($NUM));
		$$ = a;
		printf("LLEGO BIEN A\n");
	}
    ;

B : NUM 
    	{
		char * a = (char*) calloc(sizeof(char),11);
		strcat(a,itoa($NUM));
		$$ = a;
		printf("LLEGO BIEN B\n");
	}
    ;

E : E MAS T 
    	{
		char * a = (char*) calloc(sizeof(char),11);
		strcat(a,$1);
		strcat(a,"+");
		strcat(a,$3);
		$$ = a;
		printf("LLEGO BIEN A LA EXPRESION SUMA\n");
	}
    | E MENOS T
	{
		char * a = (char*) calloc(sizeof(char),11);
		strcat(a,$1);
		strcat(a,"-");
		strcat(a,$3);
		$$ = a;
		printf("LLEGO BIEN A LA EXPRESION RESTA\n");
	}
    | T 
	{
		char * a = (char*) calloc(sizeof(char),11);
		strcat(a,$1);
		$$ = a;
		printf("LLEGO BIEN T\n");
	}
    ;

T : T POR F 
	{
		char * a = (char*) calloc(sizeof(char),11);
		strcat(a,$1);
		strcat(a,"*");
		strcat(a,$3);
		$$ = a;
		printf("LLEGO BIEN T POR F\n");
	}
    | F
	{
		char * a = (char*) calloc(sizeof(char),11);
		strcat(a,$1);
		$$ = a;
		printf("LLEGO BIEN F\n");
	}
    ;

F : APAR E CPAR 
	{
		char * a = (char*) calloc(sizeof(char),11);
		strcat(a,"(");
		strcat(a,$2);
		strcat(a,")");
		$$ = a;
		printf("LLEGO BIEN PARENTECIS E PARENTECIS\n");
	}
    | ID
	{
		char * a = (char*) calloc(sizeof(char),11);
		strcat(a,"i");
		$$ = a;
		printf("LLEGO BIEN EL ID: %s\n",$ID);
	}
    | NUM
        {
		char * a = (char*) calloc(sizeof(char),11);
		strcat(a,itoa($1));
		$$ = a;
		printf("LLEGO BIEN EL NUMERO: %i\n",$NUM);
	}
    ;

%%

main(){
	yyparse();
}
yyerror(char *s) {
	printf("La cadena no corresponde: %s\n",s);
}

yywrap()
{
	return(1);
}

char *itoa(long n)
{
    int len = 10;
    if (n<0) len++; // room for negative sign '-'

    char    *buf = (char*) calloc(sizeof(char), len+1); // +1 for null
    snprintf(buf, len, "%ld", n);
    return   buf;
}
