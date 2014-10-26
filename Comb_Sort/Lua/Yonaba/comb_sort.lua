-- Comb sort algorithm implementation
-- See: http://en.wikipedia.org/wiki/Comb_sort

-- Performs a Comb sort, in-place
-- list: a list of elements to be sorted, in-place
-- comp : (optional) a comparison function, defaults to function (a,b) return a<b end
-- returns : the passed-in list, sorted in-place
return function (list, comp)
  comp = comp or function(a,b) return a<b end
  local gap = #list
  repeat
    gap = math.max(1, math.floor(gap/1.25))
    local i, swaps = 1, 0
    repeat
      if comp(list[i+gap], list[i]) and list[i]~=list[i+gap] then
        list[i], list[i+gap] = list[i+gap], list[i]
        swaps = 1
      end
      i = i+1
    until i+gap > #list
  until gap == 1 and swaps == 0
  return list
end