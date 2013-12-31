--[[
	Author: Duc Thanh Tran (ducthanhtran, Github)
	Algorithm: Bubblesort, slightly optimized version
	Date: 12/31/2013
--]]

local function bubblesort(T)
	assert(type(T) == "table", "Argument is not a table")
	local length = #T
	local changed

	repeat
		changed = false
		length = length - 1

		for i = 1, length do
			if T[i] > T[i+1] then
				T[i], T[i+1] = T[i+1], T[i]
				changed = true
			end
		end
	until changed == false
end

return bubblesort
