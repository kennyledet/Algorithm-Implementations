-- Insertion sort algorithm
-- See: http://en.wikipedia.org/wiki/Insertion_sort#Algorithm

-- list: a list to be sorted, in-place
-- comp: (optional) a comparison function
--  defaults to function(a, b) return a < b end
-- returns: the passed-in list, sorted
return function (list, comp)
	comp = comp or function(a, b) return a < b end
	local n = #list
	for i = 2, n do
		local x = list[i]
		local j = i
		while j>1 and not comp(list[j-1],x) do
			list[j] = list[j-1]
			j = j - 1
		end
		list[j] = x
	end
	return list
end