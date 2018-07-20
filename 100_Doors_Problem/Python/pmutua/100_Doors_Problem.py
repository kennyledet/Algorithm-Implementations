
'''
Author: Philip Mutua 2018
Problem: You have 100 doors in a row that are all initially closed. You make 100 passes by the doors.
The first time through, you visit every door and toggle the door (if the door is closed, you open it; if it is open, you close it).
The second time you only visit every 2nd door (door #2, #4, #6, ...). The third time, every 3rd door (door #3, #6, #9, ...),
etc, until you only visit the 100th door.
Question: What state are the doors in after the last pass? Which are open, which are closed?
Note: The only doors that remain open are whose numbers are perfect squares of integers. Opening only those doors is an optimization that may also be expressed.
See: http://rosettacode.org/wiki/100_doors
'''

num_doors = 100
# Creates doors in closed state using number entered by user
def create_doors(num_doors):
    doors = [False] * num_doors
    return doors


def flip(doors,iter):
    for i, elem in enumerate(doors,1):
        if i%iter == 0:
            if doors[i-1] == True:
                doors[i-1] = False
            elif doors[i-1] == False:
                doors[i-1] = True
            print(i, elem)
    return doors


# Create a list of open doors and list of closed doors, display results
def door_lists(doors):
    opened = []
    closed = []
    for i, elem in enumerate(doors):
        if elem == True:
            opened.append(i + 1)
        elif elem == False:
            closed.append(i + 1)
    print('Open Doors:')
    print(opened)
    print('Closed Doors:')
    print(closed)

# Specify total number of doors
num_doors = 100
# Initialize by starting with all closed doors
doors = create_doors(num_doors)
# iterate through 1th - 100th door
doors_list = list(range(1, num_doors + 1))

#For each pass (iterator value) call flip func to flip appropriate doors

for i in doors_list:
    # After loop Flip
    doors = flip(doors,i)

#display final results
door_lists(doors)
