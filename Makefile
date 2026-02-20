#
CC=gcc
LEX=flex

%.tab.c %.tab.h: %.y
	bison -d $<

%.c: %.l %.tab.h
	$(LEX) -t $< > $@

compiler: parser.tab.o tokenizer.o
	$(CC) $^ $(LDFLAGS) -o $@

%.o: %.c
	$(CC) -c $< -o $@

clean:
	rm -f *.o *.tab.*