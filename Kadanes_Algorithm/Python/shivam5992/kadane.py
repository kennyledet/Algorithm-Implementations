from random import shuffle

'''
The maximum subarray problem is the task of finding the contiguous subarray within a
1D array of numbers (containing at least one positive number) which has the largest sum.

following implementation is the Dynamic Programming Approach
Time Complexity is O(n)
'''

def kadane(arr):
	size = len(arr)
	curr_max = arr[0]
	max_so_far = arr[0]
	for i in range(1, size):
	    curr_max = max(curr_max+arr[i],arr[i])
	    max_so_far = max(curr_max,max_so_far)
	return max_so_far

if __name__ == '__main__':
	array = list(range(10, -10, -1))
	shuffle(array)
	print "List: " + str(array)
	print "Maximum Sum of SubArrays: "
	response = kadane(array)
	print response
