%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);
%}

%token ID NUM
%left '+' '-'
%left '*' '/'

%%
stmt: expr '\n' { printf("Valid Expression\n"); exit(0); }
    ;

expr: expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    | '(' expr ')'
    | ID
    | NUM
    ;
%%

void yyerror(const char *s) {
    printf("Invalid Expression\n");
    exit(0);
}

int main() {
    yyparse();
    return 0;
}