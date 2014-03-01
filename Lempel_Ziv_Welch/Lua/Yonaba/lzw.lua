-- Lempel-Ziv Welch compression data algorithm implementation
-- See : http://en.wikipedia.org/wiki/LZW

local function lzw_encode(str)
  local w = ''
  local result = {}
  local dict_size = 255

  -- Builds the dictionnary
  local dict = {}
  for i = 0, dict_size do
    dict[string.char(i)] = i
  end

  local i = dict_size

  for char in str:gmatch('.') do
    -- Finds the longest string matching the input
    local wc = w .. char
    if dict[wc] then
      -- Save the current match index
      w = wc
    else
      -- Add the match to the dictionary
      table.insert(result, dict[w])
      i = i + 1
      dict[wc] = i
      w = char
    end
  end
  if w~='' then
    table.insert(result, dict[w])
  end
  return result
end

local function lzw_decode(str)
  local dict_size = 255

  -- Builds the dictionary
  local dict = {}
  for i = 0, dict_size do
    dict[i] = string.char(i)
  end

  local w = string.char(str[1])
  local result = w
  for i = 2, #str do
    local k = str[i]
    local entry = ''
    if dict[k] then
      entry = dict[k]
    elseif k == dict_size then
      entry = w .. w:sub(1,1)
    else
      return nil -- No match found, decoding error
    end
    result = result .. entry
    dict_size = dict_size + 1
    dict[dict_size] = w .. entry:sub(1,1)
    w = entry
  end
  return result
end

return {
  encode = lzw_encode,
  decode = lzw_decode,
}

