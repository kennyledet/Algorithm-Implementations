-- Tests for bwt.lua
local bwt = require 'bwt'

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

run('Encoding string tests', function()
  assert(bwt.encode('Banana') == 'annBaa')
  assert(bwt.encode('burrows-wheeler'),'srhelwereruwb-o')
  assert(bwt.encode('random rotation'), 'mrtntoaodirn oa')
  assert(bwt.encode('     '), '     ')
end)

run('Decoding string tests', function()
  assert(bwt.decode(bwt.encode('Banana')) == 'Banana')
  assert(bwt.decode(bwt.encode('     '))  == '     ')
  assert(bwt.decode(bwt.encode('burrows-wheeler'))  == 'burrows-wheeler')
  assert(bwt.decode(bwt.encode('random rotation'))  == 'random rotation')
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
