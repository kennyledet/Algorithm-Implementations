#include <stdio.h>
#include <stdlib.h>
/* Author: Jonathan Lebron 2013
 * Merge Sort: Sorts an array of N elements using a divide and conquer approach.

 * Definition:
 * Input: A sequence of n elements {A1, A2, ..., An}
 * Output: Permutation {A'1, A'2, ..., A'n} of Input such that A'1 <= A'2 <= ... <= A'n
 */

// forward declarations
void merge(int a[], int aux[], int lo, int mid, int hi);
void sort(int a[], int aux[], int lo, int hi);

void mergeSort(int a[], int size)
{
    int aux[size]; // create auxillary array to store copy
    sort(a, aux, 0, size-1);
}

void sort(int a[], int aux[], int lo, int hi)
{
    if (hi  > lo){
        int mid = lo + (hi-lo)/2;

        sort(a, aux, lo, mid);
        sort(a, aux, mid+1, hi);
        merge(a, aux, lo, mid, hi);
    }
}

void merge(int a[], int aux[], int lo, int mid, int hi)
{
    // copy array
    for (int k = lo; k <= hi; k++){
        aux[k] = a[k];
    }

    int i = lo;
    int j = mid+1;
    for (int k = lo; k <= hi; k++) {
        if (i > mid) {
            a[k] = aux[j++];
        } else if (j > hi) {
            a[k] = aux[i++];
        } else if (aux[j] < aux[i]) {
            a[k] = aux[j++];
        } else {
            a[k] = aux[i++];
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

    mergeSort(a, argc-1);

    printf("Done sorting... Result is {");
    for (int i = 0; i < argc-1; i++){
        printf("%d, ", a[i]);
    }
    printf("\b\b}\n");
}