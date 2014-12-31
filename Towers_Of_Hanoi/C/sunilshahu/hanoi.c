/*
 * Towers of Hanoi problem algorithm implementation
 * See: http://en.wikipedia.org/wiki/Tower_of_Hanoi
 */
#include <stdio.h>

void move(no_of_disc, src_pole, dest_pole, temp_pole)
{
	if(no_of_disc >= 1) {
		move(no_of_disc - 1, src_pole, temp_pole, dest_pole);
		printf("Move %d -> %d\n", src_pole, dest_pole);
		move(no_of_disc - 1, temp_pole, dest_pole, src_pole);
	}
}

int main()
{
	move(3,1,3,2);
	return 0;
}
