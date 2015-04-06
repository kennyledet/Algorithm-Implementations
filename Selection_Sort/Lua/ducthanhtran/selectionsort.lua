--[[
	Author: Duc Thanh Tran (ducthanhtran, Github)
	Algorithm: Selectionsort, basic version where minimum element is searched for,
               not stable version!
	Date: 12/31/2013
--]]

local function selectionsort(T)
	assert(type(T) == "table", "Argument is not a table")

	local length = #T

	for i = 1, length-1 do
		local minElem = i

		for j = i+1, length do
			if T[j] < T[minElem] then
				minElem = j
			end
		end

		T[i], T[minElem] = T[minElem], T[i]
	end
end

return selectionsort
