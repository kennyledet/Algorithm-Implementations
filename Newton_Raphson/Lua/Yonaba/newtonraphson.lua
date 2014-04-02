-- Newton (Raphson) root finding algorithm implementation
-- See : http://en.wikipedia.org/wiki/Newton%27s_method

-- Fuzzy equality test
local function fuzzyEqual(a, b, eps)
  local eps = eps or 1e-4
  return (math.abs(a - b) < eps)
end

-- Evaluates the derivative of function f at x0
-- Uses Newton's centered slope approximation
local function drvMid(f, x0, initStep)
  local step = initStep or 0.1
  local incr1, incr2 = (f(x0 + step) - f(x0 - step)) / (2 * step)
  repeat
    incr2 = incr1
    step = step / 2
    incr1 = (f(x0 + step) - f(x0 - step)) / (2 * step)
  until fuzzyEqual(incr1, incr2)
  return incr1
end

-- Find a zero for a given function f
-- f        : the equation, to be solved (f(x) = 0)
-- initStep : (optional) initial value for iterations
-- eps      : (optional) accuracy parameter for convergence
-- returns  : a zero for the function f
return function(f, initStep, eps)
  local next_x = initStep or 0
  local prev_x
  repeat
    prev_x = next_x
    next_x = next_x - (f(next_x) / drvMid(f, next_x))
  until fuzzyEqual(next_x, prev_x, eps)
  return next_x
end
