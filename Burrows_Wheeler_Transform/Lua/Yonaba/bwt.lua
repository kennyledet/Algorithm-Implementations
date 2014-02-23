-- Burrows-Wheeler Transform algorithm implementation
-- See: http://en.wikipedia.org/wiki/Burrows%E2%80%93Wheeler_transform#Sample_implementation

-- Returns the Burrows-Wheeler transform of an input string
-- @str    : the original string to be encoded
-- returns : the transform
-- returns : an index to be used for decoding
local function burrows_wheeler_transform(str)
  -- Builds a table of all possible rotations
  local t = {str}
  local len = #str

  for i = len-1, 1, -1 do
    table.insert(t, str:sub(i + 1, len) .. str:sub(1, i))
  end

  -- Sorts all rotations in alphabetical order
  table.sort(t)

  -- Retrieves the last column and the word index
  local encoded_str, pos = ''
  for k, rotation in ipairs(t) do
    if rotation == str then pos = k end
    encoded_str = encoded_str .. rotation:sub(#rotation, #rotation)
  end

  return encoded_str, pos
end


-- Decodes a Burrows-Wheeler transform
-- @transform : the transform to be decoded
-- @pos       : an index to identify the original string
-- returns    : the decoded transform
local function burrows_wheeler_decode(transform, pos)
  local len = #transform
  
  -- Builds the table of permutations
  local t = {}
  for k = 1, len do
    for i = 1, len do
      local char = transform:sub(i, i)
      t[i] = not t[i] and char or char .. t[i]
    end
    table.sort(t)
  end

  -- Return the line ending with the EOL marker
  return t[pos]
end

return {
  encode = burrows_wheeler_transform,
  decode = burrows_wheeler_decode,
}
