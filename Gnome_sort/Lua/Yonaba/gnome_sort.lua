-- Gnome sort implementation
-- See: http://en.wikipedia.org/wiki/Gnome_sort

-- array   : an array to be sorted, in-place
-- comp    : (Optional) a comparison function
--  defaults to function(a,b) return a < b end
-- returns : the passed-in array, sorted
return function (array, comp)
  comp = comp or function(a,b) return a < b end
  local n = #array
  local pos = 2
  while pos <= n do
    if comp(array[pos-1], array[pos]) then
      pos = pos + 1
    else
      array[pos-1], array[pos] = array[pos], array[pos-1]
      if pos > 2 then pos = pos - 1 end
    end
  end
  return array
end
