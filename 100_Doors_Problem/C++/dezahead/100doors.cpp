/*There are 100 doors in a long hallway. They are all closed. The first time you walk by each door, you open it. 
The second time around, you close every second door (since they are all opened). 
On the third pass you stop at every third door and open it if it’s closed, close it if it’s open.
On the fourth pass, you take action on every fourth door. You repeat this pattern for 100 passes.

At the end of 100 passes, what doors are opened and what doors are closed?*/

#include <iostream>

using namespace std;

void print(bool doors[])
{
	cout << "Open Doors:" << endl;
	 for (int num = 0; num < 100; num++)
		{
			if (doors[num] == true)
				cout << "Door #" << num+1 << endl;
		}

	cout << "Closed Doors:" << endl;
	 for (int num = 0; num < 100; num++)
		{
			if (doors[num] == false)
				cout << "Door #" << num+1 << endl;
		}
}

int main()
{
	//false is closed, true is open
	bool Doors[100] = {false};

	for (int pass = 1; pass < 101; pass++)
	{
		for (int num = pass - 1; num < 100; num += pass)
			{
				if(Doors[num] == true)
					Doors[num] = false;
				else
					Doors[num] = true;
			}	
	}

	print(Doors);

	return 0;
}