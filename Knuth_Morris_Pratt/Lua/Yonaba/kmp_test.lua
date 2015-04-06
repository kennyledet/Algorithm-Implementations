-- Tests for kmp.lua
local kmp = require 'kmp'

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

run('Testing Knuth_Morris_Pratt', function()
  assert(kmp('ABCDABD', 'ABC ABCDAB ABCDABCDABDE'),           15)
  assert(kmp('0101', '0011001011'),                            5)
  assert(kmp('lu lu lu lua lu', 'alualu lu lu lua lus'), 4)
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
