-- Radix sort algorithm
-- See: http://en.wikipedia.org/wiki/Radix_sort
-- Inspired from : http://stackoverflow.com/questions/7757063/radix-sort-not-working-in-lua

-- Applies transformation function on a list
local function apply(list, f)
	local t = {}
	for k,v in ipairs(list) do t[k] = f(v) end
	return t
end

-- Gets the max value of a list
local function max(list)
	local m = list[1]
	for i = 2,#list do
		if list[i] > m then m = list[i] end
	end
	return m
end

-- Makes an array of n buckets
local function make_buckets(n)
	local t = {}
	for i = 1,n do t[i] = {} end
	return t
end

-- Custom top/bottom insertion function
local tinsert = table.insert
local function insert(t, v, top)
	local pos = top and 1 or #t+1
	tinsert(t, pos, v)
end

-- list: a list to be sorted
-- decreasing: (optional) a boolean, defaults to false.
-- Sorts the list in decreasing order if true.
return function (list, decreasing)
	if #list <= 1 then return {list[1]} end -- trivial case
	local current_pass = 0
	local max_value = max(list)
	local list_str = apply(list, tostring)

  while current_pass <= max_value do
		current_pass = current_pass + 1
		buckets = make_buckets(10)

    -- LSD radix sort
		for _, value in ipairs(list_str) do
			local bucket_index = (value:len() >= current_pass)
			   and value:sub(-current_pass, -current_pass) + 1
					or 1
			insert(buckets[bucket_index], value, decreasing)
		end

    -- Go through all buckets
		list_str = {}
		for _, bucket in ipairs(buckets) do
			for i, v in ipairs(bucket) do
				insert(list_str, v, decreasing)
			end
		end
	end

	return apply(list_str, tonumber)
end
