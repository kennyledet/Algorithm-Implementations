-- Pollard's Rho Integer Factorization algorithm implementation
-- See: http://en.wikipedia.org/wiki/Pollard%27s_rho_algorithm

-- Returns the greatest common divisor of a and b
local function gcd(a, b)
  if a == 0 then return b 
  elseif b == 0 then return a
  end
  if a == b then return a end
  return a > b and gcd(a - b, b) or gcd(a, b - a)
end

-- n       : an integer number to be factored
-- f       : a factorization function
-- returns : a non trivial factor or n, or nil if failure.
return function (n, f)
  local x, y, d = 2, 2, 1
  while d == 1 do
    x = f(x)
    y = f(f(y))
    d = gcd(math.abs(x - y), n)
  end
  return d ~= n and d
end