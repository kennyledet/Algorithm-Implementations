-- Derivative evaluation algorithm implementation
-- See : http://en.wikipedia.org/wiki/Derivative

-- Fuzzy equality test
local function fuzzyEqual(a, b, eps)
  local eps = eps or 1e-4
  return (math.abs(a - b) < eps)
end

-- Evaluates the derivative of function f at x0
-- Uses Newton's forward slope approximation
-- f        : a function
-- x0       : the value at which the derivative is evaluated
-- initStep : (optional) initial step value. The lower, the better.
-- returns  : f'(x0)
local function drvRight(f, x0, initStep)
  local step = initStep or 0.1
  local incr1, incr2 = (f(x0 + step) - f(x0)) / step
  repeat
    incr2 = incr1
    step = step / 2
    incr1 = (f(x0 + step) - f(x0)) / step
  until fuzzyEqual(incr1, incr2)
  return incr1
end

-- Evaluates the derivative of function f at x0
-- Uses Newton's backward slope approximation
-- f        : a function
-- x0       : the value at which the derivative is evaluated
-- initStep : (optional) initial step value. The lower, the better.
-- returns  : f'(x0)
local function drvLeft(f, x0, initStep)
  local step = initStep or 0.1
  local incr1, incr2 = (f(x0) - f(x0 - step)) / step
  repeat
    incr2 = incr1
    step = step / 2
    incr1 = (f(x0) - f(x0 - step)) / step
  until fuzzyEqual(incr1, incr2)
  return incr1
end

-- Evaluates the derivative of function f at x0
-- Uses Newton's centered slope approximation
-- f        : a function
-- x0       : the value at which the derivative is evaluated
-- initStep : (optional) initial step value. The lower, the better.
-- returns  : f'(x0)
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

return {
  left = drvLeft,
  right = drvRight,
  mid = drvMid
}
