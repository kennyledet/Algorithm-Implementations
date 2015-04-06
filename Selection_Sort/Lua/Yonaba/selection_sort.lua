-- Selection sort algorithm
-- See: http://en.wikipedia.org/wiki/Selection_sort

-- list: a list to be sorted, in-place
-- comp: (optional) a comparison function
--  defaults to function(a, b) return a < b end
-- returns: the passed-in list, sorted
return function(list, comp)
	comp = comp or function(a, b) return a < b end
	local n = #list
	for i = 1, n do
		local iMin = i
		for j = iMin+1, n do
			if not comp(list[iMin],list[j]) then
				iMin = j
			end
		end
		if iMin~=i then
			list[i], list[iMin] = list[iMin], list[i]
		end
	end
	return list
end
