CFLAGS:=-nostdlib -Wall -ggdb
SRC:=foo.s my_strcat.s my_strcpy.s my_strlen.s my_puts.s my_chomp.s my_malloc.s
OBJ:=$(patsubst %.s, %.o, $(SRC))

.PHONY: all clean

all: foo hello

clean:
	$(RM) $(OBJ) hello.o

%.o: %.s
	$(CC) $(CFLAGS) $^ -c -o $@

foo: $(OBJ)
	$(CC) $(CFLAGS) $^ -o $@

hello: hello.o
	$(CC) $(CFLAGS) $^ -o $@

