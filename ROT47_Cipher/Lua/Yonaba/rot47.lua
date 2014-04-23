-- ROT47 ciphering algorithm implementation
-- See: http://en.wikipedia.org/wiki/ROT13#Variants

-- Up-values to be used by the algorithm
local base = 33
local range = 126 - 33 + 1

-- Checks if the given char is convertible
-- ASCII Code should be within the range [33 .. 126]
local function rot47_convertible(char) 
  local v = char:byte()
  return v >= 33 and v <= 126 
end

-- Ciphering algorithm
local function cipher(str, key)
  return (str:gsub('.', function(s)
  if not rot47_convertible(s) then return s end
    return string.char(((s:byte() - base + key) % range) + base)
  end))
end

-- str     : a string to be ciphered
-- returns : the ciphered string
local function rot47_cipher(str) return cipher(str, 47)  end

-- str     : a string to be deciphered
-- returns : the deciphered string
local function rot47_decipher(str) return cipher(str, -47)  end

return {
  cipher   = rot47_cipher,
  decipher = rot47_decipher,
}