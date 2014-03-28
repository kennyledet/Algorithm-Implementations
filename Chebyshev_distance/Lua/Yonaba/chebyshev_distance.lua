-- Chebyshev distance distance implementation
-- See: http://en.wikipedia.org/wiki/Chebyshev_distance

-- Returns the Chebyshev distance between two vectors
-- p       : a first vector
-- q       : a second vector
-- returns : the distance between p and q
local function chebyshev_distance(p, q)
  assert(#p == #q, 'vectors must have the same length')
  local d = 0
  for i in ipairs(p) do
    d = math.max(d, math.abs(p[i] - q[i]))
  end
  return d
end

return chebyshev_distance
