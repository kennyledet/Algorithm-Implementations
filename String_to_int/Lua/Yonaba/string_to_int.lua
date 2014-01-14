-- Converts a string to an integer
--  without using any standard library function

-- Returns (base ^ exp)
local function power(base, exp)
  if exp <= 0 or not exp then return 1 end
  local pow = base
  for i = 1, exp-1 do pow = pow * base end
  return pow
end

-- str    : a string to be converted to an int
-- returns: an integer if the conversion is possible
--   otherwise, it errs
return function(str)
  local len = #str
  local exp, num = len , 0
  assert(not str:match('[^%d]'), 'Not an integer')
  for digit in str:gmatch('.') do
    exp = exp - 1
    num = num + (digit) * power(10, exp)
  end
  return num
end
