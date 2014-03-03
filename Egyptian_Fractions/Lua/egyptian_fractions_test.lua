-- Tests for egyptian_fractions.lua
local egypt = require 'egyptian_fractions'

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

-- Checks if two given fractions are the same
-- Note, f2 has a simplified representation: f2[1] is num, f2[2] is denum
local function sameFract(f1, f2)
  return (f1.num == f2[1] and f1.denum == f2[2])
end

-- Compares two Egyptian fractions
-- Note: see sameFract definition
local function same(t1, t2)
  for k, v in ipairs(t1) do
    if not sameFract(v, t2[k]) then return false end
  end
  return true
end


run('Egyptian fractions test', function()
  assert(same(egypt(2, 5),      {{1,3},{1,15}}))
  assert(same(egypt(2, 7),      {{1,4},{1,28}}))
  assert(same(egypt(2, 9),      {{1,5},{1,45}}))
  assert(same(egypt(2,11),      {{1,6},{1,66}}))
  assert(same(egypt(1023,1024), {{1,2},{1,3},{1,7},{1,44},{1,9462},{1,373029888}}))
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
