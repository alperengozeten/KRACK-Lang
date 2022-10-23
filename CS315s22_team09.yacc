%{
  #include <stdio.h>
  extern int yylineno;
%}
%token CHAR_OP LP RP LCB RCB ASSIGN_OP SEPERATOR_OP SEMICOLON SUBSET_OP
%token PROPER_SUBSET_OP SUPERSET_OP UNION_OP INTERSECTION_OP SET_EQUALITY_OP
%token SET_RELATIVE_COMP_OP EQUALITY_OP INEQUALITY_OP NOT_OP ADD_OP SUB_OP
%token MULT_OP DIV_OP ADD_SET_ELEMENT_OP DELETE_SET_ELEMENT_OP LT_OP GT_OP
%token LT_EQ_OP GT_EQ_OP AND_OP OR_OP START_PROGRAM STOP_PROGRAM SET_TYPE 
%token INT_TYPE FLOAT_TYPE STRING_TYPE BOOLEAN_TYPE CHAR_TYPE 
%token SET_ELEMENT_TYPE EXIT FOR WHILE FUNC_DECLARE RETURN IF ELSE 
%token PRIM_FUNC_EMPTY PRIM_FUNC_DISJOINT PRIM_FUNC_CARDINALITY 
%token PRIM_FUNC_CONTAIN PRIM_FUNC_DELETE_SET CLOUT_FUNC CLIN_FUNC INT_LITERAL
%token FLOAT_LITERAL STRING_LITERAL CHAR_LITERAL BOOLEAN_LITERAL SET_LITERAL
%token SET_ELEMENT_LITERAL COMMENT VARIABLE CONST_VARIABLE FUNC_NAME

%%
 //Program
program: START_PROGRAM stmt_list STOP_PROGRAM

stmt_list: stmt | stmt_list stmt   

stmt: conditional_stmt | assign_stmt SEMICOLON | set_stmt SEMICOLON | loop_stmt | declare_stmt | return_stmt SEMICOLON
    | exit_stmt SEMICOLON | comment | func_call_stmt SEMICOLON

 //Statements
assign_stmt: VARIABLE ASSIGN_OP expr   //Due to the grammar, expression can also be a single int literal or float literal.  
           | VARIABLE ASSIGN_OP STRING_LITERAL | VARIABLE ASSIGN_OP CHAR_LITERAL
           | VARIABLE ASSIGN_OP SET_ELEMENT_LITERAL

set_stmt: add_set_elmnt | del_set_elmnt

loop_stmt: while | for

conditional_stmt: IF LP expr RP LCB stmt_list RCB 
                | IF LP expr RP LCB stmt_list RCB ELSE LCB stmt_list RCB 

return_stmt: RETURN expr | RETURN STRING_LITERAL | RETURN CHAR_LITERAL  
           | RETURN SET_ELEMENT_LITERAL | RETURN  
          
declare_stmt: variables_declaration SEMICOLON | func_declaration 

exit_stmt: EXIT

comment: COMMENT
 
 //Types and Literals
type_name: SET_TYPE | INT_TYPE | FLOAT_TYPE | STRING_TYPE | BOOLEAN_TYPE | CHAR_TYPE | SET_ELEMENT_TYPE 

 //Variables and Identifiers
variables: VARIABLE | CONST_VARIABLE

variables_declaration: type_name variables ASSIGN_OP expr
                     | type_name variables ASSIGN_OP STRING_LITERAL | type_name variables ASSIGN_OP CHAR_LITERAL
                     | type_name variables ASSIGN_OP SET_ELEMENT_LITERAL
 
 //Expressions

expr: low_pre_expr 

low_pre_expr: low_pre_expr low_pre_op mid_pre_expr
            | mid_pre_expr

low_pre_op: ADD_OP | SUB_OP | OR_OP | UNION_OP | SET_RELATIVE_COMP_OP

mid_pre_expr: mid_pre_expr mid_pre_op high_pre_expr
            | high_pre_expr

mid_pre_op: MULT_OP | DIV_OP | AND_OP | INTERSECTION_OP

high_pre_expr: NOT_OP high_pre_expr
             | expr_term

expr_term: LP low_pre_expr RP | INT_LITERAL | FLOAT_LITERAL | BOOLEAN_LITERAL
         | SET_LITERAL | variables | set_logic_expr | set_logic_func | compare_expr | func_call_stmt 

set_logic_expr: subset | superset | set_equality | proper_subset
set_logic_func: is_empty_func | is_disjoint_func | contain_elmnt_func 

compare_expr: variables compare_op variables
            | variables compare_op INT_LITERAL
            | variables compare_op FLOAT_LITERAL
            | FLOAT_LITERAL compare_op variables
            | FLOAT_LITERAL compare_op FLOAT_LITERAL
            | FLOAT_LITERAL compare_op INT_LITERAL
            | INT_LITERAL compare_op FLOAT_LITERAL
            | INT_LITERAL compare_op variables
            | INT_LITERAL compare_op INT_LITERAL

compare_op: LT_OP | GT_OP | LT_EQ_OP | GT_EQ_OP | EQUALITY_OP | INEQUALITY_OP

//Set Definitions
add_set_elmnt: VARIABLE ADD_SET_ELEMENT_OP SET_ELEMENT_LITERAL
             | VARIABLE ADD_SET_ELEMENT_OP variables

del_set_elmnt: VARIABLE DELETE_SET_ELEMENT_OP SET_ELEMENT_LITERAL
             | VARIABLE DELETE_SET_ELEMENT_OP variables

delete: PRIM_FUNC_DELETE_SET LP variables RP

cardinality_func: PRIM_FUNC_CARDINALITY LP variables RP

contain_elmnt_func: PRIM_FUNC_CONTAIN LP variables SEPERATOR_OP SET_ELEMENT_LITERAL RP
                  | PRIM_FUNC_CONTAIN LP variables SEPERATOR_OP variables RP

is_empty_func: PRIM_FUNC_EMPTY LP variables RP

is_disjoint_func: PRIM_FUNC_DISJOINT LP variables SEPERATOR_OP variables RP

subset: variables SUBSET_OP variables
      | SET_LITERAL SUBSET_OP SET_LITERAL
      | variables SUBSET_OP SET_LITERAL
      | SET_LITERAL SUBSET_OP variables 

proper_subset: variables PROPER_SUBSET_OP variables
             | variables PROPER_SUBSET_OP SET_LITERAL
             | SET_LITERAL PROPER_SUBSET_OP variables
             | SET_LITERAL PROPER_SUBSET_OP SET_LITERAL 
           
superset: variables SUPERSET_OP variables
        | variables SUPERSET_OP SET_LITERAL
        | SET_LITERAL SUPERSET_OP  variables
        | SET_LITERAL SUPERSET_OP SET_LITERAL
 
set_equality: variables SET_EQUALITY_OP variables
            | variables SET_EQUALITY_OP SET_LITERAL
            | SET_LITERAL SET_EQUALITY_OP variables
            | SET_LITERAL SET_EQUALITY_OP SET_LITERAL 
       
 //Functions
func_call_stmt: user_defined_func_call | input | output | delete | cardinality_func  

user_defined_func_call: FUNC_NAME LP RP 
                      | FUNC_NAME LP arg_list RP

input: CLIN_FUNC LP RP | CLIN_FUNC LP STRING_LITERAL RP

output: CLOUT_FUNC LP STRING_LITERAL RP | CLOUT_FUNC LP SET_LITERAL RP | CLOUT_FUNC SET_ELEMENT_LITERAL RP
      | CLOUT_FUNC LP variables RP
      | CLOUT_FUNC LP STRING_LITERAL SEPERATOR_OP STRING_LITERAL RP | CLOUT_FUNC LP SET_LITERAL SEPERATOR_OP STRING_LITERAL RP
      | CLOUT_FUNC LP SET_ELEMENT_LITERAL SEPERATOR_OP STRING_LITERAL RP
      | CLOUT_FUNC LP variables SEPERATOR_OP STRING_LITERAL RP

func_declaration: FUNC_DECLARE FUNC_NAME LP RP LCB stmt_list RCB
                | FUNC_DECLARE FUNC_NAME LP param_list RP LCB stmt_list RCB

param_list: type_name variables | param_list SEPERATOR_OP type_name variables

arg_list: arg_list SEPERATOR_OP variables | variables
//Loops
while: WHILE LP expr RP LCB stmt_list RCB

for: FOR LP for_counter SEMICOLON expr SEMICOLON assign_stmt RP LCB stmt_list RCB

for_counter: VARIABLE | variables_declaration | assign_stmt
 
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
