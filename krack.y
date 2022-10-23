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
%token NOT_OP;
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
%token START_PROGRAM;
%token STOP_PROGRAM;
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

program: START_PROGRAM stmt_list STOP_PROGRAM

stmt_list: stmt | stmt_list stmt

stmt: assign_stmt SEMICOLON | loop_stmt | declaration_stmt SEMICOLON | update_stmt SEMICOLON | quit_stmt SEMICOLON | comment

// Statements

assign_stmt: VARIABLE ASSIGNER expression

loop_stmt: while_stmt | for_stmt

declaration_stmt: variable_declaration | switch_declaration 

update_stmt: increment_stmt | decrement_stmt

increment_stmt: INCREMENT_OP VARIABLE | VARIABLE INCREMENT_OP

decrement_stmt: DECREMENT_OP VARIABLE | VARIABLE DECREMENT_OP

quit_stmt: QUIT

comment: COMMENT

// IoT Objects, Statements, and Symbols

switch_declaration: switch VARIABLE OPENP CLOSEP

// iot_function: GET_DATA | GET_TEMPERATURE | GET_HUMIDITY | GET_AIR_PRESSURE | GET_AIR_QUALITY | GET_LIGHT 
//              | GET_SOUND_LEVEL | CHANGE_URL | SEND_DATA | TURN_ON | TURN_OFF | GET_TIMESTAMP

switch: SWITCH1 | SWITCH2 | SWITCH3 | SWITCH4 | SWITCH5 | SWITCH6 | SWITCH7 | SWITCH8 | SWITCH9 | SWITCH10

// Types and Literals

type_id: INT_TYPE | FLOAT_TYPE | CHAR_TYPE | STRING_TYPE | BOOL_TYPE

literal: INTEGER | FLOAT | CHAR | STRING | BOOL 

// Variables and Identifiers
variables: VARIABLE | CONSTANT_VARIABLE

variable_declaration: type_id variables ASSIGNER expression

// Expressions

expression: low_precedence_expression

low_precedence_expression: low_precedence_expression low_precedence_operation middle_low_precedence_expression 
                          | middle_low_precedence_expression

middle_low_precedence_expression: middle_low_precedence_expression middle_low_precedence_operation middle_precedence_expression
                          | middle_precedence_expression

middle_precedence_expression: middle_precedence_expression middle_precedence_operation middle_high_precedence_expression
                          | middle_high_precedence_expression

middle_high_precedence_expression: middle_high_precedence_expression middle_high_precedence_operation high_precedence_expression
                          | high_precedence_expression

high_precedence_expression: NOT_OP high_precedence_expression | expression_term

expression_term: OPENP low_precedence_expression CLOSEP | literal | variables | comparison_expression

comparison_expression: variables comparison_op variables | variables comparison_op literal | literal comparison_op literal 
                        |  literal comparison_op variables

comparison_op: LT_OP | GT_OP | LT_EQ_OP | GT_EQ_OP | EQUAL_OP | NOT_EQUAL_OP

low_precedence_operation: OR_OP
middle_low_precedence_operation: AND_OP
middle_precedence_operation: ADDITION_OP | SUBTRACTION_OP
middle_high_precedence_operation: MULTIPLICATION_OP | DIVISION_OP | MODULUS_OP

// Loop Statements

for_stmt: FOR OPENP for_initial SEMICOLON expression SEMICOLON for_update_stmt CLOSEP OPENB stmt_list CLOSEB

for_update_stmt: update_stmt | assign_stmt

for_initial: assign_stmt | variable_declaration | VARIABLE

while_stmt: WHILE OPENP expression CLOSEP OPENB stmt_list CLOSEB


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