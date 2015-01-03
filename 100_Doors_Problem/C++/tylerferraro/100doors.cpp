#include <iostream>
#include <bitset>

#define MAX_DOORS 100

using std::cout;
using std::endl;
using std::bitset;

void print(bitset<MAX_DOORS> &doors)
{
    for (int i = 0; i < MAX_DOORS; i++)
    {
        if (doors[i] == 1)
            cout << "Door #" << i + 1 << ": " << "Open" << endl;
    }

    for (int i = 0; i < MAX_DOORS; i++)
    {
        if (doors[i] == 0)
            cout << "Door #" << i + 1 << ": " << "Closed" << endl;
    }
}

void walk_hallway(bitset<MAX_DOORS> &doors, int passes)
{
    for (int pass = 1; pass < passes + 1; pass++)
    {
        for (int i = pass - 1; i < MAX_DOORS; i += pass)
        {
            doors.flip(i);
        }
    }
}

int main()
{
    bitset<MAX_DOORS> doors;
    walk_hallway(doors, 100);
    print(doors);

    return 0;
}
