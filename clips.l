%option main
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
bool-literal [(true)|false)]
set-element-literal ({l_curly_b}{int-literal}{r_curly_b})|({l_curly_b}{float-literal}{r_curly_b})|({l_curly_b}{str-literal}{r_curly_b})|({l_curly_b}{char-literal}{r_curly_b})
set-literal ({l-set-op}{set-element-literal}?{r-set-op})|({l-set-op}{set-element-literal}({empty}*\,{empty}*{set-element-literal})+{r-set-op})
identifier [a-z][A-Za-z0-9]*
func-name [A-Z][A-Za-z0-9]*
comment {comment-op}[^\#]*{comment-op}
%%
\n printf(" NEWLINE\n");
\' printf(" CHAR_OP");
\( printf(" LP");
\) printf(" RP");
{l_curly_b} printf(" LCB");
{r_curly_b} printf(" RCB");
\:\= printf(" ASSIGN_OP");
\, printf(" SEPERATOR_OP");
\; printf(" SEMICOLON");
\<\<\= printf(" SUBSET_OP");
\<\< printf(" PROPER_SUBSET_OP");
\>\>\= printf(" SUPERSET_OP");
\| printf(" UNION_OP");
\& printf(" INTERSECTION_OP");
\<\=\> printf(" SET_EQUALITY_OP");
\-\- printf(" SET_RELATIVE_COMP_OP");
\=\= printf(" EQUALITY_OP");
\!\= printf(" INEQUALITY_OP");
\! printf(" NOT_OP");
\+ printf(" ADD_OP");
\- printf(" SUB_OP");
\* printf(" MULT_OP");
\/ printf(" DIV_OP");
\+\= printf(" ADD_SET_ELEMENT_OP");
\-\= printf(" DELETE_SET_ELEMENT_OP");
\< printf(" LT_OP");
\> printf(" GT_OP");
\<\= printf(" LT_EQ_OP");
\>\= printf(" GT_EQ_OP");
\&\& printf(" AND_OP");
\|\| printf(" OR_OP");
set printf(" SET_DECLARE");
int printf(" INT_DECLARE");
string printf(" STRING_DECLARE");
boolean printf(" BOOLEAN_DECLARE");
char printf(" CHAR_DECLARE");
setElement printf(" SET_ELEMENT_DECLARE");
exit printf(" EXIT");
for printf(" FOR");
while printf(" WHILE");
func: printf(" FUNC_DECLARE");
return printf(" RETURN");
if printf(" IF");
else printf(" ELSE");
IsEmpty printf(" PRIM_FUNC_EMPTY");
IsDisjoint printf(" PRIM_FUNC_DISJOINT");
Cardinality printf(" PRIM_FUNC_CARDINALITY");
ContainElement printf(" PRIM_FUNC_CONTAIN");
DeleteSet printf(" PRIM_FUNC_DELETE_SET");
Clout printf(" CLOUT_FUNC");
Clin printf(" CLIN_FUNC");
{int-literal} printf(" INT_LITERAL");
{float-literal} printf(" FLOAT_LITERAL");
{str-literal} printf(" STRING_LITERAL");
{char-literal} printf(" CHAR_LITERAL");
{bool-literal} printf(" BOOLEAN_LITERAL");
{set-literal} printf(" SET_LITERAL");
{set-element-literal} printf(" SET_ELEMENT_LITERAL");
{comment} printf(" COMMENT");
{identifier} printf(" VARIABLE");
~{identifier} printf(" CONST_VARIABLE");
{func-name} printf(" FUNC_NAME");
{empty} ;
