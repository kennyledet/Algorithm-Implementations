-- Tests for euclidian.lua
local fact = require 'factorial'

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

run('Factorial.recursive should fail these tests', function()
  assert(not pcall(fact.recursive))
  assert(not pcall(fact.recursive, -1))
end)

run('Testing factorial.recursive', function()
  assert(fact.recursive(0)  ==             1)
  assert(fact.recursive(1)  ==             1)
  assert(fact.recursive(5)  ==           120)
  assert(fact.recursive(15) == 1307674368000)
end)

run('Factorial.iterative should fail these tests', function()
  assert(not pcall(fact.iterative))
  assert(not pcall(fact.iterative, -1))
end)

run('Testing factorial.iterative', function()
  assert(fact.iterative(0)  ==             1)
  assert(fact.iterative(1)  ==             1)
  assert(fact.iterative(5)  ==           120)
  assert(fact.iterative(15) == 1307674368000)
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
