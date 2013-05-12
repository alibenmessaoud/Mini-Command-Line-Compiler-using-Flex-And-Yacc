%{
#define YYSTYPE char*
#include "y.tab.h"
%}
%%
alias|apt-get|cal|cat|chmod|clear|cd|cmp|date|echo|eval|export|grep|gzip|hash|ifconfig|import|install|jobs|kill|locate|ls|man|mkdir|mount|mv|netstat|nice|openssl|lookup|passwd|ping|ps|pwd|reboot|rm|rmdir|sed|slocate|sort|ssh|su|sudo|tail|tar|tree|time|touch|top|tty|useradd|userdel|usermod|vi|wait|wc|who|whoami|wget     { yylval = strdup(yytext); return COMMAND; }

[A-Za-z0-9\./']+    	{ yylval = strdup(yytext); return VALUE; }

-[A-Za-z0-9]+   	{ yylval = strdup(yytext); return OPTION; }

[ \t]   		/* ignore whitespace */ ;

\n 			{ return EOL; }
%%
