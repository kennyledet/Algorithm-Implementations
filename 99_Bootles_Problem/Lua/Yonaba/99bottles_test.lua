-- Tests for monty_hall.lua
local nbottles = require '99bottles'

local total, pass = 1, 1

local function dec(str, len)
  return #str < len
     and str .. (('.'):rep(len-#str))
      or str:sub(1,len)
end

nbottles(99)

print('\n'..('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
