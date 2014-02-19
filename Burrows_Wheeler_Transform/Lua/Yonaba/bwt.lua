--Burrows-Wheeler Transform

function encode(word)
local t={word}
local pos = 1

local cat = string.len(word)
	for i=cat-1,1,-1 do
	local tmp = string.sub(word,1,i)
	local comp = string.sub(word,i+1,cat)
	local str = comp..tmp

	table.insert(t,str)
	end
table.sort(t)

local retStr = ""
	for k in ipairs(t) do
		if t[k]==word then pos = k end
		retStr = retStr..string.sub(t[k],string.len(t[k]),string.len(t[k]))
	end

return retStr
end
