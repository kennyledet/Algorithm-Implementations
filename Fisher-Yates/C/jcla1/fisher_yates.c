#include <stdlib.h>
#include <time.h>



/******
    Originally taken from:
    https://github.com/kennyledet/Algorithm-Implementations/blob/master/Bogosort/C/jonathanlebron/bogo_sort.c
*******/
void shuffle(int a[], int size) {
    int r;
    int temp;
    for (int i = 0; i < size; i++) {
        srand(time(NULL));
        r = rand() % (i+1);
        temp = a[i];
        a[i] = a[r];
        a[r] = temp;
    }
}
