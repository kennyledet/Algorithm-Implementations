--Burrows-Wheeler Transform

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


function decode(encword)
  --print('decode',encword)
  local size = string.len(encword)
  local offset = tonumber(string.sub(encword,1,1))
  local encword = string.sub(encword,2,size)

  local t={}
	for n=0,string.len(encword),1 do
		for i=1,string.len(encword),1 do
      t[i] = not t[i] and '' or string.sub(encword,i,i)..t[i]
		end
		table.sort(t)
	end
	
  return (t[offset])
end

--Sample Test
local str = "SIX.MIXED.PIXIES.SIFT.SIXTY.PIXIE.DUST.BOXES"
local out = ''
	--for w in string.gfind(str, "%w+") do
	local enc = encode(str)
	local dec = decode(enc)
	out = out .. '.'..enc
	print("\nChaine originale: "..str)
	print("Transformée B-W: "..enc)
	print("Transformée Décodée: "..dec)
	--end
print(out)
