%{
#include <stdio.h>
#include <string.h>
#define YYSTYPE char *
%}
%token COMMAND VALUE OPTION EOL
%%
start: command EOL  { return 0; }
command: COMMAND  axis {printf("Commande : %s\n", $1);} | COMMAND {printf("Commande : %s\n", $1);}
axis: intermediary | axis intermediary ;
intermediary: VALUE  {printf("Valeur : %s\n", $1);} | OPTION {printf("Option : %s\n", $1);}
%%
int main (void) 
{
    system("clear");
    printf("Compilateur de ligne de commande Linux\n==========================\nAli Ben Messaoud\n==========================\n");
    return yyparse();
}
int yyerror (char *msg) 
{
    return fprintf (stderr, "Error: %s\n", msg);
}
