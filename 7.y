%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);
%}

%token FOR ID NUM RELOP INCDEC

%%
stmt: for_stmt { printf("Valid for loop\n"); exit(0); }
    ;

for_stmt: FOR '(' init ';' cond ';' step ')' '{' body '}'
        ;

init: ID '=' expr
    | ID
    | 
    ;

cond: expr RELOP expr
    | expr
    | 
    ;

step: ID INCDEC
    | INCDEC ID
    | ID '=' expr
    | 
    ;

expr: ID
    | NUM
    ;

body: body ID ';'
    | body ID '=' expr ';'
    | 
    ;
%%

void yyerror(const char *s) {
    printf("Invalid for loop\n");
    exit(0);
}

int main() {
    yyparse();
    return 0;
}