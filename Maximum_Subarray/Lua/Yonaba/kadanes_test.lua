-- Tests for kadanes.lua
local max_subarray = require 'kadanes'

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


run('Sorted array', function()
  local max, i, j = max_subarray {1, 2, 3, 4, 5}
	assert( max == 15 and i == 1 and j == 5)

  local max, i, j = max_subarray {-1, -2, -3, -4, -5}
	assert( max == -1 and i == 1 and j == 1)

  local max, i, j = max_subarray {-2, 1, -3, 4, -1, 2, 1, -5, 4}
	assert( max == 6 and i == 4 and j == 7)
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
	:format(total, pass, total-pass, (pass*100/total)))
