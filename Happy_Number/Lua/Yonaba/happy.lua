-- Happy Number implementation
-- See: http://en.wikipedia.org/wiki/Happy_number

-- Utility function
-- Returns the sums of squares of the digits of a number n
local function sumsq(n)
	local ssq = 0
	for d in tostring(n):gmatch('%d') do
		local num_d = tonumber(d)
		ssq = ssq + num_d * num_d
	end
	return ssq
end

-- Checks if the given number is a happy number
-- n   : a number
-- returns : true if n is a happy number, false otherwise
return function(n)
	while n > 9 do
		n = sumsq(n)
	end
	return n==1
end
