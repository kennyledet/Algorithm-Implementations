#include <stdio.h>
unsigned int ELEMENT_SIZE = 8*sizeof(unsigned int);

void find_open_doors(unsigned int doors[])
{
	unsigned int i, j, element, position;
	for (i = 1; i <= 100; i++) {
		for(j = (i-1); j < 100; j += i) {
			element = (j / ELEMENT_SIZE);
			position = (j % ELEMENT_SIZE);
			doors[element] ^= (1 << position);
		}
	}
}

void print_open_doors(unsigned int doors[])
{
	unsigned int i, element, position;
	printf("Open doors at position :\n");
	for(i = 0; i < 100; i++) {
		element = i / ELEMENT_SIZE;
		position = i % ELEMENT_SIZE;
		if ((doors[element] >> position) & 0x01)
			printf("%d\n", (i+1));
	}
}
