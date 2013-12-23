#include <stdio.h>
// Kendrick Ledet 2013
/* Insertion Sort: Efficient algorithm for sorting a small # of elements

 * Definition:
 * Input: A sequence of n elements {A1, A2, ..., An}
 * Output: Permutation {A'1, A'2, ..., A'n} of Input such that A'1 <= A'2 <= ... <= A'n
 */

void print_sequence(int [], int);

int main(int argc, char *argv[])
{
    int sequence[] = {3, 3242, 21, 55, 653, 19, 139, 459, 138, 45349, 19, 2, 1}; 
    int sequence_length = sizeof(sequence)/sizeof(sequence[0]);

    printf("Sorting %d values in sequence ", sequence_length);
    print_sequence(sequence, sequence_length);

    /* Insertion Sort */
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

