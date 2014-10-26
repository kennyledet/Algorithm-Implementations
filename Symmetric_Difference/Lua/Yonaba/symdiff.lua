-- Symmetric difference implementation
-- See: http://en.wikipedia.org/wiki/Symmetric_difference

-- Returns a copy of a given array t where keys and values were swapped
local function swapKeysAndValues(t)
  local _t = {}
  for k,v in pairs(t) do _t[v] = k end
  return _t
end

-- Returns the symmetric difference of two sets  (i.e, all
-- the elements which are either in first set or the second
-- set, but not in both)
-- s1 : a first set
-- s2 : a second set
-- returns : an array of values from the given sets
local function symmdiff(s1, s2)
  local t1 = swapKeysAndValues(s1)
  local t2 = swapKeysAndValues(s2)
  local r = {}
  
  for _, v in pairs(s1) do
    if not t2[v] then table.insert(r, v) end
  end
  
  for _, v in pairs(s2) do
    if not t1[v] then table.insert(r, v) end
  end  
  
  return r
end

return symmdiff