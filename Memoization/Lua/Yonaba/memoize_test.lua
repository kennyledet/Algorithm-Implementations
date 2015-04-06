-- Tests for memoize.lua
local memoize = require 'memoize'

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

-- Evaluates the duration of a given task f(...)
local function time(f, times, ...)
  local duration = os.time()
  for i = 1, times do f(...) end
  return (os.time() - duration) * 1000
end

-- Fibonacci function
local function fib(n)
	return n < 2 and n or fib(n-1)+fib(n-2)
end

run('Fibonacci memoization test: 10 runs for f(30)', function()
	local times = 10
	local mfib = memoize(fib)
	local fib_time = time(fib, times, 30)
	local mfib_time = time(mfib, times, 30)
	assert(mfib_time < fib_time)
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
