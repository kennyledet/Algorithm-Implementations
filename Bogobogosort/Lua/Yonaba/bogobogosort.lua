-- Bogobogosort description
-- See : http://www.dangermouse.net/esoteric/bogobogosort.html

-- A custom array shuffle implementation
-- This is not part of the Bogobogosort algorithm
local function shuffle(list, s, e)
	local n = #list
  for i = s + 1, e do
		local j, k = math.random(s, e), math.random(s, e)
		list[j], list[k] = list[k], list[j]
  end
  return list
end

-- Checks if an array is sorted
local function is_sorted(array, comp, s, e)
  for i = s + 1, e do
    if not comp(array[i-1], array[i]) then
      return false
    end
  end
  return true
end

-- Performs Bogosort between indices i and j
local function bogosort(t, comp, s, e)
  while not is_sorted(t, comp, s, e) do
    shuffle(t, s, e)
  end
	return t
end

-- The Bogobogosort implementation:
-- tbl  : a given table to be sorted
-- comp : (Optional) a comparison function.
--   defaults to function(a,b) return a < b end
-- Note: It is advised to use math.randomseed(os.time())
-- before calling this function. Lua's math.random() is
-- naturally deterministic and since Bogobogosort is based on
-- random shuffling, this is necessary to avoid infinite loops
-- See :
return function(tbl, comp)
  local array_len = #tbl
  comp = comp or function(a, b) return a < b end
  for bound = 2, array_len do
    bogosort(tbl, comp, 1, bound)
  end
  return tbl
end