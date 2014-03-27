CFLAGS=-Wall -o
BUILD=gcc
all: hundred_doors

clean:
	rm -f hundred_doors

hundred_doors : hundred_doors.c hundred_doors.h hundred_doors_test.c 
	$(BUILD) $(CFLAGS) hundred_doors hundred_doors.c hundred_doors_test.c
