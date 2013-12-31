-- Bozosort description
-- See : http://en.wikipedia.org/wiki/Bogosort#Related_algorithms

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

-- The Bozosort implementation:
-- tbl  : a given table to be sorted
-- comp : (Optional) a comparison function.
--   defaults to function(a,b) return a < b end
-- Note: It is advised to use math.randomseed(os.time())
-- before calling this function. Lua's math.random() is
-- naturally deterministic and since Bozosort is based on
-- random swaps, this is necessary to ensure convergence
return function (tbl, comp)
  comp = comp or function(a, b) return a < b end
  local n = #tbl
  while not is_sorted(tbl, comp) do
    local i, j = math.random(n), math.random(n)
    tbl[i], tbl[j] = tbl[j], tbl[i]
  end
	return tbl
end