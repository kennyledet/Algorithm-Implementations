-- Tests for lzw.lua
local lzw = require 'lzw'

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

local function same(t1, t2)
  if #t1 ~= #t2 then return false end
  for k,v in ipairs(t1) do
    if v ~= t2[k] then return false end
  end
  return true
end

run('Encoding string test', function()
  assert(same(lzw.encode('TOBEORNOTTOBEORTOBEORNOT'), {84, 79, 66, 69, 79, 82, 78, 79, 84, 256, 258, 260, 265, 259, 261, 263}))
end)

run('Decoding string test', function()
  assert(lzw.decode(lzw.encode('TOBEORNOTTOBEORTOBEORNOT')) == 'TOBEORNOTTOBEORTOBEORNOT')
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
