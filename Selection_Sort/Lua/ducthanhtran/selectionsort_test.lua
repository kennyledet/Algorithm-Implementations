--[[
	Author: Duc Thanh Tran (ducthanhtran, Github)
	Algorithm: Selectionsort, basic version where minimum element is searched for,
               not stable version!
	Date: 12/31/2013
--]]

local selectionsort = require "selectionsort"

array = {-5, 3, 2, 0, 10, 6}

print("Unsorted list:")
print(table.concat(array, ", "))

selectionsort(array)

print("\nSorted list:")
print(table.concat(array, ", "))


assert(array[1] == -5, "Failed")
assert(array[2] == 0, "Failed")
assert(array[3] == 2, "Failed")
assert(array[4] == 3, "Failed")
assert(array[5] == 6, "Failed")
assert(array[6] == 10, "Failed")
