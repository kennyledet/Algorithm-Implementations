-- Algorithm to convert A Decimal to A Fraction
-- Original paper, written by J. Kennedy, available at:
-- https://sites.google.com/site/johnkennedyshome/home/downloadable-papers/dec2frac.pdf

-- Returns the integer part of a given decimal number
local function int(arg) return math.floor(arg) end

-- Returns a fraction that approximates a given decimal
-- decimal : a decimal to be converted to a fraction
-- acc     : approximation accuracy, defaults to 1e-8
-- returns : two integer values, the numerator and the denominator of the fraction
return function(decimal, acc)
  acc = acc or 1E-4
  local sign, num, denum
  local sign = (decimal < 0) and -1 or 1
  decimal = math.abs(decimal)
  
  if decimal == int(decimal) then --Handles integers
    num = decimal * sign
    denum = 1
    return num, denum
  end
  
  if decimal < 1E-19 then
    num = sign
    denum = 9999999999999999999
  elseif decimal > 1E+19 then
    num = 9999999999999999999 * sign
    denum = 1
  end

  local z = decimal
  local predenum = 0
  local sc
  denum = 1

  repeat
    z = 1 / (z - int(z))
    sc = denum
    denum = denum * int(z) + predenum
    predenum = sc
    num = int(decimal * denum)
  until ((math.abs(decimal - (num / denum)) < acc) or (z == int(z)))

  num = sign * num
  return num, denum
end
