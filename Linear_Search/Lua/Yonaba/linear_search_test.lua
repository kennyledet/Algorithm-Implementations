-- Tests for linear_search.lua
local search = require 'linear_search'

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

local t1 = {'a', 'b', 'c', 'd', 'e', 'f'}
local t2 = {1, 2, 3, 4, 5, 6, 7, 8, 9}
local t3 = {false, true, 'false', 'true'}

run('Forward iteration search', function()
  assert(search.forward(t1, 'd')     == 4)
  assert(search.forward(t1, 'g')     == nil)
  assert(search.forward(t2, 8)       == 8)
  assert(search.forward(t2, '3')     == nil)
  assert(search.forward(t3, 'false') == 3)
  assert(search.forward(t3, nil)     == nil)
end)

run('Backward iteration search', function()
  assert(search.backward(t1, 'd')     == 4)
  assert(search.backward(t1, 'g')     == nil)
  assert(search.backward(t2, 8)       == 8)
  assert(search.backward(t2, '3')     == nil)
  assert(search.backward(t3, 'false') == 3)
  assert(search.backward(t3, nil)     == nil)
end)

run('Recursive iteration search', function()
  assert(search.recursive(t1, 'd')     == 4)
  assert(search.recursive(t1, 'g')     == nil)
  assert(search.recursive(t2, 8)       == 8)
  assert(search.recursive(t2, '3')     == nil)
  assert(search.recursive(t3, 'false') == 3)
  assert(search.recursive(t3, nil)     == nil)
end)

run('Reverse recursive iteration search', function()
  assert(search.backward_recursive(t1, 'd')     == 4)
  assert(search.backward_recursive(t1, 'g')     == nil)
  assert(search.backward_recursive(t2, 8)       == 8)
  assert(search.backward_recursive(t2, '3')     == nil)
  assert(search.backward_recursive(t3, 'false') == 3)
  assert(search.backward_recursive(t3, nil)     == nil)
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
