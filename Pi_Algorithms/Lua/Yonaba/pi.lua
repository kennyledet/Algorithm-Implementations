-- Pi approximation algorithms implementation
-- See: http://en.wikipedia.org/wiki/Pi

-- Utility functions

-- Computes the factorial of a given number
local function fact(n)
  return n == 0 and 1 or n * fact(n - 1)
end

-- Evaluates Pi using a random and statistical approach
--   (Monte-Carlo method) to evaluate pi
-- See: http://en.wikipedia.org/wiki/Pi#Geometry_and_trigonometry
-- n      : the number of simulations (should be high)
-- seed   : (optional) a custom seed to init the RNG
-- returns: an approximation of pi
local function statistical_pi(n, seed)
  if seed then math.randomseed(seed) end
  local count, pi = 0
  for i = 1, n do
    local x, y = math.random(), math.random()
    if ((x-0.5)^2 + (y-0.5)^2 < 0.5^2) then
      count = count + 1
    end
  end 
  return 4*(count/n)
end

-- Evaluates Pi using Madhava-Leibniz infinite series
-- See: http://en.wikipedia.org/wiki/Pi#Infinite_series
-- n      : (optional) the order of the infinite sequence to reach (defaults to 100)
-- returns: an approximation of pi
local function madhava_leibniz_series(n)
  local k, sum = 0, 0
  n = n or 100
  for k = 0, n do
    sum = sum + ((-3)^(-k))/(2*k+1)
  end
  return math.sqrt(12)*sum
end

-- Evaluates Pi using Ramanujan rapidly converging infinite series
-- See: http://en.wikipedia.org/wiki/Pi#Infinite_series
-- n      : (optional) the order of the infinite sequence to reach (defaults to 40)
-- returns: an approximation of pi
local function ramanujan_series(n)
  local sum = 0
  n = n or 40
  for k = 0, n do
    sum = sum + (fact(4*k) * (1103+26390*k))/((fact(k)^4)*(396^(4*k)))
  end
  return 1/(((2*math.sqrt(2))/9801)*sum)
end

