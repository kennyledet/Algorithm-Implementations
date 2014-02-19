-- Move-To-Front Transform implementation
-- See : http://en.wikipedia.org/wiki/Move-to-front_transform

-- Finds and returns the index of a value in a table
local function table_find(t, v)
  for k,_v in ipairs(t) do
    if _v == v then return k end
  end
end

-- Moves the value at index to a new index
local function table_move(t, i, newi)
  local v = t[i]
  table.remove(t, i)
  table.insert(t, newi, v)
end

-- Creates a ASCII based dictionnary
local function createDict()
  local mtf = {}
  for i=1,255 do mtf[i]=string.char(i) end
  return mtf
end

-- Encodes an string
-- @str    : a string to be encoded
-- @return : the mtf transform as a string of numbers
--           separated with dots.
local function mtf_encode(str)
  local dict = createDict()
  local encoded_str = ''
  for char in str:gmatch('.') do
    local index = table_find(dict, char)
    assert(index, ('Unknown char %s'):format(char))
    encoded_str = encoded_str .. index ..'.'
    table_move(dict, index, 1)
  end
  return (encoded_str:gsub('%.$',''))
end

-- Decodes an mtf transform
-- @str    : an mtf transform string to be decoded
-- @return : the decoded string
local function mtf_decode(str)
  local dict = createDict()
  local decoded_str = ''
  for value in str:gmatch('%.*(%d+)%.*') do
    local index = tonumber(value)
    assert(index and dict[index], 'Error decoding string')
    decoded_str = decoded_str .. dict[index]
    table_move(dict, index, 1)
  end
  return decoded_str
end

return {
  encode = mtf_encode,
  decode = mtf_decode,
}
