-- Tests for euclidian.lua
local gcd = require 'euclidian'

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

run('Testing gcd.division', function()
	assert(gcd.division(10, 15) ==  5)
	assert(gcd.division(14,  7) ==  7)
	assert(gcd.division(12, 12) == 12)
	assert(gcd.division( 7,  3) ==  1)
	assert(gcd.division( 5,  0) ==  5)
	assert(gcd.division( 0,  2) ==  2)
  
	assert(not pcall(gcd.division))  
	assert(not pcall(gcd.division,  0,   0))
	assert(not pcall(gcd.division, -1,   5))
	assert(not pcall(gcd.division, 10, 2.3))
end)

run('Testing gcd.substraction', function()
	assert(gcd.substraction(10, 15) ==  5)
	assert(gcd.substraction(14,  7) ==  7)
	assert(gcd.substraction(12, 12) == 12)
	assert(gcd.substraction( 7,  3) ==  1)
	assert(gcd.substraction( 5,  0) ==  5)
	assert(gcd.substraction( 0,  2) ==  2)
  
	assert(not pcall(gcd.substraction))  
	assert(not pcall(gcd.substraction,  0,   0))
	assert(not pcall(gcd.substraction, -1,   5))
	assert(not pcall(gcd.substraction, 10, 2.3))
end)

run('Testing gcd.recursive', function()
	assert(gcd.recursive(10, 15) ==  5)
	assert(gcd.recursive(14,  7) ==  7)
	assert(gcd.recursive(12, 12) == 12)
	assert(gcd.recursive( 7,  3) ==  1)
	assert(gcd.recursive( 5,  0) ==  5)
	assert(gcd.recursive( 0,  2) ==  2)
  
	assert(not pcall(gcd.recursive))  
	assert(not pcall(gcd.recursive,  0,   0))
	assert(not pcall(gcd.recursive, -1,   5))
	assert(not pcall(gcd.recursive, 10, 2.3))
end)


print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
	:format(total, pass, total-pass, (pass*100/total)))
