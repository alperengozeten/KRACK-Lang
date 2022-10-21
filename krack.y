%{
  #include <stdio.h>
  extern int yylineno;
%}
%token

%%

%%
#include "lex.yy.c"

int lineno = 1;
int yyerror(char* s)
{
  printf( "error in line %d: %s\n", yylineno, s );
}

int main (void)
{
  yyparse();
  if( yynerrs < 1 )
    {
      printf("This is a valid input for CLIPS\n");
    }
  return 0;
}