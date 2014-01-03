-- Tests for fib.lua
local fib      = (require 'fib').fib
local fib_iter = (require 'fib').fib_iter

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

run('Fails on running with no arg or 0', function()
	assert(not pcall(fib))
	assert(not pcall(fib, 0))
	assert(not pcall(fib_iter))
	assert(not pcall(fib_iter, 0))
end)

run('Evaluates the i-th term in fibonacci series', function()
	local fib_values = {1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144}
	for i,v in ipairs(fib_values) do
		assert(v == fib(i))
	end

	for i,v in fib_iter(#fib_values) do
		assert(fib_values[i], i,v)
	end

end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
	:format(total, pass, total-pass, (pass*100/total)))
