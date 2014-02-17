-- Sudoku solver implementation
-- Uses Backtracking and recursion
-- See : http://en.wikipedia.org/wiki/Sudoku

-- Checks if num exists on a row
local function rowHasNotNum(sudoku, row, num)
  for column = 1,9 do
    if sudoku[row][column] == num then
      return false
    end
  end
  return true
end

-- Checks if num exists on a column
local function columnHasNotNum(sudoku, column, num)
  for row = 1,9 do
    if sudoku[row][column] == num then return false end
  end
  return true
end

-- Given a (row, column) location on the sudoku grid
-- identifies the corresponding 3x3 box and checks if
-- num exists in this box
local function boxHasNotNum(sudoku, row, column, num)
  row = math.floor((row - 1) / 3) * 3 + 1
  column = math.floor((column - 1) / 3) * 3 + 1
  for rwOffset = 0, 2 do
    for clOffset = 0, 2 do
      if sudoku[row + rwOffset][column + clOffset] == num then
        return false
      end
    end
  end
  return true
end

-- Checks if num can be assigned to sudoku[row][column]
-- without breaking sudoku rules.
local function isLegit(sudoku, row, column, num)
  return rowHasNotNum(sudoku, row, num)
    and columnHasNotNum(sudoku, column, num)
    and boxHasNotNum(sudoku, row, column, num)
end


-- Checks if the actual problem is solved.
-- If not, returns false, plus the location on the
-- first unassigned cell found.
local function isSolved(sudoku)
  for row = 1, 9 do
    for column = 1, 9 do
      if sudoku[row][column] == 0 then
        return false, row, column
      end
    end
  end
  return true
end

-- Sudoku solving via backtracking and recursion
-- sudoku  : a 2-dimensional grid of numbers (0-9)
--           0 matches unknown values to be found.
-- returns : true, if a solution was found,
--           false otherwise.
local function solve(sudoku)
  local solved, row, column = isSolved(sudoku)
  if solved then return true end
  for num = 1, 9 do
    if isLegit(sudoku, row, column, num) then
      sudoku[row][column] = num
      if solve(sudoku) then return true end
      sudoku[row][column] = 0
    end
  end
  return false
end

return solve



