-- Shell sort algorithm
-- See: http://en.wikipedia.org/wiki/Shellsort

-- list: a list to be sorted, in-place
-- comp: (optional) a comparison function
--  defaults to function(a, b) return a < b end
-- returns: the passed-in list, sorted
return function (list, comp)
	comp = comp or function(a, b) return a < b end
	local n = #list
	for gap = 1, n do
		for i = gap, n do
			local tmp = list[i]
			local j = i
			while j > gap and comp(tmp, list[j-gap]) do
				list[j] = list[j-gap]
				j = j - gap
			end
			list[j] = tmp
		end
	end
	return list
end
