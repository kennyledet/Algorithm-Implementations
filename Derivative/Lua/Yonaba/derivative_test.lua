-- Tests for derivative.lua
local drv = require 'derivative'

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

run('Testing left derivative', function()
  local f = function(x) return x * x end
  assert(fuzzyEqual(drv.left(f, 5), 2 * 5))
  local f = function(x) return x * x * x end
  assert(fuzzyEqual(drv.left(f, 5), 3 * 5 * 5))
end)

run('Testing right derivative', function()
  local f = function(x) return x * x end
  assert(fuzzyEqual(drv.right(f, 5), 2 * 5))
  local f = function(x) return x * x * x end
  assert(fuzzyEqual(drv.right(f, 5), 3 * 5 * 5))
end)

run('Testing mid derivative', function()
  local f = function(x) return x * x end
  assert(fuzzyEqual(drv.mid(f, 5), 2 * 5))
  local f = function(x) return x * x * x end
  assert(fuzzyEqual(drv.mid(f, 5), 3 * 5 * 5))
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
