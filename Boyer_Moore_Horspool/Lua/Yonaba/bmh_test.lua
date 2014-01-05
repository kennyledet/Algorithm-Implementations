-- Tests for bmh.lua
local bmh = require 'bmh'

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

run('Finds a substring in a string', function()
	assert(bmh('a', 'b')                           == nil)
	assert(bmh('a', 'a')                           ==   1)
	assert(bmh('', 'a')                            == nil)
	assert(bmh('hello', 'llo')                     ==   3)
	assert(bmh('harry and john', 'john')           ==  11)
	assert(bmh('Boyer-Moore-Horspool', 'Boyer')    ==   1)
	assert(bmh('Boyer-Moore-Horspool', 'Moore')    ==   7)
	assert(bmh('Boyer-Moore-Horspool', 'Horspool') ==  13)
	assert(bmh('Boyer-Moore-Horspool', '-')        ==   6)
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
	:format(total, pass, total-pass, (pass*100/total)))
