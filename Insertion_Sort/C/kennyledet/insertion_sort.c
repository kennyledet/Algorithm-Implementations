#include <stdio.h>
#include <stdbool.h>
// Kendrick Ledet 2013
/* Insertion Sort: Efficient algorithm for sorting a small # of elements

 * Definition:
 * Input: A sequence of n elements {A1, A2, ..., An}
 * Output: Permutation {A'1, A'2, ..., A'n} of Input such that A'1 <= A'2 <= ... <= A'n
 */

void print_sequence(int*, int);
void insertion_sort(int*, int);
bool test_insertion_sort(int*, int);

int main(int argc, char *argv[])
{
    int sequence[] = {3, 3242, 21, 55, 653, 19, 139, 459, 138, 45349, 19, 2, 1}; 
    int sequence_length = sizeof(sequence)/sizeof(sequence[0]);

    printf("Sorting %d values in sequence ", sequence_length);
    print_sequence(sequence, sequence_length);

    insertion_sort(sequence, sequence_length);

    printf("Done sorting. Result ");
    print_sequence(sequence, sequence_length);

    printf("Testing if result sort is valid....");
    int pass = test_insertion_sort(sequence, sequence_length);
    if (pass)
        printf("Yes!\n");
    else
        printf("No!\n");

    return 0;
}

void insertion_sort(int *sequence, int sequence_length)
{
    int marker, key_index, key;

    for (key_index = 1; key_index < sequence_length; key_index++) {  // traverse sequence, start at 2nd index
        key = sequence[key_index];
        marker = key_index - 1;  // set marker at first index left of current key index

        while (marker > -1 && sequence[marker] > key) {
            sequence[marker+1] = sequence[marker];  // if marker val greater than key, shift right
            marker = marker - 1;  // count left while current marker val is greater than key
        }
        sequence[marker+1] = key;  // replace key
    }
}

void print_sequence(int *sequence, int sequence_length)
{ 
    printf("{");
    for (int i = 0; i < sequence_length; i++)
        printf("%d, ", sequence[i]);
    printf("\b\b}\n");
}

bool test_insertion_sort(int *sequence, int sequence_length)
{
    for (int i = 1; i < sequence_length; i++) {
        if (sequence[i] < sequence[i-1])  // each value must be greater than the value before it.
            return false;
    }
    return true;
}
