%{
  #include <stdio.h>
  extern int yylineno;
%}
%token OPENP;
%token CLOSEP;
%token OPENB;
%token CLOSEB;
%token ASSIGNER;
%token DOT;
%token COMMA;
%token SEMICOLON;
%token INCREMENT_OP; 
%token DECREMENT_OP; 
%token EQUAL_OP;
%token NOT_EQUAL_OP;
%token ADDITION_OP;
%token SUBTRACTION_OP;
%token MULTIPLICATION_OP;
%token DIVISION_OP;
%token MODULUS_OP;
%token AND_OP;
%token OR_OP;
%token LT_OP;
%token GT_OP;
%token LT_EQ_OP;
%token GT_EQ_OP;

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