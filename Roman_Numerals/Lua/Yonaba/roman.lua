-- Roman numerals encoding/decoding implementation
-- See: http://en.wikipedia.org/wiki/Roman_numerals

-- Roman numerals translation set for encoding
local romans = {
  {1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"},
  {100,  "C"}, {90,  "XC"}, {50,  "L"}, {40,  "XL"},
  {10,   "X"}, {9,   "IX"}, {5,   "V"}, {4,   "IV"},
  {1, "I"}
}

-- Decimals set for decoding
local decimals = {}
for i, t in pairs(romans) do
  if tostring(t[1]):match('^[15]') then
    decimals[t[2]] = t[1]
  end
end

-- Converts a number in decimal notation to Roman notation
-- n       : a number in decimal notation
-- returns : the Roman representation of n as a string
local function roman_encode(n)
  local r = ''
  for _, t in ipairs(romans) do
    local decimal, roman = t[1], t[2]
    while n >= decimal do
      r = r .. roman
      n = n - decimal
    end
  end
  return r
end

-- Converts a number in Roman notation to decimal notation
-- r       : a number in Roman notation (as a string)
-- returns : the decimal representation
local function roman_decode(r)
  local i, n = 1, 0
  while i < #r do
    local d1, d2 = decimals[r:sub(i,i)], decimals[r:sub(i+1,i+1)]
    if d1 < d2 then
      n = n + (d2-d1)
      i = i + 2
    else
      n = n + d1
      i = i + 1
    end        
  end 
  if i <= #r then n = n + decimals[r:sub(i,i)] end
  return n   
end

return {
  encode = roman_encode,
  decode = roman_decode,
}