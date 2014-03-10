-- Tests for euclidean_norm.lua
local enorm = require 'euclidean_norm'

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
local function fuzzyEqual(a, b)
  return math.abs(a-b) < 1e-8
end

run('Eucldian norm test', function()
  assert(fuzzyEqual(enorm({}), 0))
  assert(fuzzyEqual(enorm({1, 1}), math.sqrt(2)))
  assert(fuzzyEqual(enorm({5, 8, 3}), math.sqrt(98)))
  assert(fuzzyEqual(enorm({10, 10, 10, 10}), math.sqrt(400)))
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
