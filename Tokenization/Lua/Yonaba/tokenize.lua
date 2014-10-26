-- A simple tokenizer implementation
-- See : http://en.wikipedia.org/wiki/Tokenization

-- Returns the tokens from a given stream of characters
-- str       : a string
-- delimiter : the character used as a delimiter for tokens
-- returns   : an array of tokens
return function(str, delimiter)
  local tokens = {}
  for token in str:gmatch('[^'..delimiter..']+') do tokens[#tokens + 1] = token end
  return tokens
end
