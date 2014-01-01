-- Tests for insertion_sort.lua
local insertion_sort = require 'insertion_sort'

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

-- Comparison functions
local function le(a,b) return a <= b end
local function ge(a,b) return a >= b end

-- Checks if list is sorted
function is_sorted(list, comp)
	comp = comp or le
	for i = 2, #list do
		if not comp(list[i-1],list[i]) then return false end
	end
	return true
end

-- Generates a table of n random values
local function gen(n)
	local t = {}
	for i = 1, n do t[i] = math.random(n) end
	return t
end

math.randomseed(os.time())

run('Empty arrays', function()
	local t = {}
	assert(is_sorted(insertion_sort({})))
end)

run('Already sorted array', function()
	local t = {1, 2, 3, 4, 5}
	assert(is_sorted(insertion_sort(t)))
end)

run('Sorting a large array (1e3 values)', function()
	local t = gen(1e3)
	assert(is_sorted(insertion_sort(t)))
	assert(is_sorted(insertion_sort(t, ge), ge))
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
	:format(total, pass, total-pass, (pass*100/total)))
