-- Tests for golden_ratio.lua
local PI = require 'pi'

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

run('Testing Statistical (Monte-Carlo pi)', function()
  assert(fuzzyEqual(PI.statistical(100000, os.time()), math.pi,1e-2))
  assert(fuzzyEqual(PI.statistical(100000, os.time()), math.pi,1e-2))
end)

run('Testing Madhava-Leibniz series', function()
  assert(fuzzyEqual(PI.madhava_leibniz( 100), math.pi,1e-8))
  assert(fuzzyEqual(PI.madhava_leibniz( 500), math.pi,1e-8))
  assert(fuzzyEqual(PI.madhava_leibniz(1000), math.pi,1e-8))
end)

run('Testing Ramanujan series', function()
  assert(fuzzyEqual(PI.ramanujan(20), math.pi,1e-8))
  assert(fuzzyEqual(PI.ramanujan(30), math.pi,1e-8))
  assert(fuzzyEqual(PI.ramanujan(40), math.pi,1e-8))
end)

run('Testing Chudnovsky series', function()
  assert(fuzzyEqual(PI.chudnovsky(10), math.pi,1e-8))
  assert(fuzzyEqual(PI.chudnovsky(20), math.pi,1e-8))
  assert(fuzzyEqual(PI.chudnovsky(25), math.pi,1e-8))
end)

run('Testing Viete series', function()
  assert(fuzzyEqual(PI.viete(  100), math.pi,1e-8))
  assert(fuzzyEqual(PI.viete(  200), math.pi,1e-8))
  assert(fuzzyEqual(PI.viete(10000), math.pi,1e-8))
end)

run('Testing Circle area sum method', function()
  assert(fuzzyEqual(PI.circle_area(   100), math.pi,1e-2))
  assert(fuzzyEqual(PI.circle_area(  1000), math.pi,1e-4))
  assert(fuzzyEqual(PI.circle_area(10000), math.pi,1e-5))
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
