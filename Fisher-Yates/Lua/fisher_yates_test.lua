-- Tests for fisher_yates.lua
local shuffle = require 'fisher_yates'

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

-- Generates a table of n random values
local function gen(n)
	local t = {}
	for i = 1, n do t[i] = math.random(n) end
	return t
end

local function is_not_sorted(list, comp)
	for i = 2,#list do
		if not comp(list[i-1], list[i]) then
			return true
		end
	end
	return false
end

-- Comparison functions
local function le(a, b) return a <= b end
local function ge(a, b) return a >= b end

-- A bit of randomness
math.randomseed(os.time())

-- Note: Since the algorithm generates a random permetation
-- of the given list, we cannot "test" it since the output
-- is supposed to be unpredictable. So we wil ensure that the
-- final list is not ordered.

run('Shuffles a huge array (1e6 elements)', function()
	local t = shuffle(gen(1e5))
	assert(is_not_sorted(t, le))
	assert(is_not_sorted(t, ge))
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
	:format(total, pass, total-pass, (pass*100/total)))
