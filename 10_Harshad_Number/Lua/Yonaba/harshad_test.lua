-- Tests for 10harshadnumber.lua
local is_10_harshad = require 'harshad'

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

local harshad = {
  1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
  12, 18, 20, 21, 24, 27, 30, 36,
  40, 42, 45, 48, 50, 54, 60, 63,
  70, 72, 80, 81, 84, 90, 100, 102,
  108, 110, 111, 112, 114, 117, 120,
  126, 132, 133, 135, 140, 144, 150, 152,
  153, 156, 162, 171, 180, 190, 192, 195, 198, 200, 201
}

run('Harshad Numbers', function()
  for _, n in ipairs(harshad) do assert(is_10_harshad(n)) end
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
