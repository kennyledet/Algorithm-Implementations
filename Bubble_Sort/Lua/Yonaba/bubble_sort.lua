-- (Optimized) Bubble sort implementation
-- See: http://en.wikipedia.org/wiki/Bubble_sort

-- list: a list to be sorted
-- comp : (Optional) a comparison function
--  defaults to function(a,b) return a < b end
return function (list, comp)
	comp = comp or function(a,b) return a < b end
	local n = #list
  if n <= 1 then return list end
	repeat
		local newn = 0
		for i = 2, n do
			if not comp(list[i-1], list[i]) then
				list[i-1], list[i] = list[i], list[i-1]
				newn = i
			end
		end
		n = newn
	until n == 0
	return list
end