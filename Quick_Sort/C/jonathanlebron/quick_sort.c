#include <stdio.h>
#include <stdlib.h>
#include <time.h>
/* Author: Jonathan Lebron 2013
 * Quick Sort (in-place):
 *      1. Shuffle the array
 *      2. Partition
 *      3. Sort each piece recursively
 */

// forward declarations
void shuffle(int a[], int size);
void sort(int a[], int lo, int hi);
int partition(int a[], int lo, int hi);

void quickSort(int a[], int size)
{
    shuffle(a, size); // probabilistic guarantee against worst case
    sort(a, 0, size-1);
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

void sort(int a[], int lo, int hi)
{
    if (hi <= lo) return;
    int j = partition(a, lo, hi);
    sort(a, lo, j-1);
    sort(a, j+1, hi);
}

int partition(int a[], int lo, int hi)
{
    int i = lo, j = hi+1, temp;
    while(1){
        // find item on left to swap
        while (a[++i] < a[lo]){
            if (i == hi) break;
        };

        // find item on right to swap
        while (a[lo] < a[--j]){
            if (j == lo) break;
        }

        // if pointers have crossed, we are done partitioning
        if (i >= j) break;

        temp = a[i];
        a[i] = a[j];
        a[j] = temp;
    }

    // swap pivot element with j, return index j
    temp = a[lo];
    a[lo] = a[j];
    a[j] = temp;
    return j;
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

    quickSort(a, argc-1);

    printf("Done sorting... Result is {");
    for (int i = 0; i < argc-1; i++){
        printf("%d, ", a[i]);
    }
    printf("\b\b}\n");
}

