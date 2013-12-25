#include <stdio.h>
// Kendrick Ledet 2013
/* Insertion Sort: Efficient algorithm for sorting a small # of elements

 * Definition:
 * Input: A sequence of n elements {A1, A2, ..., An}
 * Output: Permutation {A'1, A'2, ..., A'n} of Input such that A'1 <= A'2 <= ... <= A'n
 */

void print_sequence(int [], int);

void insertSort(int v[], int n)
{
    for (i = 1; i < n; i++) {
        int key = v[i];
        int marker = i - 1;
        while (marker > -1 && v[marker] > key) {
            v[marker+1] = v[marker];
            marker -= 1;
        }
        v[marker+1] = key;
    }
}

int main(int argc, char *argv[])
{
    int sequence[] = {3, 3242, 21, 55, 653, 19, 139, 459, 138, 45349, 19, 2, 1}; 
    int sequence_length = sizeof(sequence)/sizeof(sequence[0]);

    printf("Sorting %d values in sequence ", sequence_length);
    print_sequence(sequence, sequence_length);

    insertSort(sequence, sequence_length);

    printf("Done sorting into result sequence ");
    print_sequence(sequence, sequence_length);

    return 0;
}

void print_sequence(int seq[], int seq_len)
{ 
    printf("{");
    for (int i = 0; i < seq_len; i++)
        printf("%d, ", seq[i]);
    printf("\b\b}\n");
}

