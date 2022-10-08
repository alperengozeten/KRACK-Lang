%option main
digit [0-9]
letter [A-Za-z]
alphanumeric {digit}|{letter}
d_quote \"
s_quote \'
dot \.
sign [+-]
empty [ \t]*
open_b \{{empty}
close_b {empty}\}
int {sign}?{digit}+
float {sign}?{digit}*{dot}{digit}+
constant_variable [A-Z]+
variable {letter}{alphanumeric}*
%%
\n printf(" NEWLINE\n");
\( printf(" OPENP");
\) printf(" CLOSEP");
\+\+ printf(" INCREMENT_OP"); 
\-\- printf(" DECREMENT_OP"); 
\; printf(" SEMICOLON");
\=\= printf(" EQUAL_OP");
\!\= printf(" NOT_EQUAL_OP");
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
{constant_variable} printf(" CONSTANT_VARIABLE");
{variable} printf(" VARIABLE");
{int} printf(" INTEGER");
{float} printf(" FLOAT");
{empty} ;
