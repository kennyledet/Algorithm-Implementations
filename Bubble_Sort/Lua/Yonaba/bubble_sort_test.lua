-- Tests for bubble_sort.lua
local bubble_sort = require 'bubble_sort'

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

-- Wrap for Lua's table sort so that it returns
-- the passed-in table
local function sort(t, comp)
	table.sort(t, comp)
	return t
end

-- Returns a copy of a an array
local function clone(t)
	local _t = {}
	for k,v in ipairs(t) do _t[k] = v end
	return _t
end

-- Checks if t1 and t2 arrays are the same
local function same(t1, t2)
	for k,v in ipairs(t1) do
		if t2[k] ~= v then return false end
	end
	return true
end

-- Generates an array of n values in random order
local function gen(n)
  local t = {}
  for i = 1, n do t[i] = math.random(n) end
  return t
end

-- Note: Let's add a bit of randomness
math.randomseed(os.time())

run('Empty arrays', function()
	local t = {}
	assert(same(sort(clone(t)),bubble_sort(t)))
end)

run('Sorted array', function()
	local t = {1, 2, 3, 4, 5}
	assert(same(sort(clone(t)),bubble_sort(t)))
end)

run('Array sorted in reverse', function()
	local t = {5, 4, 3, 2, 1}
	assert(same(sort(clone(t)),bubble_sort(t)))
	local t = {5, 4, 3, 2, 1}
	local comp = function(a,b) return a>b end
	assert(same(sort(clone(t), comp),bubble_sort(t, comp)))
end)

run('Array containing multiple occurences of the same value', function()
	local t = {4, 4, 8, 2, 2}
	local comp = function(a,b) return a <= b end
	assert(same(sort(clone(t)),bubble_sort(t, comp)))
	local t = {0, 0, 0, 0, 0}
	local comp = function(a,b) return a <= b end
	assert(same(sort(clone(t)),bubble_sort(t, comp)))
end)

run('Large array of random values (1e3 values)', function()
	local t = gen(1e3)
	local comp = function(a,b) return a <= b end
	assert(same(sort(clone(t)),bubble_sort(t, comp)))
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
	:format(total, pass, total-pass, (pass*100/total)))