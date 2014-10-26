-- Tests for brent.lua
local brent = require 'brent'

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

run('Brent cycle detection test', function()
  local t = {}
  for i = 1,7 do t[i] = {} end
  for i = 1,6 do t[i].next = t[i+1] end
  t[7].next = t[2]
  
  local function f(n) return n and n.next end
  local len, tail = brent(f, t[1])
  assert(len == 6 and tail == 1)
  
  t[7].next = t[5]
  len, tail = brent(f, t[1])
  assert(len == 3 and tail == 4)
  
  t[7].next = nil  
  assert(brent(f, t[1]) == nil)
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
