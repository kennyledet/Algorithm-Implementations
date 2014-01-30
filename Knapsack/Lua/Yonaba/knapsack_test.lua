-- Tests for knapsack.lua
local knapsack = require 'knapsack'

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

-- Fuzzy equality test
local function fuzzyEq(a,b) return math.abs(a-b) < 1e-2 end

run('Testing fractional knapsack', function()
  local items = {
    {name = 'Apple', w = 3, b = 5},
    {name = 'Orange', w = 4, b = 5},
    {name = 'Salt', w = 2, b = 3},
    {name = 'Pepper', w = 1, b = 2},
    {name = 'Rice', w = 5, b = 6},
  }
  local capacity = 10
  local sack = knapsack.fractional(items, capacity)
  assert(#sack == 3)
  local s1, s2, s3 = sack[1], sack[2], sack[3]
  print('s3', s3.w-1)
  assert(s1.name == 'Rice' and s1.p == 1 and s1.w == 5 and s1.b == 6)
  assert(s2.name == 'Orange' and s2.p == 1 and s2.w == 4 and s2.b == 5)
  assert(s3.name == 'Apple' and fuzzyEq(s3.p,0.33)  and s3.w == 1 and fuzzyEq(s3.b,1.67))
end)


print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
