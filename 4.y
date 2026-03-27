%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);
%}

%token IF ELSE ID NUM RELOP

%%
stmt: if_stmt { printf("Valid if-else structure\n"); exit(0); }
    ;

if_stmt: IF '(' cond ')' '{' body '}'
       | IF '(' cond ')' '{' body '}' ELSE '{' body '}'
       ;

cond: expr RELOP expr
    | expr
    ;

expr: ID
    | NUM
    ;

body: body ID ';'
    | 
    ;
%%

void yyerror(const char *s) {
    printf("Invalid if-else structure\n");
    exit(0);
}

int main() {
    yyparse();
    return 0;
}