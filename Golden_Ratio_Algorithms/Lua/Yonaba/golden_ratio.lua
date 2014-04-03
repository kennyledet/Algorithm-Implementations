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
local function gold_number_root_iteration(seed, acc)
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
local function gold_number_fractional_iteration(seed, acc)
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
local function gold_number_babylonian_iteration(seed, acc)
  local phi, phi2 = seed or 1
  acc = acc or 1e-8
  repeat
    phi2 = phi
    phi = (phi * phi + 1) / (2 * phi - 1)
  until fuzzy_equal(phi, phi2, acc)
  return phi
end

return {
  root       = gold_number_root_iteration,
  fractional = gold_number_fractional_iteration,
  babylonian = gold_number_babylonian_iteration
}