-- A custom array shuffle implementation
-- This is not part of the Bogosort algorithm
local function shuffle(list)
	local n = #list
  for i = 1, n do
		local j, k = math.random(1,n), math.random(1,n)
		list[j], list[k] = list[k], list[j]
  end
  return list
end

-- Checks if an array is sorted
local function is_sorted(array, comp)
  local array_len = #array
  if array_len <= 1 then return true end
  for i = 2, array_len do
    if not comp(array[i-1], array[i]) then
      return false
    end
  end
  return true
end

-- The Bogosort implementation:
-- tbl  : a given table to be sorted
-- comp : (Optional) a comparison function.
--   defaults to function(a,b) return a < b end
-- Note: It is advised to use math.randomseed(os.time())
-- before calling this function. Lua's math.random() is
-- naturally deterministic and since Bogosort is based on
-- random shuffling, this is necessary to avoid infinite loops
return function (tbl, comp)
  comp = comp or function(a, b) return a < b end
  while not is_sorted(tbl, comp) do
    shuffle(tbl)
  end
	return tbl
end
