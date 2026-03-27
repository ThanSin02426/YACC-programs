%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);
%}

%token DO WHILE ID NUM RELOP

%%
stmt: dowhile_stmt { printf("Valid do-while loop\n"); exit(0); }
    ;

dowhile_stmt: DO '{' body '}' WHILE '(' cond ')' ';'
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
    printf("Invalid do-while loop\n");
    exit(0);
}

int main() {
    yyparse();
    return 0;
}