-- Tests for maximum_subarray.lua
local gss = require 'maximum_subarray'

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

run('Kadanes algorithm', function()
  local max, i, j = gss.kadanes {1, 2, 3, 4, 5}
  assert( max == 15 and i == 1 and j == 5)

  max, i, j = gss.kadanes {-1, -2, -3, -4, -5}
  assert( max == -1 and i == 1 and j == 1)

  max, i, j = gss.kadanes {-2, 1, -3, 4, -1, 2, 1, -5, 4}
  assert( max == 6 and i == 4 and j == 7)
end)

run('Brute-force algorithm', function()
  local max, i, j = gss.brute_force {1, 2, 3, 4, 5}
  assert( max == 15 and i == 1 and j == 5)

  max, i, j = gss.brute_force {-1, -2, -3, -4, -5}
  assert( max == -1 and i == 1 and j == 1)

  max, i, j = gss.brute_force {-2, 1, -3, 4, -1, 2, 1, -5, 4}
  assert( max == 6 and i == 4 and j == 7)
end)

run('Subsums', function()
  local max, i, j = gss.subsums {1, 2, 3, 4, 5}
  assert( max == 15 and i == 1 and j == 5)

  max, i, j = gss.subsums {-1, -2, -3, -4, -5}
  assert( max == -1 and i == 1 and j == 1)

  max, i, j = gss.subsums {-2, 1, -3, 4, -1, 2, 1, -5, 4}
  assert( max == 6 and i == 4 and j == 7)
end)

run('Dynamic programming', function()
  local max, i, j = gss.dynamic {1, 2, 3, 4, 5}
  assert( max == 15 and i == 1 and j == 5)

  max, i, j = gss.dynamic {-1, -2, -3, -4, -5}
  assert( max == -1 and i == 1 and j == 1)

  max, i, j = gss.dynamic {-2, 1, -3, 4, -1, 2, 1, -5, 4}
  assert( max == 6 and i == 4 and j == 7)
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
