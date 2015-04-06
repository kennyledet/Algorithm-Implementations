-- Tests for rot13.lua
local ROT13 = require 'rot13'

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
  assert(ROT13.cipher('abcd') == 'nopq')
  assert(ROT13.cipher('WXYZ') == 'JKLM')
  assert(ROT13.cipher('abcdefghijklmnopqrstuvwxyz') == 'nopqrstuvwxyzabcdefghijklm')
  assert(ROT13.cipher('ABCDEFGHIJKLMNOPQRSTUVWXYZ') == 'NOPQRSTUVWXYZABCDEFGHIJKLM')
end)

run('Deciphering test', function()
  assert(ROT13.decipher('nopq') == 'abcd')
  assert(ROT13.decipher('JKLM') == 'WXYZ')
  assert(ROT13.decipher('nopqrstuvwxyzabcdefghijklm') == 'abcdefghijklmnopqrstuvwxyz')
  assert(ROT13.decipher('NOPQRSTUVWXYZABCDEFGHIJKLM') == 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
