--[[
	Author: Duc Thanh Tran (ducthanhtran, Github)
	Algorithm: Bubblesort, slightly optimized version
	Date: 12/31/2013
--]]

local bubblesort = require "bubblesort"

array = {3, -1, 5, 9, 0, 10, 4, 2}

print("Unsorted list:")
print(table.concat(array, ", "))

bubblesort(array)

print("\nSorted list:")
print(table.concat(array, ", "))

assert(array[1] == -1, "Failed")
assert(array[2] == 0, "Failed")
assert(array[3] == 2, "Failed")
assert(array[4] == 3, "Failed")
assert(array[5] == 4, "Failed")
assert(array[6] == 5, "Failed")
assert(array[7] == 9, "Failed")
assert(array[8] == 10, "Failed")
