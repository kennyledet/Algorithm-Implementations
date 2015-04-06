-- (In-place) Quicksort implementation
-- See : http://en.wikipedia.org/wiki/Quicksort#In-place_version

-- Partitions a portion of a list
local function partition(list, comp, left, right, pivot_index)
	local pivot_value = list[pivot_index]
	list[pivot_index], list[right] = list[right], list[pivot_index]
	local store_index = left
	for i = left, right-1 do
		if comp(list[i], pivot_value) then
			list[i], list[store_index] = list[store_index], list[i]
			store_index = store_index + 1
		end
	end
	list[store_index], list[right] = list[right], list[store_index]
	return store_index
end

-- Performs in-place Quicksort
local function quicksort(list, comp, left, right)
	left, right = left or 1, right or #list
	if left < right then
		local pivot_index = math.random(left, right)
		local new_pivot_index = partition(list, comp, left, right, pivot_index)
		quicksort(list, comp, left, new_pivot_index - 1)
		quicksort(list, comp, new_pivot_index + 1, right)
	end
	return list
end

-- Quicksort function wrapper, to shadow access 
-- to left and right bounds
-- list: a list to be ordered, in-place
-- comp: (optional) a comparison function
--  defaults to function(a, b) return a < b end
-- returns: the passed-in list, sorted
return function (list, comp)
	comp = comp or function(a, b) return a < b end
	return quicksort(list, comp)
end