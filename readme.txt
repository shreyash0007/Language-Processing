Linux commands:

1)lex parser.l 
2)yacc -d parser.y 
3)gcc y.tab.c -ll -ly 
4)./a.out input.c > 1.txt        (input.c is the test file)
5)sed '/syntax error, unexpected $undefined/d' ./1.txt