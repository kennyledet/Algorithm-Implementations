--Opens Input file, Retrieves its Size

local file = io.open("test.txt","rb")
local Ssize = file:seek("end")
file:seek("set",0)

--RLEncodes a single string
function encode(std,flag)
--Compresses data
local rle = ''
local flag = flag
local i = 1
repeat
	local char = string.sub(std,i,i)
	local stradd
	local count=1
		while string.sub(std,i+count,i+count) == char do
		count=count+1
		end
		if count == 1 then
			if char ~= flag then stradd = flag..char else stradd = string.rep(flag,2) end
		elseif count > 1 and count <= 9 then stradd = count..flag..char
		elseif count > 9 then
			local length = count
			stradd=''
			while length > 9 do
			stradd=stradd..'9'..flag..char
			length = length-9
			end
			if length > 1 and length <=9 then stradd=stradd..length..flag..char
			else
				if char ~= flag then stradd = flag..char else stradd=string.rep(flag,2) end
			end
		end
	rle=rle..stradd
	i=i+count
until (i>string.len(std))
return rle
end




local comp = io.open("compresse.txt","wb")
local rle = ''

--Iterates All over the input file lines for RLEncoding
for line in file:lines() do
local std = line
rle = rle..encode(std,'@')..'\n'
end

--Closes input file
file:close()
--Writing output file, Retrieves its sizes and closes it.
comp:write(rle)
local Esize=comp:seek("end")
comp:close()


--Output RLE Encoding Results
--Run Lenght Encoding
print('*************Run-Length-Encoding Program"*******************')
print('Input File Size: '..Ssize..' bytes')
print('Output File Size: '..Esize..' bytes')
print('Compression Rate: '..string.format("%.2f",100*((Ssize-Esize)/Ssize))..'%')

