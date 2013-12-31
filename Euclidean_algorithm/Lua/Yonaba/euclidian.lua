-- Checks if a is an integer value
local function isInt(a)
	return math.floor(a) == a
end

-- Performs checks and provides early exit
-- a, b must be positive integers
-- handles GCD(a,0) = a, GCD(0,b) = b
-- GCD(0,0) do not exist
-- See: http://en.wikipedia.org/wiki/Binary_GCD_algorithm#Algorithm
local function checkArgs(a, b)
	assert(a >= 0 and b >= 0,     'numbers must be all positive')
	assert(isInt(a) and isInt(b), 'numbers must be integers')
	assert(not (a==0 and b ==0),  'no GCD(0,0)!')
	if a*b == 0 then
		return a==0 and b or a
	end
end

-- GCD, by successive integer divisions
local function gcd_division(a, b)
	local quick_gcd = checkArgs(a, b)
	if quick_gcd then return quick_gcd end
	repeat
	a, b = b, a % b
	until (b == 0)
	return a
end

-- GCD, by successive substractions
local function gcd_substraction(a, b)
	local quick_gcd = checkArgs(a, b)
	if quick_gcd then return quick_gcd end
	while a ~= b do
		if a > b then
			a = a - b
		else
			b = b - a
		end
	end
	return a
end

-- GCD, by recursion
local function gcd_recursive(a, b)
	local quick_gcd = checkArgs(a, b)
	if quick_gcd then return quick_gcd end
	if (b == 0) then
		return a
	else
		return gcd_recursive(b, a % b)
	end
end

return {
	division     = gcd_division,
	substraction = gcd_substraction,
	recursive    = gcd_recursive
}
