-- Tests for levenshtein.lua
local lev_iter      = (require 'levenshtein').lev_iter
local lev_recursive = (require 'levenshtein').lev_recursive

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

run('Fails on running with no arg', function()
	assert(not pcall(lev_iter))
	assert(not pcall(lev_recursive))
end)

run('Fails if only one string is passed', function()
	assert(not pcall(     lev_iter, 'astring'))
	assert(not pcall(lev_recursive, 'astring'))
end)

run('Otherwise, returns the levenshtein distance', function()
	assert(lev_iter('Godfather', 'Godfather') == 0)
	assert(lev_iter('Godfather',  'Godfathe') == 1)
	assert(lev_iter('Godfather',  'odfather') == 1)
	assert(lev_iter('Godfather',    'Gdfthr') == 3)
	assert(lev_iter(    'seven',     'eight') == 5)

	assert(lev_recursive('Godfather', 'Godfather') == 0)
	assert(lev_recursive('Godfather',  'Godfathe') == 1)
	assert(lev_recursive('Godfather',  'odfather') == 1)
	assert(lev_recursive('Godfather',    'Gdfthr') == 3)
	assert(lev_recursive(    'seven',     'eight') == 5)
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
	:format(total, pass, total-pass, (pass*100/total)))
