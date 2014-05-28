-- Tests for josephus.lua
local j = require 'josephus'

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

-- Solutions for k = 2
local solutions = {1 ,1 ,3 ,1 ,3 ,5 ,7 ,1 ,3 ,5 ,7 ,9 ,11 ,13 ,15 ,1}

run('Josephus recursive test', function()
  for n = 1,16 do assert(j.recursive(n, 2) == solutions[n]) end
end)

run('Josephus loop-based test', function()
  for n = 1,16 do assert(j.loop(n, 2) == solutions[n]) end
end)

run('Josephus elaborated test', function()
  for n = 1,16 do assert(j.elaborated(n, 2) == solutions[n]) end
end)

run('Josephus standard test', function()
  for n = 1,16 do assert(j.standard(n) == solutions[n]) end
end)

run('Josephus standard logarithm-based test', function()
  for n = 1,16 do assert(j.standard_log(n) == solutions[n]) end
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
