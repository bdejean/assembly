CFLAGS:=-nostdlib -Wall -ggdb
SRC:=foo.s my_strcat.s my_strcpy.s my_strlen.s my_puts.s my_chomp.s
OBJ:=$(patsubst %.s, %.o, $(SRC))

.PHONY: all clean

all: foo

clean:
	$(RM) $(OBJ)

%.o: %.s
	$(CC) $(CFLAGS) $^ -c -o $@

foo: $(OBJ)
	$(CC) $(CFLAGS) $^ -o $@


