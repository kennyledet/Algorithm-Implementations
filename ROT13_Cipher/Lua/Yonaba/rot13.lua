-- ROT13 ciphering algorithm implementation
-- See: http://en.wikipedia.org/wiki/ROT13

-- Returns the ASCII bytecode of either 'a' or 'A'
local function ascii_base(s)
  return s:lower() == s and ('a'):byte() or ('A'):byte()
end

-- ROT13 is based on Caesar ciphering algorithm, using 13 as a key
local function caesar_cipher(str, key)
  return (str:gsub('%a', function(s)
    local base = ascii_base(s)
    return string.char(((s:byte() - base + key) % 26) + base)
  end))
end

-- str     : a string to be ciphered
-- returns : the ciphered string
local function rot13_cipher(str)
  return caesar_cipher(str, 13)
end

-- str     : a string to be deciphered
-- returns : the deciphered string
local function rot13_decipher(str) 
  return caesar_cipher(str, -13) 
end

return {
  cipher   = rot13_cipher,
  decipher = rot13_decipher,
}