#include <stdio.h>
#include <stdlib.h>
/* Author: Jonathan Lebron 2013
 * Selection Sort:
 *      1. For iteration i, set min index to i
 *      2. Iterate through array
 *      3. If current element is less than element at min index, set
 *      min index to curr index.
 *      4. Exchange element at index i and min index
 */

void selectionSort(int a[], int size)
{
    if (size < 2) return;
    int i, j, temp, min_index;
    for (i = 0; i < size; i++){
        min_index = i;
        for (j = i; j < size; j++){
            if (a[j] < a[min_index]) min_index = j;
        }
        if (min_index != i){
            temp = a[i];
            a[i] = a[min_index];
            a[min_index] = temp;
        }
    }
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

    selectionSort(a, argc-1);

    printf("Done sorting... Result is {");
    for (int i = 0; i < argc-1; i++){
        printf("%d, ", a[i]);
    }
    printf("\b\b}\n");
}

