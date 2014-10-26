-- Simple selection sort algorithm implementation
-- See: http://en.wikipedia.org/wiki/Selection_algorithm

-- Returns the k-smallest (or k-largest) element in a given array
--   while performing an in-place partial sort
-- list   : a given sequence of elements
-- k      : (optional) the k-element to be selected, defaults to 1.
-- comp   : (optional) a comparison function, 
--          defaults to function(a,b) return a<b end
-- return : the k-element of the list
return function(list, k, comp)
  k = k or 1
  comp = comp or function(a, b) return a < b end
  for i = 1, k do
    local minIndex = i
    local minValue = list[i]
    for j = i+1, #list do
      if comp(list[j], minValue) then
        minIndex = j
        minValue = list[j]
      end
    end
    list[i], list[minIndex] = list[minIndex], list[i]  
  end
  return list[k]
end