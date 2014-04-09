-- Pi approximation algorithms implementation
-- See: http://en.wikipedia.org/wiki/Pi

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
    if ((x - 0.5) ^ 2 + (y - 0.5) ^ 2 < 0.5 ^ 2) then
      count = count + 1
    end
  end 
  return 4 * (count / n)
end

-- Evaluates Pi using Madhava-Leibniz infinite series
-- See: http://en.wikipedia.org/wiki/Pi#Infinite_series
-- n      : (optional) the order of the infinite sequence to reach (defaults to 100)
-- returns: an approximation of pi
local function madhava_leibniz_series(n)
  local k, sum = 0, 0
  n = n or 100
  for k = 0, n do
    sum = sum + ((-3)^(-k)) / (2 * k + 1)
  end
  return math.sqrt(12) * sum
end
