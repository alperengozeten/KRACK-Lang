all: lex yacc parser

lex: 
	lex krack.l

yacc: 
	yacc krack.y

parser: 
	gcc -o parser y.tab.c

clean: 
	rm -fr *~ lex yacc parser