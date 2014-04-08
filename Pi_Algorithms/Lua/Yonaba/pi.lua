-- Pi approximation algorithms implementation
-- See: http://en.wikipedia.org/wiki/Pi

-- Evaluates Pi using a random and statistical approach
--   (Monte-Carlo method) to evaluate pi
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
