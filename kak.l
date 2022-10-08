%option main
digit [0-9]
letter [A-Za-z]
alphanumeric {digit}|{letter}
d_quote \"
s_quote \'
dot \.
underscore \_
comment_symbol \#
sign [+-]
empty [ \t]*
open_b \{{empty}
close_b {empty}\}
int {sign}?{digit}+
float {sign}?{digit}*{dot}{digit}+
char {s_quote}[^\']{s_quote}
string {d_quote}[^\"]*{d_quote}
bool true|false
comment {comment_symbol}[^\#]*{comment_symbol}
constant_variable [A-Z]+
variable {letter}{alphanumeric}*
function_name {underscore}{letter}{alphanumeric}*
%%
\n printf(" NEWLINE\n");
\( printf(" OPENP");
\) printf(" CLOSEP");
{open_b} printf(" OPENB");
{close_b} printf(" CLOSEB");
\= printf(" ASSIGNER");
\, printf(" COMMA");
\; printf(" SEMICOLON");
\+\+ printf(" INCREMENT_OP"); 
\-\- printf(" DECREMENT_OP"); 
\=\= printf(" EQUAL_OP");
\!\= printf(" NOT_EQUAL_OP");
\+ printf(" ADDITION_OP");
\- printf(" SUBTRACTION_OP");
\* printf(" MULTIPLICATION_OP");
\/ printf(" DIVISION_OP");
\% printf(" MODULUS_OP");
\&\& printf(" AND_OP");
\|\| printf(" OR_OP");
\< printf(" LT_OP");
\> printf(" GT_OP");
\<\= printf(" LT_EQ_OP");
\>\= printf(" GT_EQ_OP");
begin printf(" BEGIN");
end printf(" END");
int printf(" INT_TYPE");
float printf(" FLOAT_TYPE");
string printf(" STRING_TYPE");
char printf(" CHAR_TYPE");
bool printf(" BOOL_TYPE");
quit printf(" QUIT");
for printf(" FOR");
while printf(" WHILE");
def printf(" DEFINITION");
return printf(" RETURN");
if printf(" IF");
else printf(" ELSE");
in printf(" IN");
out printf(" OUT");
{int} printf(" INTEGER");
{float} printf(" FLOAT");
{char} printf(" CHAR");
{string} printf(" STRING");
{bool} printf(" BOOL");
{comment} printf(" COMMENT");
{constant_variable} printf(" CONSTANT_VARIABLE");
{variable} printf(" VARIABLE");
{function_name} printf(" FUNCTION_NAME");
{empty} ;
