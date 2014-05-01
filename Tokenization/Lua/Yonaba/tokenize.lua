-- A simple tokenizer implementation
-- See : http://en.wikipedia.org/wiki/Tokenization

return function(str, delimiter)
  local tokens = {}
  for token in str:gmatch('[^'..delimiter..']+') do tokens[#tokens + 1] = token end
  return tokens
end
