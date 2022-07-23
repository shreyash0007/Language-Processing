%{
int yylineno;
%}

alpha [A-Za-z]
digit [0-9]


%%
[ \t] ;
\n	{yylineno++;}
int	{yylval.ival = INT; return INT;}
float	{yylval.ival = FLOAT; return FLOAT;}
char {yylval.ival = CHAR; return CHAR;}
void	{yylval.ival = VOID; return VOID;}
else	{return ELSE;}
do	return DO;
if	return IF;
struct 	return STRUCT;
^"#include ".+	return PREPROC;
while	return WHILE;
for	return FOR;
return 	return RETURN;
printf	return PRINT;

"{"	{scope_start(); return '{';}
"}"	{scope_end(); return '}';}

";"	     {   return(';'); }
","	     {   return(','); }
":"	     {   return(':'); }
"="	     {   return('='); }
"("	     {   return('('); }
")"	     {   return(')'); }
("[") 	     {   return('['); }
("]")        {   return(']'); }
"."	     {   return('.'); }
"&"	     {   return('&'); }
"!"	     {   return('!'); }
"~"	     {   return('~'); }
"-"	     {   return('-'); }
"+"	     {   return('+'); }
"*"	     {   return('*'); }
"/"	     {   return('/'); }
"%"	     {   return('%'); }
"<"	     {   return('<'); }
">"	     {   return('>'); }
"^"	     {   return('^'); }
"|"	     {   return('|'); }
"?"	     {   return('?'); }
"->"	 {   return('->'); }
"++"	 {   return('++'); }
"--"	 {   return('--'); }
"<<"	 {   return('<<'); }
">>"	 {   return('>>'); }
"<="		return LE;
">="		return GE;
"=="		return EQ;
"!="		return NEQ;
"&&"		return AND;
"||"		return OR;

[a-zA-z_][a-zA-z_0-9]* {yylval.str=strdup(yytext); return ID;}
{digit}+	{yylval.str=strdup(yytext);return NUM;}
{digit}+\.{digit}+ 	{yylval.str=strdup(yytext); return REAL;}
\'(\\.|[^'\\])\'     {yylval.str=strdup(yytext); return (CHARACTER_LITERAL);}


\/\/.* ;
\/\*(.*\n)*.*\*\/ ;

\".*\"	return STRING;
.	return yytext[0];
%%
