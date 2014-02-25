%{
#include <stdio.h>
#include <string.h>

//char * arreglo[100][100];
int regs[26][200];
//char *regs2[200][200];
char *itoa(long n);
void addArray(int p, char *a);
int i = 0;
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
			int p;
			FILE *fp;
			fp = fopen("TEST.c","w");
			fprintf(fp,"#include <stdio.h>\n");
			fprintf(fp,"#include <stdlib.h>\n");
			fprintf(fp,"int main(){\n");
			fprintf(fp,"\tint suma = 0;\n");
			fprintf(fp,"\tint i;\n");
			fprintf(fp,"\tfor(");
			fprintf(fp,"i=");
			//int a = regs[p][0];
			//p++;
			//char *as = itoa(a);
			fprintf(fp,showToValue(3));
			//free(as);

			//fprintf(fp,"1");
			fprintf(fp,";");
			fprintf(fp,"i<=");
			//fprintf(fp,$B);
			//int b = regs[p][0];
			//p++;
			//int *bs = itoa(b);
			fprintf(fp,showToValue(5));
			//free(bs);
			fprintf(fp,";");
			fprintf(fp,"i++");
			fprintf(fp,"){\n");
			fprintf(fp,"\t\tsuma = suma+");
			showDataArrayPure(fp);
//			fprintf(fp,regs2[i-1][0]);
			fprintf(fp,";\n");
			fprintf(fp,"\t}\n");
			fprintf(fp,"}\n");
			printf("LLEGO BIEN EXPRESION COMPLETA\n");
			//printf("el valor de i es: %i",i);
			//printf($E);
			//fclose(fp);
		}
	;

A : ID IGUAL NUM 
    	{	
		printf("LLEGO BIEN A\n");
	}
    ;

B : NUM 
    	{
	printf("LLEGO BIEN B\n");
	}
    ;

E : E MAS T 
    	{
		printf("LLEGO BIEN EXPRESION\n");
	}
    | T 
	{
		printf("LLEGO BIEN T\n");
	}
    ;

T : T POR F 
	{
		printf("LLEGO BIEN T POR F\n");}
    | F
	{
		printf("LLEGO BIEN F\n");
	}
    ;

F : APAR E CPAR 
	{
		printf("LLEGO BIEN PARENTECIS E PARENTECIS\n");
	}
    | ID
	{
		printf("LLEGO BIEN EL ID: %s\n",$ID);
	}
    | NUM
        {
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
/*
v           {
            char * as = (char) calloc(sizeof(char),20);
            strcat(as,$1);
            strcat(as,"+");
            strcat(as,$3);
            $$ =as ;
            } 

            | T                                 
            {
            char * as = (char) calloc(sizeof(char),20);
            strcat(as,$1);
            $$ =as;
            } 
