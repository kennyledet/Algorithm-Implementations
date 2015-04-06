-- (Optimized) Cocktail sort implementation
-- See: http://en.wikipedia.org/wiki/Cocktail_sort


-- list: a list to be sorted (in-place)
-- comp : (Optional) a comparison function
--  defaults to function(a,b) return a < b end
return function (list, comp)
  comp = comp or function(a,b) return a < b end
  local begin, _end = 0, #list - 1

  repeat
    local swapped = false
    begin = begin + 1
    for i = begin, _end do
      if not comp(list[i], list[i+1]) then
        list[i], list[i+1] = list[i+1], list[i]
        swapped = true
      end
    end
    if not swapped then break end
    _end = _end - 1
    for i = _end, begin, -1 do
      if not comp(list[i], list[i+1]) then
        list[i], list[i+1] = list[i+1], list[i]
        swapped = true
      end
    end
  until not swapped
  return list
end

