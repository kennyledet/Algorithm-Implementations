-- Tests for symmdiff.lua
local symdiff = require 'symdiff'

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

local function same(t1, t2)
  if #t1~=#t2 then return false end
  for k,v in pairs(t1) do
    if t2[k] ~= v then return false end
  end
  return true
end

run('Symmetric difference', function()
  local s1, s2 = {1, 2, 3, 4}, {3, 4, 5, 6}
  assert(same(symdiff(s1,s2),{1,2,5,6}))
  
  local s1, s2 = {}, {}
  assert(same(symdiff(s1,s2),{}))
  
  local s1, s2 = {1}, {2}
  assert(same(symdiff(s1,s2),{1,2}))
  
  local s1, s2 = {3}, {3}
  assert(same(symdiff(s1,s2),{}))
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
