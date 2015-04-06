-- Levenshtein distance implementation
-- See: http://en.wikipedia.org/wiki/Levenshtein_distance

-- Iterative matrix-based method
-- See: http://en.wikipedia.org/wiki/Levenshtein_distance#Iterative_with_full_matrix

-- Return the minimum of three elements
local function min(a, b, c)
	return math.min(math.min(a, b), c)
end

-- Creates a 2D matrix
local function matrix(row,col)
  local m = {}
  for i = 1,row do m[i] = {}
    for j = 1,col do m[i][j] = 0 end
  end
  return m
end

-- Calculates the Levenshtein distance between two strings
local function lev_iter_based(strA,strB)
  local M = matrix(#strA+1,#strB+1)
  local i,j,cost
  local row,col = #M,#M[1]
  for i = 1,row do M[i][1] = i-1 end
  for j = 1,col do M[1][j] = j-1 end
  for i = 2,row do
    for j = 2,col do
      if (strA:sub(i-1,i-1) == strB:sub(j-1,j-1)) then cost = 0
      else cost = 1
      end
    M[i][j] = min(M[i-1][j]+1,M[i][j-1]+1,M[i-1][j-1]+cost)
    end
  end
  return M[row][col]
end

-- Recursive method
-- See: http://en.wikipedia.org/wiki/Levenshtein_distance#Recursive

-- Calculates the Levenshtein distance between two strings
local function lev_recursive_based(strA, strB, s, t)
  s, t = s or #strA, t or #strB
  if s == 0 then return t end
  if t == 0 then return s end
  local cost = strA:sub(s,s) == strB:sub(t,t) and 0 or 1
  return min(
    lev_recursive_based(strA, strB, s - 1, t) + 1,
    lev_recursive_based(strA, strB, s, t - 1) + 1,
    lev_recursive_based(strA, strB, s - 1, t - 1) + cost
  )
end

return {
	lev_iter = lev_iter_based,
	lev_recursive = function(strA, strB) -- Wrapped to shadow access to s and t args
		return lev_recursive_based(strA, strB)
	end
}
