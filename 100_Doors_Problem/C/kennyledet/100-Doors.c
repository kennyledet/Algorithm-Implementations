/*
Kendrick Ledet 2014

There are 100 doors in a long hallway. They are all closed. The first time you walk by each door, you open it. 
The second time around, you close every second door (since they are all opened). 
On the third pass you stop at every third door and open it if it’s closed, close it if it’s open. 
On the fourth pass, you take action on every fourth door. You repeat this pattern for 100 passes.
*/
#include <math.h>
#include <stdio.h>
#include <stdbool.h>

void pass_doors(int[]);
bool test_doors(int[]);
void print_doors(int[]);

int main(int argc, char const *argv[])
{
    // Allocate array with 100 elements initialized to 0 to represent all doors being closed.
    int doors[100];
    for (int i = 0; i <= 99; ++i)
        doors[i] = 0;

    // Run algorithm
    pass_doors(doors);

    // Print out final door states
    print_doors(doors);

    // Test that all perfect square # doors are open
    printf("Test: %s\n", test_doors(doors) ? "Pass" : "Fail");

    return 0;
}

void pass_doors(int doors[])
{
    // Track the current pass number
    for (int pass_num = 1; pass_num <= 99; ++pass_num) {

        // Offset into hallway, by current pass number
        for (int i = pass_num-1; i <= 99; i += pass_num)
            doors[i] = doors[i] == 1 ? 0 : 1;  // close if open, open if close
    }
}

void print_doors(int doors[])
{
    /* Print out door statuses: "Open" if 1, "Closed" if 0 */
    for (int i = 0; i <= 99; ++i)
        printf("Door #%d: %s\n", i+1, doors[i] == 1 ? "Open" : "Closed");
}

bool test_doors(int doors[])
{
    for (int i = 0; i <= 99; ++i) {
        if ( doors[i] && (int) sqrt(doors[i]) % 1 != 0 )  // if door is open and door # is not a perfect square
            return false;
    }
    return true;
}