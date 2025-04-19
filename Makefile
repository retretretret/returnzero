targets = gcc_dynamic_returnzero gcc_static_returnzero

srcfile = src/c/returnzero.c

exefold = bin/x86/linux/exe
objfold = bin/x86/linux/obj

all : binfolders $(targets)

binfolders :
	if ! [ -d $(exefold) ]; then mkdir -p $(exefold); fi
	if ! [ -d $(objfold) ]; then mkdir -p $(objfold); fi

gcc_dynamic_returnzero : $(srcfile)
	gcc -c -o $(objfold)/$@.o -m32 $(srcfile)
	gcc -o $(exefold)/$@ -m32 $(objfold)/$@.o

gcc_static_returnzero : $(srcfile)
	gcc -c -static -o $(objfold)/$@.o -m32 $(srcfile)
	gcc -static -o $(exefold)/$@ -m32 $(objfold)/$@.o

.PHONY : clean 

clean :
	rm $(objfold)/*
	rm $(exefold)/*
