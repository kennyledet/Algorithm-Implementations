-- Euclidean distance implementation
-- See: http://en.wikipedia.org/wiki/Euclidean_distance

-- Returns the Euclidean distance between two vectors
-- p       : a first vector
-- q       : a second vector
-- returns : the distance between p and q
local function euclidean_distance_procedural(p, q)
  assert(#p == #q, 'vectors must have the same length')
  local sum = 0
  for i in ipairs(p) do
    sum = sum + (p[i] - q[i]) ^ 2
  end
  return math.sqrt(sum)
end

return euclidean_distance_procedural