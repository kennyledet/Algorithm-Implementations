-- Tests for golden_ratio.lua
local GN = require 'golden_ratio'

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

local function fuzzyEqual(a, b, eps)
  local eps = eps or 1e-8
  return (math.abs(a - b) < eps)
end

-- The real Gold Number value
GN.Value = (1 + math.sqrt(5)) / 2

run('Test for GN computation', function()
  assert(fuzzyEqual(GN.equation(1,1e-8), GN.Value))
  assert(fuzzyEqual(GN.root(1, 1e-8), GN.Value))
  assert(fuzzyEqual(GN.fractional(1, 1e-8), GN.Value))
  assert(fuzzyEqual(GN.fibonacci(2, 1e-8), GN.Value))
  assert(fuzzyEqual(GN.babylonian(2, 1e-8), GN.Value))
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
