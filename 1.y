%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%
lines:
     | lines expr '\n' { printf("%d\n", $2); }
     | lines '\n'
     ;

expr: NUMBER          { $$ = $1; }
    | expr '+' expr   { $$ = $1 + $3; }
    | expr '-' expr   { $$ = $1 - $3; }
    | expr '*' expr   { $$ = $1 * $3; }
    | expr '/' expr   { if($3==0) { yyerror("Divide by zero"); } else { $$ = $1 / $3; } }
    | '(' expr ')'    { $$ = $2; }
    ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}

int main() {
    yyparse();
    return 0;
}