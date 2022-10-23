digit [0-9]+
sign [+-]
dot \.
string-op \"
comment-op \#
char-op \'
empty [\t ]*
l_curly_b \{{empty}
r_curly_b {empty}\}
l-set-op \[{empty}
r-set-op {empty}\]
int-literal {sign}?{digit}
float-literal {int-literal}{dot}{int-literal}
str-literal {string-op}[^\n\"]*{string-op}
char-literal {char-op}[^\'\n]{char-op}
bool-literal true|false
set-element-literal ({l_curly_b}{int-literal}{r_curly_b})|({l_curly_b}{float-literal}{r_curly_b})|({l_curly_b}{str-literal}{r_curly_b})|({l_curly_b}{char-literal}{r_curly_b})
set-literal ({l-set-op}{set-element-literal}?{r-set-op})|({l-set-op}{set-element-literal}({empty}*\,{empty}*{set-element-literal})+{r-set-op})
identifier [a-z][A-Za-z0-9]*
func-name [A-Z][A-Za-z0-9]*
comment {comment-op}[^\#]*{comment-op}
%option yylineno
%%
\n  		        ;
\' 			{return CHAR_OP;}
\( 			{return LP;}
\) 			{return RP;}
{l_curly_b}             {return LCB;}
{r_curly_b}             {return RCB;}
\:\= 		        {return ASSIGN_OP;}
\, 			{return SEPERATOR_OP;}
\; 			{return SEMICOLON;}
\<\<\= 		        {return SUBSET_OP;}
\<\< 		        {return PROPER_SUBSET_OP;}
\>\>\= 		        {return SUPERSET_OP;}
\| 			{return UNION_OP;}
\& 			{return INTERSECTION_OP;}
\<\=\> 		        {return SET_EQUALITY_OP;}
\-\- 		        {return SET_RELATIVE_COMP_OP;}
\=\= 		        {return EQUALITY_OP;}
\!\= 		        {return INEQUALITY_OP;}
\! 			{ return NOT_OP;}
\+ 			{ return ADD_OP;}
\- 			{ return SUB_OP;}
\* 			{ return MULT_OP;}
\/ 			{ return DIV_OP;}
\+\= 		{ return ADD_SET_ELEMENT_OP;}
\-\= 		{ return DELETE_SET_ELEMENT_OP;}
\< 			{ return LT_OP;}
\> 			{ return GT_OP;}
\<\= 		{ return LT_EQ_OP;}
\>\= 		{ return GT_EQ_OP;}
\&\& 		{ return AND_OP;}
\|\| 		{ return OR_OP;}
start_program 	{ return START_PROGRAM;}
stop_program 	{ return STOP_PROGRAM;}
set 		{ return SET_TYPE;}
int 		{ return INT_TYPE;}
float           { return FLOAT_TYPE;}
string 		{ return STRING_TYPE;}
boolean 	{ return BOOLEAN_TYPE;}
char 		{ return CHAR_TYPE;}
setElement  { return SET_ELEMENT_TYPE;}
exit 		{ return EXIT;}
for 		{ return FOR;}
while 		{ return WHILE;}
func: 		{ return FUNC_DECLARE;}
return 		{ return RETURN;}
if 			{ return IF;}
else 		{ return ELSE;}
IsEmpty 	{ return PRIM_FUNC_EMPTY;}
IsDisjoint  { return PRIM_FUNC_DISJOINT;}
Cardinality { return PRIM_FUNC_CARDINALITY;}
ContainElement	{ return PRIM_FUNC_CONTAIN;}
DeleteSet 	{ return PRIM_FUNC_DELETE_SET;}
Clout 		{ return CLOUT_FUNC;}
Clin 		{ return CLIN_FUNC;}
{int-literal} 	{ return INT_LITERAL;}
{float-literal} { return FLOAT_LITERAL;}
{str-literal} 	{ return STRING_LITERAL;}
{char-literal} 	{ return CHAR_LITERAL;}
{bool-literal} 	{ return BOOLEAN_LITERAL;}
{set-literal} 	{ return SET_LITERAL;}
{set-element-literal}	{ return SET_ELEMENT_LITERAL;}
{comment} 		{ return COMMENT;}
{identifier} 	{ return VARIABLE;}
~{identifier} 	{ return CONST_VARIABLE;}
{func-name} 	{ return FUNC_NAME;}
{empty} ;
%%
int yywrap()
{
    return 1;
}
