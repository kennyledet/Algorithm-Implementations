local function safePosition(col, i)
  for j = 1, i do
    if col[j] == col[i] then return false end
    if i-j == math.abs(col[j] - col[i]) then return false end
  end
  return true
end

local function queens(cols, i, n)
  if i == n then return cols end
  for j = 1, n do

  end
end