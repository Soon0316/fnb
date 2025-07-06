%%
"colour" { printf("color"); }
"flavour" { printf("flavor"); }
"clever" { printf("smart"); }
"smart" { printf("elegant"); }
"conversative" { printf("liberal"); }

. { printf("%s", yytext); }
%%
