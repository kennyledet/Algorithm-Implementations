-- Factorial algorithm implementation
-- See : http://en.wikipedia.org/wiki/Factorial

-- Recursive tail call implementation
local function factorial_recursive(n)
  assert(n >= 0, ('Argument must be positive'))
  if n == 0 then return 1 end
  return n * factorial_recursive(n-1)
end

-- Iterative implementation
local function factorial_iterative(n)
  local fact = 1
  for i = 1, n do fact = fact * i end
  return fact
end

return {
  recursive = factorial_recursive,
  iterative = factorial_iterative
}
