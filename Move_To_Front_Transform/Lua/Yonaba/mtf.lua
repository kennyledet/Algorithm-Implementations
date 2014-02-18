--MTF Algorithm

--Creates Dictionnary
local mtf = {}
for i=1,255 do
	mtf[i]=string.char(i)
end
print(mtf)

local function MTF(index)
	local value = mtf[index]
	local tmpMTF = {value}
	for k in ipairs(mtf) do
		if mtf[k]~=mtf[index] then table.insert(tmpMTF,mtf[k]) end
	end
end

local function getCharMTFIndex(char)
	local i = 1
	for k in ipairs(mtf) do
		if mtf[k]==char then return k end
	end
	return nil
end


local function getMTFSeq(seq)
	local i = string.len(seq)
	local tseq = {}
	local it,current_char,curIndex = 1
	repeat
		current_char = string.sub(seq,it,it)
		curIndex = getCharMTFIndex(current_char)
		mtf = MTF(curIndex)
		table.insert(tseq,curIndex)
		it=it+1
	until not current_char or not curIndex
	return tseq
end

--[[
print(string.byte("k"))
print(string.byte("l"))
print(string.byte("m"))
print(unpack(getMTFSeq('l')))
print(1,mtf[1])
--]]

local table_move = function(cur,to,t)
	local item = t[cur]
	table.remove(t,cur)
	table.insert(t,to,item)
end
t = {1,2,3}
table_move(1,3,t)
for i in ipairs(t) do print(i,t[i]) end
