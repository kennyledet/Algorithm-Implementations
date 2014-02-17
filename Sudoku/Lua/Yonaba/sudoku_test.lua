-- Tests for sudoku.lua
local sudoku_solve = require 'sudoku'

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
  if #t1 ~= #t2 then return false end
  for r, row in ipairs(t1) do
    for v, value in ipairs(row) do
      if t2[r][v] ~= value then return false end
    end
  end
  return true
end

run('An easy problem', function()
  local problem = {
    {3, 0, 6, 5, 0, 8, 4, 0, 0},
    {5, 2, 0, 0, 0, 0, 0, 0, 0},
    {0, 8, 7, 0, 0, 0, 0, 3, 1},
    {0, 0, 3, 0, 1, 0, 0, 8, 0},
    {9, 0, 0, 8, 6, 3, 0, 0, 5},
    {0, 5, 0, 0, 9, 0, 6, 0, 0},
    {1, 3, 0, 0, 0, 0, 2, 5, 0},
    {0, 0, 0, 0, 0, 0, 0, 7, 4},
    {0, 0, 5, 2, 0, 6, 3, 0, 0},
  }

  local solution = {
    {3, 1, 6, 5, 7, 8, 4, 9, 2},
    {5, 2, 9, 1, 3, 4, 7, 6, 8},
    {4, 8, 7, 6, 2, 9, 5, 3, 1},
    {2, 6, 3, 4, 1, 5, 9, 8, 7},
    {9, 7, 4, 8, 6, 3, 1, 2, 5},
    {8, 5, 1, 7, 9, 2, 6, 4, 3},
    {1, 3, 8, 9, 4, 7, 2, 5, 6},
    {6, 9, 2, 3, 5, 1, 8, 7, 4},
    {7, 4, 5, 2, 8, 6, 3, 1, 9},
  }
  sudoku_solve(problem)
  assert(same(problem, solution))
end)

run('A harder problem', function()
  local problem = {
    {9, 0, 0, 1, 0, 0, 0, 0, 5},
    {0, 0, 5, 0, 9, 0, 2, 0, 1},
    {8, 0, 0, 0, 4, 0, 0, 0, 0},
    {0, 0, 0, 0, 8, 0, 0, 0, 0},
    {0, 0, 0, 7, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 2, 6, 0, 0, 9},
    {2, 0, 0, 3, 0, 0, 0, 0, 6},
    {0, 0, 0, 2, 0, 0, 9, 0, 0},
    {0, 0, 1, 9, 0, 4, 5, 7, 0},
  }

  local solution = {
    {9, 3, 4, 1, 7, 2, 6, 8, 5},
    {7, 6, 5, 8, 9, 3, 2, 4, 1},
    {8, 1, 2, 6, 4, 5, 3, 9, 7},
    {4, 2, 9, 5, 8, 1, 7, 6, 3},
    {6, 5, 8, 7, 3, 9, 1, 2, 4},
    {1, 7, 3, 4, 2, 6, 8, 5, 9},
    {2, 9, 7, 3, 5, 8, 4, 1, 6},
    {5, 4, 6, 2, 1, 7, 9, 3, 8},
    {3, 8, 1, 9, 6, 4, 5, 7, 2},
  }
  sudoku_solve(problem)
  assert(same(problem, solution))
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
