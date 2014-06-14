-- Tests for vigenere_cipher.lua
local vigenere = require 'vigenere_cipher'

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
  assert(caesar.cipher('abcd',1) == 'bcde')
  assert(caesar.cipher('WXYZ',2) == 'YZAB')
  assert(caesar.cipher('abcdefghijklmnopqrstuvwxyz',3) == 'defghijklmnopqrstuvwxyzabc')
  assert(caesar.cipher('ABCDEFGHIJKLMNOPQRSTUVWXYZ',4) == 'EFGHIJKLMNOPQRSTUVWXYZABCD')
end)

run('Deciphering test', function()
  assert(caesar.decipher('bcde',1) == 'abcd')
  assert(caesar.decipher('YZAB',2) == 'WXYZ')
  assert(caesar.decipher('defghijklmnopqrstuvwxyzabc',3) == 'abcdefghijklmnopqrstuvwxyz')
  assert(caesar.decipher('EFGHIJKLMNOPQRSTUVWXYZABCD',4) == 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
