// Patrick Yevsukov 

// 2013 CC BY-NC-SA 4.0

// Excerpt From github.com/PatrickYevsukov/Statistics-Calculator

// I devised this algorithm to identify the statistical mode or 
// modes of a dataset. It requires one pass through the set to 
// identify the set's mode or modes.

// This algorithm works by keeping track of the number of times a
// unique value occurs in the set. If a unique value has occurred
// more times than the ones before it, it is added to the list of
// modes. As the loop continues all values which occur this number
// of times are added to the list of modes, unless another unique
// value occurs more times than the currently identified modes. If
// this happens, the mode array indexing variable is reset to zero
// and the previously identified values are overwritten by the new
// modes. When finished, the mode array indexing variable will be
// one less than the number of modes.

// This algorithm requires a set of values in which all instances
// of a unique value are listed next to one another. 

#include <stdio.h>
#include <stdlib.h>

#define MAX_SAMPLE 25

double *
SampleMode(double *, int *);

double *
SampleMode(double *sample, int *sample_size)
{
    int ii = 0;

    int kk = 0;

    int num_modes = 0;

    int previous_freq = 0;

    int current_freq = 1; // Every value must occur at least once

    double *modes = NULL;
    
    modes = (double *) malloc(MAX_SAMPLE * sizeof *modes);

    for (ii = 0; ii <= *sample_size - 1; ii++)
    {
        if (sample[ii] == sample[ii + 1])
        {
            current_freq++;
        }
        else
        {
            if (current_freq > previous_freq)
            {
                kk = 0; // Reset
                
                previous_freq = current_freq;

                modes[kk] = sample[ii];
            }

            else if (current_freq == previous_freq)
            {
                kk++;

                modes[kk] = sample[ii];
            }

            current_freq = 1; // Reset
        }
    }

    num_modes = kk + 1;

    return modes;
}
