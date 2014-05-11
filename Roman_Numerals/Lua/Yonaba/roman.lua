-- Roman numerals encoding/decoding implementation
-- See: http://en.wikipedia.org/wiki/Roman_numerals

-- Roman numerals translation set
local romans = {
  {1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"},
  {100,  "C"}, {90,  "XC"}, {50,  "L"}, {40,  "XL"},
  {10,   "X"}, {9,   "IX"}, {5,   "V"}, {4,   "IV"},
  {1, "I"}
}

-- Converts a number in decimal notation to Roman notation
-- n : a number in decimal notation
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
