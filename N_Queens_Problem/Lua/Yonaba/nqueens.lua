-- N_Queens problem solving algorithm implementation
-- See: http://en.wikipedia.org/wiki/Eight_queens_puzzle

-- Creates a NxN matrix
local function makeBoard(size)
  local board = {}
  for i = 1, size do board[i] = {}
    for j = 1, size do board[i][j] = false end
  end
  return board
end

-- Checks if a queen position is legit
local function isAllowed(board, x, y, N)
  for i = 1, x - 1 do
    local notAllowed = board[i][y]
                    or (i <= y and board[x - i][y  -i])
                    or (y + i <= N and board[x - i][y + i])
    if notAllowed then return false end
  end
  return true
end

-- Solves recursively the N_Queens puzzle
local function solve(board, x, N)
  for y = 1, N do
    if isAllowed(board, x, y, N) then
      board[x][y] = true
	    if x == N or solve(board, x + 1, N) then return true end
	    board[x][y] = false
    end
  end
  return false
end

-- N-Queens puzzle solving function
-- N      : the problem size
-- return : a NxN matrix of booleans,
--    true matches a queen position 
local function queens(N)
  board = makeBoard(N)
  local solved = solve(board, 1, N)
  assert(solved, 'Solution not found')
  return board
end

return queens
