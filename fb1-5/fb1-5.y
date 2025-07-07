%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
int yyerror(char *s);
%}

%union {
    int num;
}

%token <num> NUMBER
%token ADD SUB MUL DIV ABS EOL
%type <num> exp factor term

%%
calclist:
    | calclist exp EOL { printf("= %d\n", $2); }
;

exp:
    factor              { $$ = $1; }
    | exp ADD factor    { $$ = $1 + $3; }
    | exp SUB factor    { $$ = $1 - $3; }
;

factor:
    term                { $$ = $1; }
    | factor MUL term   { $$ = $1 * $3; }
    | factor DIV term   { $$ = $1 / $3; }
;

term:
    NUMBER              { $$ = $1; }
    | ABS term          { $$ = $2 >= 0 ? $2 : -$2; }
;
%%

int main(int argc, char **argv) {
    return yyparse();
}

int yyerror(char *s) {
    fprintf(stderr, "error: %s\n", s);
    return 0;
}
