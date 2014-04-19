-- Catalan Number series implementation
-- See: http://en.wikipedia.org/wiki/Catalan_number

-- Utility functions

-- Returns the factorial of a given number
local function fact(n)
  return n == 0 and 1 or n*fact(n-1)
end

-- Memoizes a function
local function memoize(f)
  local _cache = {}
  return function (v)
    local _result = _cache[v]
    if not _result then _cache[v] = f(v) end
    return _cache[v]
  end
end

-- Calculates the n-th Catalan number using a direct formula
local function catalan_direct(n)
  return fact(2*n)/(fact(n+1)*fact(n))
end

-- Calculates the n-th Catalan number using a memoized formula
local function catalan_recursive(n)
  if n == 0 then return 1 end
  return catalan_recursive(n-1)*(2*(2*n-1)/(n+1))
end

-- Calculates the n-th Catalan number using a memoized memoized function
local catalan_recursive_memoized = memoize(catalan_recursive)

return {
  direct = catalan_direct,
  recursive = catalan_recursive,
  memoized = catalan_recursive_memoized
}