#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>
/* Author: Jonathan Lebron 2013
 * Bogo Sort:
 *      1. Check if array is sorted
 *      2. If not sorted, shuffle array
 *      3. Else, return array
 */

// forward declarations
void shuffle(int a[], int size);
bool isSorted(int a[], int size);

void bogoSort(int a[], int size)
{
    while (!isSorted(a, size)) {
        shuffle(a, size);
    }
}

// Knuth shuffle (http://en.wikipedia.org/wiki/Knuth_shuffle)
void shuffle(int a[], int size)
{
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

bool isSorted(int a[], int size)
{
    for (int i = 1; i < size; i++) {
        if (a[i] < a[i-1]) return false;
    }
    
    return true;
}

int main(int argc, char *argv[])
{
    if (argc < 2) {
        printf("ERROR: Must provide at least one argument!\n");
        exit(1);
    }

    int a[argc-1];
    for (int i = 1; i < argc; i++){
        a[i-1] = atoi(argv[i]);
    }

    bogoSort(a, argc-1);

    printf("Done sorting... Result is {");
    for (int i = 0; i < argc-1; i++){
        printf("%d, ", a[i]);
    }
    printf("\b\b}\n");
}

