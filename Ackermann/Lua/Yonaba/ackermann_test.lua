-- Tests for ackermann.lua
local A = require 'ackermann'

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

run('Ackermann function', function()
  for i = 1, 10 do assert(A(0,i) == i+1) end
  for i = 1, 10 do assert(A(1,i) == i+2) end
  for i = 1, 10 do assert(A(2,i) == 2*i+3) end
  for i = 1, 10 do assert(A(3,i), 2^(i+3)-3) end
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
