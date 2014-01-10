#include <stdio.h>

void fibo (int count) {
	int a = 0, b = 1; count -= 2;
	printf ("%d\n", a); printf ("%d\n", b);
	while (count--) printf ("%d\n", (b>a) ? (a += b) : (b += a));
}

int main (int argc, char **argv) { 
	fibo (argv[1] ? atoi(argv[1]) : 10); 
}
