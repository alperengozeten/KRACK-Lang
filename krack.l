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
%option yylineno
%%
\n ;
\( return (OPENP);
\) return (CLOSEP);
{open_b} return (OPENB);
{close_b} return (CLOSEB);
\= return (ASSIGNER);
\. return (DOT);
\, return (COMMA);
\; return (SEMICOLON);
\+\+ return (INCREMENT_OP); 
\-\- return (DECREMENT_OP); 
\=\= return (EQUAL_OP);
\! return (NOT_OP);
\!\= return (NOT_EQUAL_OP);
\+ return (ADDITION_OP);
\- return (SUBTRACTION_OP);
\* return (MULTIPLICATION_OP);
\/ return (DIVISION_OP);
\% return (MODULUS_OP);
\&\& return (AND_OP);
\|\| return (OR_OP);
\< return (LT_OP);
\> return (GT_OP);
\<\= return (LT_EQ_OP);
\>\= return (GT_EQ_OP);
begin return (START_PROGRAM);
end return (STOP_PROGRAM);
int return (INT_TYPE);
float return (FLOAT_TYPE);
string return (STRING_TYPE);
char return (CHAR_TYPE);
bool return (BOOL_TYPE);
Timer return (TIMER);
Switch1 return (SWITCH1);
Switch2 return (SWITCH2);
Switch3 return (SWITCH3);
Switch4 return (SWITCH4);
Switch5 return (SWITCH5);
Switch6 return (SWITCH6);
Switch7 return (SWITCH7);
Switch8 return (SWITCH8);
Switch9 return (SWITCH9);
Switch10 return (SWITCH10);
Sensor return (SENSOR);
Connection return (CONNECTION);
URL return (URL);
quit return (QUIT);
for return (FOR);
while return (WHILE);
def return (DEFINITION);
return return (RETURN);
if return (IF);
else return (ELSE);
_get_data return (GET_DATA);
_get_temperature return (GET_TEMPERATURE);
_get_humidity return (GET_HUMIDITY);
_get_air_pressure return (GET_AIR_PRESSURE);
_get_air_quality return (GET_AIR_QUALITY);
_get_light return (GET_LIGHT);
_get_sound_level return (GET_SOUND_LEVEL);
_change_url return (CHANGE_URL);
_send_data return (SEND_DATA);
_turn_on return (TURN_ON);
_turn_off return (TURN_OFF);
_get_timestamp return (GET_TIMESTAMP);
in return (IN);
out return (OUT);
{int} return (INTEGER);
{float} return (FLOAT);
{char} return (CHAR);
{string} return (STRING);
{bool} return (BOOL);
{comment} return (COMMENT);
{constant_variable} return (CONSTANT_VARIABLE);
{variable} return (VARIABLE);
{function_name} return (FUNCTION_NAME);
{empty} ;
. return (INVALID_CHAR);
%%
int yywrap()
{
    return 1;
}