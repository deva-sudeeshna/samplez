all: hello

hello:
	lex file.l
	gcc lex.yy.c -ll -o mylexer
	
clean:
	rm -rf *o hello
