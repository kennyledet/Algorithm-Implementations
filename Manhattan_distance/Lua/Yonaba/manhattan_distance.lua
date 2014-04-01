-- Manhattan distance distance implementation
-- See: http://xlinux.nist.gov/dads//HTML/manhattanDistance.html
-- See: http://en.wikipedia.org/wiki/Manhattan_distance

-- Returns the Manhattan distance between two vectors
-- p       : a first vector
-- q       : a second vector
-- returns : the distance between p and q
local function manhattan_distance(p, q)
  assert(#p == #q, 'vectors must have the same length')
  local s = 0
  for i in ipairs(p) do
    s = s + math.abs(p[i] - q[i])
  end
  return s
end

return manhattan_distance
