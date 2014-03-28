#include <stdio.h>
#include "hundred_doors.h"
int main() {
	unsigned int doors[4] = {0};
	find_open_doors(doors);
	print_open_doors(doors);
	return 0;
}
