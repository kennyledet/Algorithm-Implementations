-- Fibonacci series implementation
-- See: http://en.wikipedia.org/wiki/Fibonacci_number
-- Implementation note:
--  With respect to Lua's array numbering, with starts at 1,
--  the following assumes that, given a function F which returns
--  the i-th term in a Fibonacci series,
--  F(0) is undefined
--  F(1) = 1
--  F(2) = 1
--  F(n) = F(n-1) + F(n-2), given any n > 2

-- Custom memoization function
local function memoize(f,hash)
  local _cache = {}
  return function (v)
    local _result = _cache[v]
    if not _result then _cache[v] = f(v) end
    return _cache[v]
  end
end

-- Recursive evaluation of fibonacci series
-- n: the i-th Fibonacci number

local function fib(n)
  if n > 0 and n <= 2 then return 1 end
  return fib(n-1) + fib(n-2)
end

-- Iterator for Fibonacci series
-- usage:
--  for count, value in fib_iter(limit) do ... end
local function fib_iter(n)
	assert(n > 0, 'Expected n >= 0!')
	return coroutine.wrap(function()
		local a, b, k = 0, 1, 0
		while k < n do
			a, b = b, a+b
			k = k + 1
			coroutine.yield(k, a)
		end
	end)
end

return {
	fib = memoize(fib),
	fib_iter = fib_iter
}
