-- Josephus problem implementation
-- See: http://en.wikipedia.org/wiki/Josephus_problem

-- Returns the survivor
-- n       : the initial number of people
-- k       : the count for each step
-- returns : the survivor's number
local function josephus_recursive(n, k)
  if n == 1 then return 1
  else
    return ((josephus_recursive(n-1,k)+k-1)%n)+1
  end
end

-- Returns the survivor
-- n       : the initial number of people
-- k       : the count for each step
-- returns : the survivor's number
local function josephus_loop(n, k)
  local r, i = 0, 1
  while i <= n do
    r = (r + k) % i
    i = i + 1
  end
  return r + 1
end

-- Private wrapper
local function j(n, k, s)
  if n == 1 then return 1 end
  local new_s = ((s or 1) + k - 2) % n + 1
  local survivor = j(n - 1, k, new_s)
  return survivor < new_s and survivor or survivor + 1
end

-- Returns the survivor
-- n       : the initial number of people
-- k       : the count for each step
-- returns : the survivor's number
local function josephus_elaborated(n, k)
  return j(n, k, 1)
end

-- Returns the survivor (assumes the count is k = 2)
-- n       : the initial number of people
-- returns : the survivor's number
local function josephus_2(n)
  return josephus_loop(n, 2)
end

-- Returns the survivor (assumes the count is k = 2)
-- Alternate implementation using logarithm.
-- n       : the initial number of people
-- returns : the survivor's number
local function josephus_log_2(n)
  return 2*(n - 2 ^ math.floor(math.log(n, 2)))+1
end

return {
  recursive    = josephus_recursive,
  loop         = josephus_loop,
  elaborated   = josephus_elaborated, 
  standard     = josephus_2,
  standard_log = josephus_log_2,
}
