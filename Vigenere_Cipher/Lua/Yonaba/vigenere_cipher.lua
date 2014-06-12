-- Vigenere ciphering algorithm implementation
-- See: http://en.wikipedia.org/wiki/Vigen%C3%A8re_cipher

-- Returns the ASCII bytecode of either 'a' or 'A'
local function ascii_base(s)
  return s:lower() == s and ('a'):byte() or ('A'):byte()
end

-- str     : a string to be ciphered
-- key     : the ciphering key (a number)
-- returns : the ciphered string
local function vigenere_cipher(str, key)
  return (str:gsub('%a', function(s)
    local base = ascii_base(s)
    return string.char(((s:byte() - base + key) % 26) + base)
  end))
end

-- str     : a string to be deciphered
-- key     : the ciphering key (a number)
-- returns : the deciphered string
local function caesar_decipher(str, key) 
  return caesar_cipher(str, -key) 
end

return {
  cipher     = vigenere_cipher,
  decipher   = vigenere_decipher,
}