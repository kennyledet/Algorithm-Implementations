--[
local dict = {}
for i = 0, 255 do
	--print(i,string.char(i))
	dict[string.char(i)] = i
end

local function lzw(s)
	local w = ''
	local i = 255
	for c in s:gmatch('.') do
		if dict[w..c] then w = w..c
		else
			dict[w..c] = i + 1
			w = c
			i = i + 1
		end
	end
	--print(w)
	--table.foreach(dict, function(k,v)
		--if v > 255 then print(k,v) end
	--end)
	return w
end

print(lzw('TOBEORNOTTOBEORTOBEORNOT'))
--]]

