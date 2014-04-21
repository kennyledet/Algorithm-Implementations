-- Tests for catalan.lua
local catalan = require 'catalan'

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

run('10 first Catalan Numbers using direct formula', function()
  assert(catalan.direct(0)  == 1)
  assert(catalan.direct(1)  == 1)
  assert(catalan.direct(2)  == 2)
  assert(catalan.direct(3)  == 5)
  assert(catalan.direct(4)  == 14)
  assert(catalan.direct(5)  == 42)
  assert(catalan.direct(6)  == 132)
  assert(catalan.direct(7)  == 429)
  assert(catalan.direct(8)  == 1430)
  assert(catalan.direct(9)  == 4862)
  assert(catalan.direct(10) == 16796)
end)

run('10 first Catalan Numbers using recursive formula', function()
  assert(catalan.recursive(0)  == 1)
  assert(catalan.recursive(1)  == 1)
  assert(catalan.recursive(2)  == 2)
  assert(catalan.recursive(3)  == 5)
  assert(catalan.recursive(4)  == 14)
  assert(catalan.recursive(5)  == 42)
  assert(catalan.recursive(6)  == 132)
  assert(catalan.recursive(7)  == 429)
  assert(catalan.recursive(8)  == 1430)
  assert(catalan.recursive(9)  == 4862)
  assert(catalan.recursive(10) == 16796)
end)

run('10 first Catalan Numbers using recursive formula', function()
  assert(catalan.memoized(0)  == 1)
  assert(catalan.memoized(1)  == 1)
  assert(catalan.memoized(2)  == 2)
  assert(catalan.memoized(3)  == 5)
  assert(catalan.memoized(4)  == 14)
  assert(catalan.memoized(5)  == 42)
  assert(catalan.memoized(6)  == 132)
  assert(catalan.memoized(7)  == 429)
  assert(catalan.memoized(8)  == 1430)
  assert(catalan.memoized(9)  == 4862)
  assert(catalan.memoized(10) == 16796)
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
