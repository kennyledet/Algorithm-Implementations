-- Golden Ratio approximation algorithms
-- See: http://en.wikipedia.org/wiki/Golden_ratio

-- Fuzzy equality test
local function fuzzy_equal(a, b, eps) return (math.abs(a - b) < eps) end

-- Computes an approximate value of the Golden Ratio
-- Using a root based iteration.
-- See: http://en.wikipedia.org/wiki/Golden_ratio#Alternative_forms
-- seed    : (optional) seed to start the computation (defaults to 1)
-- acc     : (optional) approximation accuracy (defaults to 1E-8)
-- returns : an approximation of the Golden Ratio
local function golden_ration_root_iteration(seed, acc)
  local phi, phi2 = seed or 1
  acc = acc or 1e-8
  repeat
    phi2 = phi
    phi = math.sqrt(1 + phi)
  until fuzzy_equal(phi, phi2, acc) 
  return phi
end

-- Computes an approximate value of the Golden Ratio
-- Using a fractional based iteration.
-- See: http://en.wikipedia.org/wiki/Golden_ratio#Alternative_forms
-- seed    : (optional) seed to start the computation (defaults to 1)
-- acc     : (optional) approximation accuracy (defaults to 1E-8)
-- returns : an approximation of the Golden Ratio
local function golden_ration_fractional_iteration(seed, acc)
  local phi, phi2 = seed or 1
  acc = acc or 1e-8
  repeat
    phi2, phi = phi, 1 + (1 / phi)
  until fuzzy_equal(phi, phi2, acc) 
  return phi
end

-- Computes an approximate value of the Golden Ratio
-- Using Babylonian method.
-- See: http://en.wikipedia.org/wiki/Golden_ratio#Decimal_expansion
-- seed    : (optional) seed to start the computation (defaults to 1)
-- acc     : (optional) approximation accuracy (defaults to 1E-8)
-- returns : an approximation of the Golden Ratio
local function golden_ration_babylonian_iteration(seed, acc)
  local phi, phi2 = seed or 1
  acc = acc or 1e-8
  repeat
    phi2 = phi
    phi = (phi * phi + 1) / (2 * phi - 1)
  until fuzzy_equal(phi, phi2, acc)
  return phi
end

-- Computes an approximate value of the Golden Ratio
-- Using a Newton-Raphson solver (implemented as an external dependency)
-- See: http://en.wikipedia.org/wiki/Golden_ratio#Calculation
-- seed    : (optional) seed to start the computation (defaults to 1)
-- acc     : (optional) approximation accuracy (defaults to 1E-8)
-- returns : an approximation of the Golden Ratio
local solve = require 'lib.newtonraphson'
local function golden_ration_equation(seed, acc)
  return solve(function(x) return x * x - x - 1 end, seed, acc)
end

-- Computes an approximate value of the Golden Ratio
-- Using Fibonacci series (implemented as an external dependency).
-- See: http://en.wikipedia.org/wiki/Golden_ratio#Relationship_to_Fibonacci_sequence
-- seed    : (optional) seed to start the computation (defaults to 2)
-- acc     : (optional) approximation accuracy (defaults to 1E-8)
-- returns : an approximation of the Golden Ratio
local fib = (require 'lib.fib')
local function golden_ration_fibonacci_iteration(seed, acc)
  seed, acc = seed or 2, acc or 1e-8
  assert(seed >= 2, 'order must be greater than 1')
  local denum, num = fib(seed), fib(seed + 1)
  local phi, phi2 = num / denum
  repeat
    phi2 = phi
    seed = seed + 1    
    denum, num = num, fib(seed)
    phi = num / denum
  until fuzzy_equal(phi, phi2, acc)
  return phi
end

return {
  root       = golden_ration_root_iteration,
  fractional = golden_ration_fractional_iteration,
  babylonian = golden_ration_babylonian_iteration,
  equation   = golden_ration_equation,
  fibonacci  = golden_ration_fibonacci_iteration
}