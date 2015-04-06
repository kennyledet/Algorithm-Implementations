-- Tests for selfdescriptivenumber.lua
local is_self_descriptive = require 'selfdescriptivenumber'

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

run('Self-descriptive numbers', function()
  assert(is_self_descriptive(1210) == true)
  assert(is_self_descriptive(2020) == true)
  assert(is_self_descriptive(21200) == true)
  assert(is_self_descriptive(3211000) == true)
  assert(is_self_descriptive(42101000) == true)
  assert(is_self_descriptive(6210001000) == true)
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
