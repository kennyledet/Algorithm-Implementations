-- Tests for average.lua
local mean = require 'average'

local total, pass = 0, 0

local function dec(str, len)
  return #str < len
     and str .. (('.'):rep(len-#str))
      or str:sub(1,len)
end

local function run(message, f)
  total = total + 1
  local ok, err = pcall(f)
  if ok then pass = pass + 1 end
  local status = ok and 'PASSED' or 'FAILED'
  print(('%02d. %68s: %s'):format(total, dec(message,68), status))
end

local function fuzzyEqual(a, b, eps) return math.abs(a - b) < eps end
local x = {1, 2, 3, 4, 5}  

run('Arithmetic mean', function()
  assert(mean.arithmetic(x) == 3)
end)

run('Geometric mean', function()
  assert(fuzzyEqual(mean.geometric(x), 2.60517108,1e-8))
end)

run('Harmonic mean', function()
  assert(fuzzyEqual(mean.harmonic(x), 2.18978102,1e-8))
end)

run('Quadratic mean', function()
  assert(fuzzyEqual(mean.quadratic(x), 3.31662479,1e-8))
end)

run('Generalized mean', function()
  assert(fuzzyEqual(mean.generalized(x,1), mean.arithmetic(x),1e-8))
  assert(fuzzyEqual(mean.generalized(x,2), mean.quadratic(x),1e-8))
  assert(fuzzyEqual(mean.generalized(x,-1), mean.harmonic(x),1e-8))
end)

run('Weighted mean', function()
  local w = { 0.1, 0.2, 0.2, 0.3, 0.2}
  assert(mean.weighted(x, w) == 3.3)
end)

run('Midrange mean', function()
  assert(mean.midrange(x) == 3)
end)

run('Energetic mean', function()
  assert(fuzzyEqual(mean.energetic(x), 3.22766781,1e-8))
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
