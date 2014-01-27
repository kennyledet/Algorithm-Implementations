-- Tests for binary_search.lua
local binary_search = require 'binary_search'

local total, pass = 0, 0

local function dec(str, len)
	return #str < len
	   and str .. (('.'):rep(len-#str))
		  or str:sub(1,len)
end


local function run(message, f)
	total = total + 1
	local ok, err = pcall(f)
	if ok then pass = pass + 1 end
	local status = ok and 'PASSED' or 'FAILED'
	print(('%02d. %68s: %s'):format(total, dec(message,68), status))
end

run('Performs a binary search', function()
	local t = {1, 2, 3, 4, 5}
	assert(binary_search(t, 1) == 1)
	assert(binary_search(t, 2) == 2)
	assert(binary_search(t, 3) == 3)
	assert(binary_search(t, 4) == 4)
	assert(binary_search(t, 5) == 5)
end)

run('Array values do not have to be consecutive',function()
	local t = {1, 3, 5, 10, 13}
	assert(binary_search(t, 1) == 1)
	assert(binary_search(t, 3) == 2)
	assert(binary_search(t, 5) == 3)
	assert(binary_search(t, 10) == 4)
	assert(binary_search(t, 13) == 5)
end)

run('But the array needs to be sorted',function()
	local t = {1, 15, 12, 14, 13}
	assert(binary_search(t, 13) == nil)
	assert(binary_search(t, 15) == nil)
end)

run('In case the value exists more than once, it returns any of them',function()
	local t = {1, 12, 12, 13, 15, 15, 16}
	assert(binary_search(t, 15) == 6)
	assert(binary_search(t, 12) == 2)
end)

run('Accepts comparison functions for reversed arrays',function()
	local t = {50, 33, 18, 12, 5, 1, 0}
	local comp = function(a, b) return a > b end
	assert(binary_search(t, 50, comp) == 1)
	assert(binary_search(t, 33, comp) == 2)
	assert(binary_search(t, 18, comp) == 3)
	assert(binary_search(t, 12, comp) == 4)
	assert(binary_search(t,  5, comp) == 5)
	assert(binary_search(t,  1, comp) == 6)
	assert(binary_search(t,  0, comp) == 7)
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
	:format(total, pass, total-pass, (pass*100/total)))
