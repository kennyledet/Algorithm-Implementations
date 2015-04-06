-- Tests for stooge_sort.lua
local stooge_sort = require 'stooge_sort'

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

-- Comparison functions
local function le(a,b) return a <= b end
local function ge(a,b) return a >= b end

-- Checks if list is sorted
function is_sorted(list, comp)
  for i = 2, #list do
    if not comp(list[i-1],list[i]) then return false end
  end
  return true
end

-- Generates a table of n random values in [1..n]
local function gen(n)
  local t = {}
  for i = 1, n do t[i] = math.random(n) end
  return t
end

math.randomseed(os.time())

run('Testing Stooge sort', function()
  assert(is_sorted(stooge_sort(gen(100), le), le))
  assert(is_sorted(stooge_sort(gen(100), ge), ge))
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
