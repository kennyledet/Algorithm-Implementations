-- 10-Harshad Number implementation
-- See: http://en.wikipedia.org/wiki/Harshad_number

-- Utility function
-- Returns the sums of digits of a given number n
local function sumdigits(n)
  local s = 0
  for d in tostring(n):gmatch('%d') do
    local num_d = tonumber(d)
    s = s + num_d
  end
  return s
end

-- Checks if the given number is a Harshad number (in base 10)
-- n       : a number in decimal base
-- returns : true if n is a Harshad number, false otherwise
return function(n) return (n % sumdigits(n)) == 0 end
