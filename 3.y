%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);
%}

%token A B

%%
stmt: S '\n' { printf("Valid String\n"); exit(0); }
    ;

S: A S B
 | 
 ;
%%

void yyerror(const char *s) {
    printf("Invalid String\n");
    exit(0);
}

int main() {
    printf("Enter string:\n");
    yyparse();
    return 0;
}