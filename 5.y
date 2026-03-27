%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);
%}

%token WHILE ID NUM RELOP

%%
stmt: while_stmt { printf("Valid while loop\n"); exit(0); }
    ;

while_stmt: WHILE '(' cond ')' '{' body '}'
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
    printf("Invalid while loop\n");
    exit(0);
}

int main() {
    yyparse();
    return 0;
}