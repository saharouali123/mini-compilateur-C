%{
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>

%}
%token IDENTIFIANT PV COMMENTAIRE VIG AO AF PO PF
%token PLUS MOINS FOIS DIV
%token INF SUP EGAL  DIFFERENT INFEG SUPEG
%token AFFECT AND OR ADR
%token NOMBRE CHIFFRE INT READ WRITE FOR 
%token RETURN  BOOLEAN VOID FMAIN  CHAINE
%left PLUS MOINS
%left  FOIS DIV 

%start programme
%%

programme : HEADER BODY FOOTER  {printf("\nvotre programme est correcte\n");};

HEADER : TYPE FMAIN PO PF AO 
         ;

TYPE : INT
    | VOID 
    |BOOLEAN
    ;

FOOTER : AF
        | RETURN NOMBRE PV  AF
        ;
BODY : COMMENTAIRE declarations instructions
        | declarations instructions ;

declarations: /*vide*/
	| declaration
	;
declaration:TYPE liste_identificateurs PV declaration
	| TYPE liste_identificateurs PV
	;
liste_identificateurs:IDENTIFIANT AFFECT NOMBRE
                    | IDENTIFIANT
                    |liste_identificateurs VIG IDENTIFIANT
                	|liste_identificateurs VIG IDENTIFIANT AFFECT NOMBRE
                	;


instructions:/*vide*/
            | instruction  instruction2
            ;
instruction2: instructions
            ;

instruction : iteration 
			| affection  
			| ecriture
            | lecture
			;

iteration: FOR PO P1 PV P2 PV P3 PF AO BODY AF ;

P1: TYPE IDENTIFIANT AFFECT NOMBRE
    | IDENTIFIANT AFFECT NOMBRE
    |TYPE IDENTIFIANT AFFECT IDENTIFIANT
    | IDENTIFIANT AFFECT IDENTIFIANT
    | /*vide*/
    ;


P2: IDENTIFIANT operateur IDENTIFIANT
    | IDENTIFIANT operateur NOMBRE
    ;
P3: IDENTIFIANT INCREM
    | /*vide*/
    ;

affection : IDENTIFIANT INCREM PV 
            |IDENTIFIANT AFFECT IDENTIFIANT  PV 
            |IDENTIFIANT AFFECT NOMBRE  PV 
            ;

ecriture : WRITE PO CHAINE PF PV
            |  WRITE PO CHAINE VIG IDENTIFIANT PF PV

            ;
lecture : READ PO CHAINE VIG operateur IDENTIFIANT PF PV

operateur:PLUS 
	|MOINS 
	|FOIS
    |DIV
	|INF
	|SUP
	|EGAL
	|DIFFERENT
	|INFEG 
	|SUPEG
	|AFFECT
	|AND
	|OR
    |ADR
	;

INCREM: PLUS PLUS 
	  | MOINS MOINS
	  ;
      


%%
int yyerror (char *s) {printf("%s !! \n",s);}
int yywrap () {return 1;}

void main( int argc, char *argv[] )
{ 
    extern FILE *yyin;
    yyin = fopen( argv[1], "r" );
    yyparse ();

}



