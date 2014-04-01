-- Minkowski Distance distance implementation
-- See: http://en.wikipedia.org/wiki/Minkowski_distance

-- Returns the Minkowski distance between two vectors
-- p       : a first vector
-- q       : a second vector
-- n       : the distance order
-- returns : the distance between p and q
local function minkowski_distance(p, q, n)
  assert(#p == #q, 'vectors must have the same length')
  local s = 0
  for i in ipairs(p) do
    s = s + math.abs(p[i] - q[i]) ^ n
  end
  return s ^ (1 / n)
end

return minkowski_distance
