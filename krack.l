%option main
digit [0-9]
letter [A-Za-z]
underscore \_
capital_letter [A-Z]
constant_letter {capital_letter}|{underscore}
alphanumeric {digit}|{letter}|{underscore}
d_quote \"
s_quote \'
dot \.
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
constant_variable {capital_letter}{constant_letter}*
variable {letter}{alphanumeric}*
function_name {underscore}{letter}{alphanumeric}*
%%
\n printf(" NEWLINE\n");
\( printf(" OPENP");
\) printf(" CLOSEP");
{open_b} printf(" OPENB");
{close_b} printf(" CLOSEB");
\= printf(" ASSIGNER");
\. printf(" DOT");
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
Timer printf(" TIMER");
Switch1 printf(" SWITCH1");
Switch2 printf(" SWITCH2");
Switch3 printf(" SWITCH3");
Switch4 printf(" SWITCH4");
Switch5 printf(" SWITCH5");
Switch6 printf(" SWITCH6");
Switch7 printf(" SWITCH7");
Switch8 printf(" SWITCH8");
Switch9 printf(" SWITCH9");
Switch10 printf(" SWITCH10");
Sensor printf(" SENSOR");
Connection printf(" CONNECTION");
URL return(URL);
quit return(QUIT);
for return(FOR);
while return(WHILE);
def return(DEFINITION);
return return(RETURN);
if return(IF);
else return(ELSE);
_get_data return(GET_DATA);
_get_temperature return(GET_TEMPERATURE);
_get_humidity return(GET_HUMIDITY);
_get_air_pressure return(GET_AIR_PRESSURE);
_get_air_quality return(GET_AIR_QUALITY);
_get_light return(GET_LIGHT);
_get_sound_level return(GET_SOUND_LEVEL);
_change_url return(CHANGE_URL);
_send_data return(SEND_DATA);
_turn_on return(TURN_ON);
_turn_off return(TURN_OFF);
_get_timestamp return(GET_TIMESTAMP);
in return(IN);
out return(OUT);
{int} return(INTEGER);
{float} return(FLOAT);
{char} return(CHAR);
{string} return(STRING);
{bool} return(BOOL);
{comment} return(COMMENT);
{constant_variable} return(CONSTANT_VARIABLE);
{variable} return(VARIABLE);
{function_name} return(FUNCTION_NAME);
{empty} ;
. return (INVALID_CHAR);
%%
int yywrap()
{
    return 1;
}
