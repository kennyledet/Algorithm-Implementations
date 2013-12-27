// Patrick Yevsukov 

// 2013 CC BY-NC-SA 4.0 http://patrick.yevsukov.com 

// github.com/PatrickYevsukov/Statistics-Calculator

#include "stat_mode.h"
#include "stat_mode_test.h"

int
main(int argc, char **argv)
{
    TestSampleMode();

    return EXIT_SUCCESS;
}

void
TestSampleMode()
{
    int ii = 0;

    int jj = 0;

    int eight = EIGHT;

    int eleven = ELEVEN;

    double *result = NULL;

    double size_eight_samples[THREE][EIGHT] = {

        {0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0},
        {0.0, 1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7},
        {1.0, 1.0, 2.0, 2.0, 3.0, 3.0, 4.0, 4.0}
    };

    double size_eleven_samples[ELEVEN][ELEVEN] = {

        {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        {0.0, 0.0, 0.0, 1.0, 2.0, 2.0, 2.0, 3.0, 4.0, 5.0, 6.0},
        {0.0, 1.0, 2.0, 3.0, 4.0, 4.0, 4.0, 5.0, 6.0, 6.0, 6.0},
        {0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 2.0, 3.0, 4.0, 5.0, 6.0},
        {0.0, 1.0, 2.0, 3.0, 4.0, 4.0, 4.0, 5.0, 5.0, 5.0, 5.0},
        {0.0, 1.0, 1.0, 2.0, 2.0, 3.0, 3.0, 4.0, 4.0, 5.0, 5.0},
        {0.0, 0.0, 1.0, 1.0, 2.0, 2.0, 3.0, 3.0, 4.0, 4.0, 5.0},
        {0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 2.0, 2.0, 2.0, 3.0, 4.0},
        {0.0, 0.0, 0.0, 1.0, 1.0, 2.0, 2.0, 2.0, 3.0, 3.0, 4.0},
        {0.0, 1.0, 1.0, 2.0, 2.0, 2.0, 3.0, 3.0, 4.0, 4.0, 4.0},
        {0.0, 0.0, 1.0, 1.0, 2.0, 2.0, 2.0, 3.0, 3.0, 3.0, 6.0}
    };

    double size_eight_modes[THREE][ELEVEN] = {

        // First element of the array is the number of modes

        // The remaining elements are padded out with zeroes

        {8.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 0.0, 0.0},
        {8.0, 0.0, 1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 0.0, 0.0},
        {4.0, 1.0, 2.0, 3.0, 4.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}
    };

    double size_eleven_modes[ELEVEN][ELEVEN] = {

        // First element of the array is the number of modes

        // The remaining elements are padded out with zeroes

        {1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        {2.0, 0.0, 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        {2.0, 4.0, 6.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        {1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        {1.0, 5.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        {5.0, 1.0, 2.0, 3.0, 4.0, 5.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        {5.0, 0.0, 1.0, 2.0, 3.0, 4.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        {3.0, 0.0, 1.0, 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        {2.0, 0.0, 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        {2.0, 2.0, 4.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        {2.0, 2.0, 3.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}
    };

    for(ii = 0; ii < THREE; ii++)
    {
        printf("Sample Set %i: ", ii);
        
        for(jj = 0; jj < EIGHT; jj++)
        {
            printf("%.1f ", size_eight_samples[ii][jj]);
        }

        printf("\n");
        
        result = StatMode(size_eight_samples[ii], &eight);

        printf("Result Set %i: ", ii);

        for(jj = 0; jj < size_eight_modes[ii][0]; jj++)
        {
            printf("%.1f ", result[jj]);

            assert(result[jj] == size_eight_modes[ii][jj + 1]);
        } 

        printf("\n\n");
    }

    printf("\n");
    
    for(ii = 0; ii < ELEVEN; ii++)
    {
        printf("Sample Set %i: ", ii);
        
        for(jj = 0; jj < ELEVEN; jj++)
        {
            printf("%.1f ", size_eleven_samples[ii][jj]);
        }

        printf("\n");
        
        result = StatMode(size_eleven_samples[ii], &eleven);

        printf("Result Set %i: ", ii);

        for(jj = 0; jj < size_eleven_modes[ii][0]; jj++)
        {
            printf("%.1f ", result[jj]);

            assert(result[jj] == size_eleven_modes[ii][jj + 1]);
        } 

        printf("\n\n");
    }
}
