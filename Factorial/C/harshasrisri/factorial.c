#include <stdio.h>

unsigned long long factorial (int number) {
	if (0 == number) return 1;
	else return number * factorial (number-1);
}

int main (int argc, char **argv) {
	int input = argv[1] ? atoi (argv[1]) : 10;
	return printf ("%d! = %llu\n", input, factorial (input));
}
