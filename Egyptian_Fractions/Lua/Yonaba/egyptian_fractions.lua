-- Egyptian fractions algorithm implementation
-- See : http://www.maths.surrey.ac.uk/hosted-sites/R.Knott/Fractions/egyptian.html

-- Returns a representation of a fraction
local function fraction(num, denum)
  return {num = num, denum = denum}
end

-- Returns the egyptian fraction (sum of unit fractions)
--  of a given fraction
-- @num   : the given fraction numerator
-- @denum : the given fraction denominator
-- returns: an array of fractions.
--  Each fraction is represented as {num=<value>, denum=<value>}
local function egypt(num, denum)
  local x, y = num, denum
  if x == 0 then return {} end
  local denum = math.floor(math.ceil(y / x))
  local remx, remy = -y % x, y * denum
  local rems = egypt(remx, remy)
  table.insert(rems, 1, {num = 1, denum = denum})
  return rems
end

return egypt
