-- Tests for countsort.lua
local countsort = require 'countsort'

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

-- Checks if the given array is sorted
local function is_sorted(array)
  local m = array[1]
  for i = 2,#array do
    if i < m then return false end
  end
  return true
end

run('Array should not be empty', function()
  assert(not pcall(countsort, {}))
end)

run('Array can be sorted', function()
  assert(is_sorted(countsort({0,1,2,3,4,5,6})))
  assert(is_sorted(countsort({6,5,4,3,2,1,0})))
end)

run('Array should not contain negative values', function()
  assert(not pcall(countsort, {0,-1,5,3,2}))
end)

run('Array should not contain non-integer values', function()
  assert(not pcall(countsort, {0.5,5.5,2,3,2}))
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
