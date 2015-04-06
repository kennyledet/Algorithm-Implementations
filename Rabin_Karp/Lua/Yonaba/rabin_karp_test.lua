-- Tests for rabin_karp.lua
local rabin_karp = require 'rabin_karp'

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

local function same(t, b)
  if #t ~= #b then return false end
  for k,v in ipairs(t) do
    if b[k] ~= v then return false end
  end
  return true
end

run('Testing Rabin_Karp', function()
  assert(same(rabin_karp('abcde', 'abcabcdabcde'),{8}))
  assert(same(rabin_karp('t', 'test'),{1,4}))
  assert(same(rabin_karp('lua', 'lua lua lua lu lua'), {1,5,9,16}))
end)

run('Can also take an optional prime number for hashing Rabin_Karp', function()
  assert(same(rabin_karp('abcde', 'abcabcdabcde',23),{8}))
  assert(same(rabin_karp('t', 'test',13),{1,4}))
  assert(same(rabin_karp('lua', 'lua lua lua lu lua',19), {1,5,9,16}))
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
