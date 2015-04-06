-- Stooge sort algorithm implementation
-- See: http://en.wikipedia.org/wiki/Stooge_sort

-- Performs a recursive Stooge sort
local function stooge_sort(list, comp, i, j)
  i, j = i or 1, j or #list 
  if not comp(list[i],list[j]) then
    list[i], list[j] = list[j], list[i]
  end
  if (j - i + 1) >= 3 then
    local t = math.floor((j - i + 1) / 3)
    stooge_sort(list, comp, i, j - t)
    stooge_sort(list, comp, i + t, j)
    stooge_sort(list, comp, i, j - t)
  end
  return list
end

-- Sorts the given list using Stooge sort algorithm
-- list    :  a sequence of elements to be sorted in-place
-- comp    : (optional) a comparison function, defaults to function(a,b) return a<b end
-- returns : the passed-in list, sorted
return function (list, comp)
  comp = comp or function(a,b) return a<b end
  return stooge_sort(list, comp)
end
