
-- Creates an array of consecutive [1..n] integers
local function array(n)
  local t = {}
  for i = 1, n do t[i] = i end
  return t
end

-- Greps truthy values
local function truthy(array)
  local t = {}
  for i,v in ipairs(array) do
    if v then t[#t + 1] = v end
  end
  return t
end

-- Sieve of Eratosthenes
-- returns : an array of primes below a given number n
return function (n)
  local limit = math.floor(math.sqrt(n))
  local primes = array(n)
  for i = 2, limit do
    if primes[i] then
      local j, k = 0, 0
      while j <= n do
        j = i * i + k * i
        k = k + 1
        primes[j] = false
      end
    end
  end
  primes = truthy(primes)
  table.remove(primes, 1)
  table.remove(primes, 1)
  return primes
end
