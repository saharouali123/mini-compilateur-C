prog:	analyseur_syntaxique.tab.c  lex.yy.c
	gcc  analyseur_syntaxique.tab.c  lex.yy.c  -lfl  -o  compilateurC
analyseur_syntaxique.tab.c  :	analyseur_syntaxique.y
		bison -d analyseur_syntaxique.y
lex.yy.c:	analyseur_lexical.flex
		flex analyseur_lexical.flex
