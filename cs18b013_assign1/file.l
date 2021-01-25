%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include "symtab.c"


FILE *yyin;
FILE *yyout;

int lineno=1;
void returnprint(char *toktype);


%}

digit [0-9]
letter [a-zA-Z]
print [ -~]
delim [ \t\n]
ws {delim}+
identifier {letter}({digit}|{letter}|_)*
integer {digit}*
double ([+-]?{digit}+)?\.{digit}*(e?[+-]?{digit}+)?
string \'{print}*\"
%%

"/*" {}
"//".* {}
{ws} {}
"if"  {returnprint("KW_IF");}
"else" {returnprint("KW_ELSE");}
"do"  {returnprint ("KW_DO");}
"while" {returnprint ("KW_WHILE");}
"break" {returnprint ("KW_BREAK");}
"int"  {returnprint ("KW_INT");}
"float" {returnprint ("KW_FLOAT");}
"char" {returnprint ("KW_CHAR");}
"double" {returnprint ("KW_DOUBLE");}
"boolean" {returnprint ("KW_BOOLEAN");}
"({letter}|{digit}|" ")*" {returnprint ("KW_STRING");}

"public" {returnprint ("KW_PUBLIC");}
"private" {returnprint ("KW_PRIVATE");}
"protected" {returnprint ("KW_PROTECTED");}
"static" {returnprint ("KW_STATIC");}
"void" {returnprint ("KW_VOID");}
"class" {returnprint ("KW_CLASS");}
"System" {returnprint ("KW_SYSTEM");}
"in" {returnprint ("KW_IN");}
"out" {returnprint("KW_OUT");}
"println" {returnprint("KW_PRINTLN");}
"import" {returnprint("PP_IMPORT");}
"util" {returnprint("PP_UTIL");}
"java" {returnprint("PP_JAVA");}
"Scanner" {returnprint("PP_SCANNER");}

"=" {returnprint ("ASSIGN");}
"==" {returnprint ("EQUAL");}
"!=" {returnprint ("NEQUAL");}
">" {returnprint ("GT");}
"<" {returnprint ("LT");}
">=" {returnprint ("GE");}
"<=" {returnprint ("LE");}
"&&" {returnprint ("AND");}
"||" {returnprint ("OR");}

"+" {returnprint ("PLUS");}
"-" {returnprint ("MINUS");}
"*" {returnprint ("TIMES");}
"/" {returnprint ("TIMES");}
"%" {returnprint ("MOD");}

"(" {returnprint ("LPAREN");}
")" {returnprint ("RPAREN");}
"{" {returnprint ("LBRACE");}
"}" {returnprint ("RBRACE");}
"[" {returnprint ("LBRACKET");}
"]" {returnprint ("RBRACKET");}
"," {returnprint ("COMMA");}
";" {returnprint ("SEMICOLON");}
"." {returnprint ("FULLSTOP");}


{identifier} {returnprint ("IDENTIFIER");}
{integer} {returnprint ("INTEGER");}
{double} {returnprint ("DOUBLE");}
{string} {returnprint ("STRING");}
%%

void returnprint(char *toktype)
{
	printf("yytext: %s\ttoken; %s\n",yytext,toktype);
}

int main(int argc,char *argv[])
{
init hash_table;

yyin= fopen("prog1.java","r");
yylex();
fclose(yyin);

yyout=fopen("symtab_dump.out","w");
symtab_dump(yyout);
fclose(yyout);

}
