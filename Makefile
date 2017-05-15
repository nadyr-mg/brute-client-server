CFLAGS=-O2 -Wall
LDLIBS += -lcrypt -Wl,--no-as-needed -lpthread

all: brute

brute: brute_force.o check_pass.o main.o parse.o run_mode.o thread_queue.o state.o
		$(CC) $^ -o $@ $(LDLIBS)

brute_force.o: brute_force.h brute_force.c

check_pass.o: check_pass.h check_pass.c

parse.o: parse.h parse.c

run_mode.o: run_mode.h run_mode.c

thread_queue.o: thread_queue.h thread_queue.c

iter_state.o: state.h state.c

clean:
	rm -rf *.o brute
