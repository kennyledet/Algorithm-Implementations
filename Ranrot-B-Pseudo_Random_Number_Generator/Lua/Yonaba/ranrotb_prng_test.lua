-- Tests for ranrotb_prng.lua
local ranrotb_prng = require 'ranrotb_prng'

-- Custom string splitting function 
-- Taken from: https://github.com/Yonaba/Allen/blob/master/allen.lua#L279
local function string_split(str,n)
  n = n or 1
  if not (#str > 0) then return nil end
  local _chopped = {}
    for w in str:gmatch(('.'):rep(n)) do table.insert(_chopped,w) end
  local s,e
  if _chopped and (#_chopped > 0) then
    s,e = str:find(_chopped[#_chopped])
    if e then
    local _end = str:sub(e+1)
      if _end~='' then table.insert(_chopped,_end) end
    end
  elseif #str<=n then _chopped = {str}
  end
  return _chopped
end

-- Generates n random numbers between 0 and max
local function gen(n, max)
	local prng = ranrotb_prng()
	local t = {}
	for i = 1, n do t[#t+1] = (prng() % max) end
	return t
end

local cat = table.concat
local linemax, n, max, sep  = 80, 1000, 10, ' '
print(('Generating %d random values between 0 and %d'):format(n, max))
print(('-'):rep(80))
print(cat(string_split(cat(gen(n, max),sep), linemax), '\n'))
print(('-'):rep(80))
