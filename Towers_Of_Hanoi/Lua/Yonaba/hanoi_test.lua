-- Tests for hanoi.lua
local Hanoi = require 'hanoi'

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

run('Hanoi test', function()
  local log = {}
  Hanoi(3, 1, 3, 2, log)
  assert(log[1] == '1->3')
  assert(log[2] == '1->2')
  assert(log[3] == '3->2')
  assert(log[4] == '1->3')
  assert(log[5] == '2->1')
  assert(log[6] == '2->3')
  assert(log[7] == '1->3')
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
