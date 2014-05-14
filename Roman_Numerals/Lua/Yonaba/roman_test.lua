-- Tests for roman.lua
local roman = require 'roman'

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

run('Roman encoding', function()
  assert(roman.encode(2)    == 'II')
  assert(roman.encode(12)   == 'XII')
  assert(roman.encode(327)  == 'CCCXXVII')
  assert(roman.encode(1970) == 'MCMLXX')
  assert(roman.encode(2014) == 'MMXIV')
end)

run('Roman decoding', function()
  assert(roman.decode('II')       == 2)
  assert(roman.decode('XII')      == 12)
  assert(roman.decode('CCCXXVII') == 327)
  assert(roman.decode('MCMLXX')   == 1970)
  assert(roman.decode('MMXIV')    == 2014)
end)


print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
