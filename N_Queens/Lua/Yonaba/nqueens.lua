local function makeBoard(size)
  local board = {}
  for i = 1, size do board[i] = {}
    for j = 1, size do board[i][j] = false end
  end
  return board
end

local function isAllowed(board, x, y, N)
  for i = 1, x - 1 do
    local notAllowed = board[i][y]
                    or (i <= y and board[x - i][y  -i])
                    or (y + i <= N and board[x - i][y + i])
    if notAllowed then return false end
  end
  return true
end

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

local function queens(N)
  N = N or 8
  board = board or makeBoard(N)
  local solved = solve(board, 1, N)
  assert(solved, 'Solution not found')
  return board
end

-- pretty printing
local b = queens(5)
if b then
	table.foreach(b, function(k,row)
		for _, v in ipairs(row) do
			io.write(v and '|Q' or '| ')
		end
		io.write('\n')
	end)
else
	print('nothing found')
end
