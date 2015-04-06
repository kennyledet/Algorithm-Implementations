-- Booyer-Moore-Horspool algorithm implementation
-- See : http://en.wikipedia.org/wiki/Boyer%E2%80%93Moore%E2%80%93Horspool_algorithm

-- Finds the first occurence of a needle in a haystack
-- haystack : a string where to search
-- needle   : a substring to be search
-- Returns : the position of needle in haystack if found, otherwise nil.
return function (haystack, needle)
	local n, m = #haystack, #needle
	if m > n then return end
	local bad_char_shift = {}
  
	for k = 0, 255 do bad_char_shift[k] = m end
	for k = 1, m-1 do bad_char_shift[needle:sub(k,k):byte()] = m - k end

	local k = m
	while k <= n do
		local i, j = k, m
		while j >= 1 and haystack:sub(i,i) == needle:sub(j,j) do
			i, j = i-1, j-1
		end
		if j == 0 then return i+1 end
		k = k + bad_char_shift[haystack:sub(k,k):byte()]
	end
  
	return nil
end