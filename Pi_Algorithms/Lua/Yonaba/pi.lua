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

-- Evaluates Pi using Chudnovsky rapidly converging infinite series
-- See: http://en.wikipedia.org/wiki/Pi#Infinite_series
-- n      : (optional) the order of the infinite sequence to reach (defaults to 25)
-- returns: an approximation of pi
local function chudnovsky_series(n)
  local sum = 0
  n = n or 25
  for k = 0, n do
    local num = ((-1)^k)*fact(6*k)*(13591409+545140134*k)
    local denum = fact(3*k)*(fact(k)^3)*(640320^(3*k+3/2))
    sum = sum+(num/denum) 
  end
  return 1/(12*sum)
end

-- Evaluates Pi using Viète infinite root sum
-- See: http://en.wikipedia.org/wiki/Pi#Infinite_series
-- n      : (optional) the order of the infinite sequence to reach (defaults to 100)
-- returns: an approximation of pi
local function viete_series(n)
  local a = math.sqrt(2)
  local prod = a/2
  n = n or 100
  for k = 2, n do
    a = math.sqrt(a+2)
    prod = prod*(a/2)
  end
  return 2/prod
end

-- Evaluates Pi using the mathematical definition (summing a circle's area)
-- See: http://en.wikipedia.org/wiki/Approximations_of_%CF%80#Summing_a_circle.27s_area
-- r      : the radius of the circle
-- returns: an approximation of pi
local function circle_area_sum(r)
  local p, s = 0
  for x = -r,r do
    for y = -r,r do
      s = x^2+y^2 <= r^2 and 1 or 0
      p = p+s
    end
  end
  return (p /(r*r))
end

return {
  statistical                = statistical_pi,
  madhava_leibniz = madhava_leibniz_series,
  ramanujan              = ramanujan_series,
  chudnovsky            = chudnovsky_series,
  viete                           = viete_series,
  circle_area                = circle_area_sum,
}