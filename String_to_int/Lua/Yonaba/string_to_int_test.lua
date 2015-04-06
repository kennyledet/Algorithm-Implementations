-- Tests for string_to_int.lua
local tonumber = require 'string_to_int'

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


run('Fails if not given an integer as a string', function()
  assert(not pcall(tonumber,  '-1'))
  assert(not pcall(tonumber, '1.5'))
  assert(not pcall(tonumber,     1))
end)

run('Converts string to int', function()
  assert(tonumber('1')   ==   1)
  assert(tonumber('548') == 548)
  assert(tonumber('002') ==   2)
  assert(tonumber('082') ==  82)
  assert(tonumber('0')   ==   0)
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
