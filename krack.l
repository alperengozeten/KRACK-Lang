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
\n ;
\( return(OPENP);
\) return(CLOSEP);
{open_b} return(OPEN);
{close_b} return(CLOSEB);
\= return(ASSIGNER);
\. return(DOT);
\, return(COMMA);
\; return(SEMICOLON);
\+\+ return(INCREMENT_OP); 
\-\- return(DECREMENT_OP); 
\=\= return(EQUAL_OP);
\!\= return(NOT_EQUAL_OP);
\+ return(ADDITION_OP);
\- return(SUBTRACTION_OP);
\* return(MULTIPLICATION_OP);
\/ return(DIVISION_OP);
\% return(MODULUS_OP);
\&\& return(AND_OP);
\|\| return(OR_OP);
\< return(LT_OP);
\> return(GT_OP);
\<\= return(LT_EQ_OP);
\>\= return(GT_EQ_OP);
begin return(BEGIN);
end return(END);
int return(INT_TYPE);
float return(FLOAT_TYPE);
string return(STRING_TYPE);
char return(CHAR_TYPE);
bool return(BOOL_TYPE);
Timer return(TIMER);
Switch1 return(SWITCH1);
Switch2 return(SWITCH2);
Switch3 return(SWITCH3);
Switch4 return(SWITCH4);
Switch5 return(SWITCH5);
Switch6 return(SWITCH6);
Switch7 return(SWITCH7);
Switch8 return(SWITCH8);
Switch9 return(SWITCH9);
Switch10 return(SWITCH10);
Sensor printf(SENSOR);
Connection printf(CONNECTION);
URL printf(" URL");
quit printf(" QUIT");
for printf(" FOR");
while printf(" WHILE");
def printf(" DEFINITION");
return printf(" RETURN");
if printf(" IF");
else printf(" ELSE");
_get_data printf(" GET_DATA");
_get_temperature printf(" GET_TEMPERATURE");
_get_humidity printf(" GET_HUMIDITY");
_get_air_pressure printf(" GET_AIR_PRESSURE");
_get_air_quality printf(" GET_AIR_QUALITY");
_get_light printf(" GET_LIGHT");
_get_sound_level printf(" GET_SOUND_LEVEL");
_change_url printf(" CHANGE_URL");
_send_data printf(" SEND_DATA");
_turn_on printf(" TURN_ON");
_turn_off printf(" TURN_OFF");
_get_timestamp printf(" GET_TIMESTAMP");
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
. ;
