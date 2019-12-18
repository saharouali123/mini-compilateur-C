%{
#include<stdlib.h>
#include <stdio.h>
#include "analyseur_syntaxique.tab.h"
%}
%option yylineno

blanc	[ \t]+	
chiffre	[0-9]	
entier	{chiffre}+ 
lettre	[a-zA-Z]
id	{lettre}({lettre}|{chiffre})*
nombre	{entier}|{chiffre}
commentaire	"/*"({id}|{blanc})*"*/"
chaine \".*\" 

%%
blanc	{}
chiffre	{return (CHIFFRE);}
{chaine} {return CHAINE;}
";"	{return (PV);}
","	{return (VIG);}
"+"	{return (PLUS);} 
"-"	{return (MOINS);} 
"||"	{return (OR);} 
"*"	{return (FOIS);} 
"/"	{return (DIV);} 
"&&"	{return (AND);} 
"&" {return (ADR);}
"<"	{return (INF);} 
">"	{return (SUP);} 
"=="	{return (EGAL);}
"!="	{return (DIFFERENT);} 
"<="	{return (INFEG);} 
">="	{return (SUPEG);} 
"("	{return (PO);} 
")"	{return (PF);} 
"{"	{return (AO);}
"}"	{return (AF);}
"="	{return (AFFECT);}  
"int"	{return (INT);} 
"void"	{return (VOID);}  
"for"	{return (FOR);} 
"scanf"	{return (READ);}
"printf"	{return (WRITE);}
"main"	{return (FMAIN);}
"return" {return (RETURN);}
"boolean"	{return (BOOLEAN);}
{id} 	{return (IDENTIFIANT);}
{nombre}	{yylval= atof(yytext) ;return (NOMBRE);}
{commentaire}	{return (COMMENTAIRE);}
[\n]      {yylineno++;}
%%