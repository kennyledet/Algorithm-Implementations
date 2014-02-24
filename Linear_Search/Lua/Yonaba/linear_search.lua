-- Linear search algorithm implementation
-- See: http://en.wikipedia.org/wiki/Linear_search

-- Recursive search helper
local function recurse_search(t, v, i, s)
  if t[i] == nil then return nil end
  if t[i] == v then return i end
  return recurse_search(t, v, i + s, s)
end

-- Performs a search by incrementing upward a search index
-- list    : the list where to search
-- item    : the value to be searched
-- returns : the value index hen found, nil otherwise.
local function forward_iteration(list, item)
  for i, value in ipairs(list) do
    if item == value then return i end
  end
end

-- Performs a recursive search by incrementing upward a search index
-- list    : the list where to search
-- item    : the value to be searched
-- returns : the value index hen found, nil otherwise.
local function recursive_search(list, item)
  return recurse_search(list, item, 1, 1)
end

-- Performs a search by incrementing downward a search index
-- list    : the list where to search
-- item    : the value to be searched
-- returns : the value index hen found, nil otherwise.
local function backward_iteration(list, item)
  for i = #list, 1, -1 do
    local value = list[i]
    if item == value then return i end
  end
end

-- Performs a recursive search by incrementing downward a search index
-- list    : the list where to search
-- item    : the value to be searched
-- returns : the value index hen found, nil otherwise.
local function reverse_recursive_search(list, item)
  return recurse_search(list, item, #list, -1)
end

return {
  forward = forward_iteration,
  backward = backward_iteration,
  recursive = recursive_search,
  backward_recursive = reverse_recursive_search,
}
