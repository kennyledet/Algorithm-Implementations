local function rowHasNum(sudoku, row, num)
	for column = 1,9 do
		if sudoku[row][column] == num then return true end
	end
	return false
end

local function columnHasNum(sudoku, column, num)
	for row = 1,9 do
		if sudoku[row][column] == num then return true end
	end
	return false
end


local function boxHasNum(sudoku, row, column, num)
	row = math.floor((row - 1) / 3) * 3 + 1
	column = math.floor((column - 1) / 3) * 3 + 1
	for rwOffset = 0, 2 do
		for clOffset = 0, 2 do
			if sudoku[row + rwOffset][column + clOffset] == num then return true end
		end
	end
	return false
end

local solveNext

local function solve(sudoku, row, column)
	--print('testing ',row, column, sudoku[row][column])
	if row >= 8 then return sudoku end
	if sudoku[row][column] ~= 0 then
		solveNext(sudoku,row, column)
	else
		for num = 1, 9 do
			--print(' testing ',num)
			if     not rowHasNum(sudoku, row, num)
			   and not columnHasNum(sudoku, column, num)
			   and not boxHasNum(sudoku, row, column, num)
				 then
					--print(' add', row, column, num)
					sudoku[row][column] = num
					solveNext(sudoku, row, column)
			end
		end
		sudoku[row][column] = 0
	end
end


solveNext = function (sudoku, row, column)
	--print('next', row, column)
	if column < 9 then
		solve(sudoku, row, column + 1)
	else
		solve(sudoku, row + 1, 1)
	end
end

local sudoku = {
	{0,7,0,4,0,0,3,0,0},
  {0,0,0,0,9,0,1,2,0},
  {0,0,0,7,0,0,0,0,5},
  {0,0,9,2,0,0,0,0,8},
  {8,0,0,6,0,9,0,0,4},
  {7,0,0,0,0,8,9,0,0},
  {3,0,0,0,0,5,0,0,0},
  {0,2,5,0,4,0,0,0,0},
  {0,0,7,0,0,3,0,6,0},
}

local s = solve(sudoku, 1, 1)

table.foreach(sudoku, function(_,l)
	print(table.concat(l,' '))
end)

