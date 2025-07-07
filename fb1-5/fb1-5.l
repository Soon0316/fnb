%{
#include "fb1-5.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+      { yylval.num = atoi(yytext); return NUMBER; }
"+"         { return ADD; }
"-"         { return SUB; }
"*"         { return MUL; }
"/"         { return DIV; }
"|"         { return ABS; }
\n          { return EOL; }
[ \t]       ;   // ignore whitespace
.           { printf("Unknown character: %s\n", yytext); }

%%
