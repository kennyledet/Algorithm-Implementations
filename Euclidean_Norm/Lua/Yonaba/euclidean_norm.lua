-- Euclidean norm implementation
-- See: http://en.wikipedia.org/wiki/Norm_%28mathematics%29#Euclidean_norm

-- Returns the Euclidean norm of a given vector
-- t      : a vector (implemented as a sequence or numbers)
-- return : the Euclidean norm
local function euclidian_norm(t)
  local norm = 0
  for _, v in ipairs(t) do
    norm = norm + (v * v)
  end
  return math.sqrt(norm)
end

return euclidian_norm