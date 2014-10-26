-- Tests for rot13.lua
local ROT47 = require 'rot47'

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

run('Ciphering test', function()
  assert(ROT47.cipher('The Quick Brown Fox Jumps Over The Lazy Dog.') == '%96 "F:4< qC@H? u@I yF>AD ~G6C %96 {2KJ s@8]')
  assert(ROT47.decipher('%96 "F:4< qC@H? u@I yF>AD ~G6C %96 {2KJ s@8]') == 'The Quick Brown Fox Jumps Over The Lazy Dog.')
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
