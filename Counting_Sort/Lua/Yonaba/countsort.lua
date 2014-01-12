-- In place counting sort implementation
-- See : http://en.wikipedia.org/wiki/Counting_sort

-- Returns the maximum value of the given array
local function find_max_val(array)
  local m = array[1]
  for i = 2, #array do
    if array[i] > m then
      m = array[i]
    end
  end
  return m
end

-- Returns an array of len size, filled with default value
local function make_array(len, default)
  local t = {}
  for i = 0, len do t[i] = default end
  return t
end

-- In-place counting sort implementation
-- array: a given array, to be sorted in-place
-- returns: the passed-in array, sorted.
return function(array)
  local m = find_max_val(array) + 1
  local count = make_array(m, 0)
  for _,v in ipairs(array) do
    count[v] = count[v] + 1
  end
  local i = 1
  for j = 0, m do
    for c = 1, count[j] do
      array[i] = j
      i = i + 1
    end
  end
  return array
end
