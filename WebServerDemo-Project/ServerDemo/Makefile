CFLAGS += -Wall -Werror -pedantic -std=c11

all: bin/test

clean:
	rm bin/*

src/errors.o: src/errors.cc src/errors.h
src/buffer.o: src/buffer.cc src/buffer.h
src/message.o: src/message.cc src/message.h
src/parser.o: src/parser.cc src/parser.h
src/serialiser.o: src/serialiser.cc src/serialiser.h
src/test.o: src/test.cc

bin/test: src/errors.o src/buffer.o src/message.o src/parser.o src/serialiser.o src/test.o
	g++ $(CFLAGS) $(LDFLAGS) -o bin/test src/errors.o src/buffer.o src/message.o src/parser.o src/serialiser.o src/test.o -I /usr/include/mysql -L/usr/lib/mysql -lmysqlclient -lm -lz
	rm src/*.o