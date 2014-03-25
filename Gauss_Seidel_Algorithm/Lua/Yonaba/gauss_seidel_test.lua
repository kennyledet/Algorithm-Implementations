-- Tests for sor.lua
local gauss_seidel = require 'gauss_seidel'

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
local function fuzzy_eq(a, b, eps)
  eps = eps or 1e-3
  return math.abs(a - b) < eps
end

run('Testing Gauss Seidel', function()
  local m = {
    {-4,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0},
    {1,-4,1,0,0,1,0,0,0,0,0,0,0,0,0,0},
    {0,1,-4,1,0,0,1,0,0,0,0,0,0,0,0,0},
    {0,0,1,-4,0,0,0,1,0,0,0,0,0,0,0,0},
    {1,0,0,0,-4,1,0,0,1,0,0,0,0,0,0,0},
    {0,1,0,0,1,-4,1,0,0,1,0,0,0,0,0,0},
    {0,0,1,0,0,1,-4,1,0,0,1,0,0,0,0,0},
    {0,0,0,1,0,0,1,-4,0,0,0,1,0,0,0,0},
    {0,0,0,0,1,0,0,0,-4,1,0,0,1,0,0,0},
    {0,0,0,0,0,1,0,0,1,-4,1,0,0,1,0,0},
    {0,0,0,0,0,0,1,0,0,1,-4,1,0,0,1,0},
    {0,0,0,0,0,0,0,1,0,0,1,-4,0,0,0,1},
    {0,0,0,0,0,0,0,0,1,0,0,0,-4,1,0,0},
    {0,0,0,0,0,0,0,0,0,1,0,0,1,-4,1,0},
    {0,0,0,0,0,0,0,0,0,0,1,0,0,1,-4,1},
    {0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,-4},
  }

  local b = {-11, -3, -3, -11, -8, 0, 0, -8, -8, 0, 0, -8, -10,-2, -2, -10}

  local x = gauss_seidel(m, b)
  assert(fuzzy_eq(x[1], 5.454459))
  assert(fuzzy_eq(x[2], 4.594688))
  assert(fuzzy_eq(x[3], 4.594679))
  assert(fuzzy_eq(x[4], 5.454531))
  assert(fuzzy_eq(x[5], 6.223469))
  assert(fuzzy_eq(x[6], 5.329580))
  assert(fuzzy_eq(x[7], 5.329561))
  assert(fuzzy_eq(x[8], 6.223491))
  assert(fuzzy_eq(x[9], 6.109833))
  assert(fuzzy_eq(x[10], 5.170488))
  assert(fuzzy_eq(x[11], 5.170455))
  assert(fuzzy_eq(x[12], 6.109845))
  assert(fuzzy_eq(x[13], 5.045460))
  assert(fuzzy_eq(x[14], 4.071980))
  assert(fuzzy_eq(x[15], 4.071964))
  assert(fuzzy_eq(x[16], 5.045457))
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
