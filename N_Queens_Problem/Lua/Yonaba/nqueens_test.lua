-- Tests for nqueens.lua
local nqueens = require 'nqueens'

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

-- Compares two grids
local function same(t1, t2)
  for k, row in ipairs(t1) do
    for line, v in ipairs(row) do
      if v ~= t2[k][line] then return false end
    end
  end
  return true
end
 
-- A 8-Queens solution
local queens8 = {
  {true, false, false, false, false, false, false, false},
  {false, false, false, false, true, false, false, false},
  {false, false, false, false, false, false, false, true},
  {false, false, false, false, false, true, false, false},
  {false, false, true, false, false, false, false, false},
  {false, false, false, false, false, false, true, false},
  {false, true, false, false, false, false, false, false},
  {false, false, false, true, false, false, false, false},
}

run('NQueens test', function()
  assert(same(nqueens(8), queens8))
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
