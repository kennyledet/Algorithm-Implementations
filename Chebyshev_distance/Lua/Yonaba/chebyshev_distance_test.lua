-- Tests for chebyshev_distance.lua
local cdist = require 'chebyshev_distance'

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

run('Chebyshev distance test', function()
  assert(cdist({},{}), 0)
  assert(cdist({1,2,3},{4,5,6}), 3)
  assert(cdist({1,2,-1},{4,4,6}), 7)
  assert(not pcall(cdist,{1,2,3},{4,5}))
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
