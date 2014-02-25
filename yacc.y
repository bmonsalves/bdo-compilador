%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char *aChar(long n);
%}

%union{
    int dval;
    char * s;
}

%token  INICIO FIN SUMATORIA ID AP CP IGUAL COMA MAS MENOS POR DIV POTENCIA PCOMA NUM ESP NL
%type <dval> NUM 
%type <s> ID PROG INICIAL FINAL OPERACION T F
%start PROG
%%
      
PROG        : INICIO SUMATORIA AP INICIAL COMA FINAL COMA OPERACION CP PCOMA FIN 
            {
                verTabla();
			    FILE *fp;
			    fp = fopen("SUMATORIA.c","w");
			    fprintf(fp,"#include <stdio.h>\n");
			    fprintf(fp,"#include <stdlib.h>\n");
			    fprintf(fp,"#include <math.h>\n");
			    
			    fprintf(fp,"int main(){\n");
			        //declara variables
			        
			        //total sumatoria
			        fprintf(fp,"float sumatoria = 0;\n");
			        fprintf(fp,"float j = 0;\n");
			        
			        //valor inicial del for
			        fprintf(fp,"float i = "); fprintf(fp,"%s",$INICIAL); fprintf(fp,";\n");
			        
			        //valor final del for
			        fprintf(fp,"float n = "); fprintf(fp,"%s",$FINAL); fprintf(fp,";\n");
			        
			            //for para la sumatoria
			            fprintf(fp,"for(j=i;j<=n;j++)"); fprintf(fp,"{\n");
			            
			                //expresion matematica
			                fprintf(fp,"sumatoria = "); fprintf(fp," sumatoria + ("); fprintf(fp,"%s",$OPERACION); fprintf(fp,");\n");
			            
			            fprintf(fp,"}\n");
			        
			        //imprime   
			        fprintf(fp,"printf(\"El resultado de la operacion es: %%9.2f \\n\",sumatoria);");
			     
			    fprintf(fp,"\n}");
			}
            ;
      
INICIAL     : ID IGUAL NUM 
                {	
		        char * inicial = (char*) calloc(sizeof(char),11);
		        
		        strcat(inicial,aChar($NUM));
		        $$ = inicial;
	            }
            ;

FINAL       :  ID IGUAL NUM 
                {
               
                /*
                int inicio = valor(3);
			    int fin = valor(7);
			    printf("f->id %i\n",inicio);
			    printf("f->id %i\n",fin);
	            if( inicio < fin){
	                yyerror("el numero inicial no puede ser menor al final");
                    exit(1);	
                }
                */
		        char * final = (char*) calloc(sizeof(char),11);
		        strcat(final,aChar($NUM));
		        $$ = final;
	            }
            ;

OPERACION   : OPERACION MAS T
                {
		        char * operacion = (char*) calloc(sizeof(char),11);
		        strcat(operacion,$1);
		        strcat(operacion,"+");
		        strcat(operacion,$3);
		        $$ = operacion;
	            }
	        | OPERACION MENOS T
	            {
		        char * operacion = (char*) calloc(sizeof(char),11);
		        strcat(operacion,$1);
		        strcat(operacion,"-");
		        strcat(operacion,$3);
		        $$ = operacion;
	            }
	            
            | T
                {
		        char * operacion = (char*) calloc(sizeof(char),11);
		        strcat(operacion,$1);
		        $$ = operacion;
	            }
            
            ;
            
T           : T POR F
                {
		        char * t = (char*) calloc(sizeof(char),11);
		        strcat(t,$1);
		        strcat(t,"*");
		        strcat(t,$3);
		        $$ = t;
	            }
	        | T DIV F
	            {
	            /*
	            float num = atoi($3);
	            
	            if(num == 0){
	                yyerror("division por cero");
                    exit(1);	/* detener ejecucion 
                }*/
		        char * t = (char*) calloc(sizeof(char),11);
		        strcat(t,$1);
		        strcat(t,"/");
		        strcat(t,$3);	        
		        $$ = t;
	            }
	            
	        | T POTENCIA F
	            {
		        char * t = (char*) calloc(sizeof(char),11);
		        strcat(t,"pow(");
		        strcat(t,$1);
		        strcat(t,",");
		        strcat(t,$3);
		        strcat(t,")");
		        $$ = t;
		        //printf("potencia %s\n",t);
	            }
	            
            | F 
                {
	    	    char * t = (char*) calloc(sizeof(char),11);
	        	strcat(t,$1);
	        	$$ = t;
	            }
            ;
            
F           : AP OPERACION CP 
                {
		        char * f = (char*) calloc(sizeof(char),11);
		        strcat(f,"(");
		        strcat(f,$2);
		        strcat(f,")");
		        $$ = f;
	            }
	            
            | ID  
                {
                /*
                char * asd = (char*) calloc(sizeof(char),11);
                //char * asd = valor(1);
                strcpy(asd,valor(1)); 
		        //char * a = (char*) calloc(sizeof(char),11);
		        //strcat(a,$1);
		        */
		        char * f = "j";
		        $$ = f;
		        //printf("f->id %s\n",asd);
	            }
	            
            | NUM    
                {
		        char * f = (char*) calloc(sizeof(char),11);
		        strcat(f,aChar($1));
		        $$ = f;
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

char *aChar(long n)
{
    int len = 10;
    if (n<0) len++; // room for negative sign '-'

    char    *buf = (char*) calloc(sizeof(char), len+1); // +1 for null
    snprintf(buf, len, "%ld", n);
    return   buf;
}
