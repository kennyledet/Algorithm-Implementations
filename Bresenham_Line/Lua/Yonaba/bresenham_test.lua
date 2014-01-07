-- Tests for bresenham.lua
local bresenham = require 'bresenham'

local total, pass = 0, 0

local function dec(str, len)
	return #str < len
	   and str .. (('.'):rep(len-#str))
		  or str:sub(1,len)
end

local function run(message, f)
	total = total + 1
	local ok, err = pcall(f)
	if ok then pass = pass + 1 end
	local status = ok and 'PASSED' or 'FAILED'
	print(('%02d. %68s: %s'):format(total, dec(message,68), status))
end

-- Checks if t1 and t2 arrays are the same
local function same(t1, t2)
	for k,v in ipairs(t1) do
		if t2[k].x ~= v.x or t2[k].y ~= v.y then 
      return false
    end
	end
	return true
end

run('Testing Bresenham line marching', function()
	local expected = {{x = 1, y = 1}, {x = 2, y = 2}, {x = 3, y = 3}, {x = 4, y = 4}, {x = 5, y = 5}}
  assert(same(bresenham(1, 1, 5, 5), expected))
	local expected = {{x = 1, y = 1}, {x = 2, y = 2}, {x = 2, y = 3}, {x = 3, y = 4}} 
  assert(same(bresenham(1, 1, 3, 4), expected))
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
	:format(total, pass, total-pass, (pass*100/total)))
