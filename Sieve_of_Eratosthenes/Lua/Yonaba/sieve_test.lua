-- Tests for sieve.lua
local sieve = require 'sieve'

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

local function find(array, value)
  for i,v in ipairs(array) do
    if v == value then return i end
  end
end

run('Testing sieve', function()
  local primes = sieve(20)
  assert(#primes          ==   7)
  assert(find(primes,  0) == nil)
  assert(find(primes,  1) == nil)
  assert(find(primes,  3) ==   1)
  assert(find(primes,  5) ==   2)
  assert(find(primes,  7) ==   3)
  assert(find(primes, 11) ==   4)
  assert(find(primes, 13) ==   5)
  assert(find(primes, 17) ==   6)
  assert(find(primes, 19) ==   7)
end)

run('We have 78497 primes below 1000000', function()
  assert(#sieve(1e6) == 78497)
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
