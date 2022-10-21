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
%token BEGIN;
%token END;
%token INT_TYPE;
%token FLOAT_TYPE;
%token STRING_TYPE;
%token CHAR_TYPE;
%token BOOL_TYPE;
%token TIMER;
%token SWITCH1;
%token SWITCH2;
%token SWITCH3;
%token SWITCH4;
%token SWITCH5;
%token SWITCH6;
%token SWITCH7;
%token SWITCH8;
%token SWITCH9;
%token SWITCH10;
%token SENSOR;
%token CONNECTION;
%token URL;
%token QUIT;
%token FOR;
%token WHILE;
%token DEFINITION;
%token RETURN;
%token IF;
%token ELSE;
%token GET_DATA;
%token GET_TEMPERATURE;
%token GET_HUMIDITY;
%token GET_AIR_PRESSURE;
%token GET_AIR_QUALITY;
%token GET_LIGHT;
%token GET_SOUND_LEVEL;
%token CHANGE_URL;
%token SEND_DATA;
%token TURN_ON;
%token TURN_OFF;
%token GET_TIMESTAMP;
%token IN;
%token OUT;
%token INTEGER;
%token FLOAT;
%token CHAR;
%token STRING;
%token BOOL;
%token COMMENT;
%token CONSTANT_VARIABLE;
%token VARIABLE;
%token FUNCTION_NAME;
%token INVALID_CHAR;

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