-- Tests for derivative.lua
local nrsolver = require 'newtonraphson'

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
  local eps = eps or 1e-4
  return (math.abs(a - b) < eps)
end

run('Solving x^2 - 2 = 0', function()
  local f = function(x) return x * x - 2.0 end
  assert(fuzzyEqual(nrsolver(f,-2), -math.sqrt(2)))
  assert(fuzzyEqual(nrsolver(f, 2),  math.sqrt(2)))
end)

run('Solving ln(x) - exp(x) = 0', function()
  local f = function(x) return math.log(x) - math.exp(1) end
  assert(fuzzyEqual(nrsolver(f, 0.1), 15.1542))
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
