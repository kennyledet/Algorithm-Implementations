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

return {
  recursive = josephus_recursive,
  loop = josephus_loop,
}
