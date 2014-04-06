'''
'''
import math

def test_doors(doors):
	for i, door in enumerate(doors):
		door_num = i + 1
		if door and math.sqrt(door_num) % 1 > 0:
			return False

	return True


def print_doors(doors):
	for door_num, door in enumerate(doors):
		print "Door #{0}: {1}".format(door_num+1, "Open" if door else "Closed")


def pass_doors(doors):
	for pass_num in xrange(1, 101):
		current_door = pass_num-1
		while current_door <= 99:
			doors[current_door] = 0 if doors[current_door] else 1
			current_door += pass_num
	return doors


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


if __name__ == "__main__":
	main()
