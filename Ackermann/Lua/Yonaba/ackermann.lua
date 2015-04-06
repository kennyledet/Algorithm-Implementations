-- Computes values of Ackermann function
-- See: http://en.wikipedia.org/wiki/Ackermann_function

-- m : a nonnegative integer
-- n : a nonnegative integer
-- return : the value of Ackermann(m, n)
local function ackermann(m, n)
  if m == 0 then return n + 1 end
  if n == 0 then return ackermann(m-1,1) end
  return ackermann(m-1, ackermann(m, n-1))
end

return ackermann