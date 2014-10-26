-- Tests for partial_selection_sort.lua
local PSS = require 'partial_selection_sort'

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

run('Testing partial selection sort', function()
  local t = {8, 5, 10, 6, 12}
  assert(PSS(t)    ==  5)
  assert(PSS(t, 2) ==  6)
  assert(PSS(t, 3) ==  8)
  assert(PSS(t, 4) == 10)
  assert(PSS(t, 5) == 12)
  
  local comp = function(a, b) return a > b end
  assert(PSS(t, 1, comp) == 12)
  assert(PSS(t, 2, comp) == 10)
  assert(PSS(t, 3, comp) ==  8)
  assert(PSS(t, 4, comp) ==  6)
  assert(PSS(t, 5, comp) ==  5)
  
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
