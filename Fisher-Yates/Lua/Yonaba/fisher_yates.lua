-- Fisher-Yates (modern algorithm) implementation
-- See : http://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle#The_modern_algorithm

-- list : a list to be shuffled, in-place
-- returns : the passed-in list, shuffled
-- Note: since shuffling is based on Lua's math.random(),
-- it is advised to call math.randomseed before.
return function (list)
	for i = #list, 1, -1 do
		local j = math.random(i)
		list[i], list[j] = list[j], list[i]
	end
	return list
end