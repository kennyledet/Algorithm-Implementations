-- Tests for floyd_warshall.lua
local fw = require 'floyd_warshall'

local total, pass = 0, 0

local function dec(str, len)
  return #str < len
     and str .. (('.'):rep(len-#str))
      or str:sub(1,len)
end

local function same(t, d)
  if #t ~= #d then return false end
  if #t[1] ~= #d[1] then return false end
  local n = #t
  for i = 1,n do
    for j = 1, n do
      if t[i][j] ~= d[i][j] then return false end
    end
  end
  return true
end

local H = math.huge

local function run(message, f)
  total = total + 1
  local ok, err = pcall(f)
  if ok then pass = pass + 1 end
  local status = ok and 'PASSED' or 'FAILED'
  print(('%02d. %68s: %s'):format(total, dec(message,68), status))
end

run('Testing graph with positive weights', function()
  local expected = {
    {0, 5, 8, 9},
    {H, 0, 3, 4},
    {H, H, 0, 1},
    {H, H, H, 0},
  }
  local g = fw.makeGraph(4)
  fw.addEdge(g, 1, 2,  5)
  fw.addEdge(g, 1, 3,  9)
  fw.addEdge(g, 1, 4, 10)
  fw.addEdge(g, 2, 3,  3)
  fw.addEdge(g, 3, 4,  1)
  local d, negCycles = fw.floydWarshall(g)
  assert(same(expected, d))
  assert(not negCycles)
end)

run('Testing graph with negative weights', function()
  local expected = {
    {0, 1, -2, 1},
    {H, 0,  H, 3},
    {H, H,  0, 3},
    {H, H,  H, 0},
  }
  local g = fw.makeGraph(4)
  fw.addEdge(g, 1, 2,  1)
  fw.addEdge(g, 1, 3, -2)
  fw.addEdge(g, 2, 4,  3)
  fw.addEdge(g, 3, 5,  3)
  local d, negCycles = fw.floydWarshall(g)
  assert(same(expected, d))
  assert(negCycles)
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
