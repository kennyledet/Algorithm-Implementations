'''
Author: Kendrick Ledet 2014

Problem: You have 100 doors in a row that are all initially closed. You make 100 passes by the doors. 
The first time through, you visit every door and toggle the door (if the door is closed, you open it; if it is open, you close it). 
The second time you only visit every 2nd door (door #2, #4, #6, ...). The third time, every 3rd door (door #3, #6, #9, ...), 
etc, until you only visit the 100th door.

Question: What state are the doors in after the last pass? Which are open, which are closed?

Note: The only doors that remain open are whose numbers are perfect squares of integers. Opening only those doors is an optimization that may also be expressed.
See: http://rosettacode.org/wiki/100_doors
'''
import math

def test_doors(doors):
    '''Check that all open door numbers are perfect squares'''
    for i, door in enumerate(doors):
        door_num = i + 1
        if door and math.sqrt(door_num) % 1 > 0:  # if door open and door number is not a perfect square
            return False

    return True


def print_doors(doors):
    for door_num, door in enumerate(doors):
        print "Door #{0}: {1}".format(door_num+1, "Open" if door else "Closed")


def pass_doors(doors):
    for pass_num in xrange(1, 101):  # Make 100 passes
        current_door = pass_num-1  # Start current door offset at the current pass number ('-1' to account for lists/arrays starting count at 0)
        while current_door <= 99:
            doors[current_door] = not doors[current_door]  # Open door if close, close if open (negate old value using 'not')
            current_door += pass_num  # Increment current door number by current pass number
    return doors

pass_doors_optimized = lambda doors: (0 if math.sqrt(door_num+1) % 1 > 0 else 1 for door_num, door in enumerate(doors))


def main():
    # Create list of 100 elements initialized to 0 to represent all doors being closed.
    doors = [0 for x in xrange(0, 100)]

    # Run algorithm
    doors = pass_doors(doors)

    # Print final door states
    print_doors(doors)

    # Test algorithm
    result = test_doors(doors)
    print "Algorithm has {0}".format("passed" if result else "failed")

    # Run optimized algorithm
    doors = pass_doors_optimized(doors)
    print_doors(doors)

    # Test optimized algorithm
    result = test_doors(doors)
    print "Optimized algorithm has {0}".format("passed" if result else "failed")


if __name__ == "__main__":
    main()
