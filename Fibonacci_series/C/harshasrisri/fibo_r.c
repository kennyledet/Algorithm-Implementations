#include<stdio.h>

int fibo_r () {
	static int a = 0, b = 1, count = 0;

	if (0 == count) { count++; return a; }
	if (1 == count) { count++; return b; }
	return (b>a) ? (a += b) : (b += a);
}

int main (int argc, char **argv) {
	int count = 20;
	if (argv[1]) count = atoi(argv[1]);
	while (count--) printf ("%d\n", fibo_r());
}
