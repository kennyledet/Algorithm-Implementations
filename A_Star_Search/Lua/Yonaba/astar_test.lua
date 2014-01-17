-- Tests for astar.lua
local Astar = require 'astar'

local total, pass = 0, 0

local function dec(str, len)
  return #str < len
     and str .. (('.'):rep(len-#str))
      or str:sub(1,len)
end

local function same(t, p, comp)
  for k,v in ipairs(t) do
    if not comp(v, p[k]) then return false end
  end
  return true
end

local function run(message, f)
  total = total + 1
  local ok, err = pcall(f)
  if ok then pass = pass + 1 end
  local status = ok and 'PASSED' or 'FAILED'
  print(('%02d. %68s: %s'):format(total, dec(message,68), status))
end

run('Testing linear graph', function()
  local comp = function(a, b) return a.value == b end
  local ln_handler = require 'linear_handler'
  local astar = Astar(ln_handler)
  assert(same(astar:findPath(0,5),  {0,1,2,3,4,5},     comp))
  assert(same(astar:findPath(-2,2), {-2, -1, 0, 1, 2}, comp))
end)

run('Testing grid graph', function()
  local comp = function(a, b) return a.x == b[1] and a.y == b[2] end
  local gm_handler = require 'gridmap_handler'
  local astar = Astar(gm_handler)
  gm_handler.map = {{0,0,0,0,0},{0,1,1,1,1},{0,0,0,0,0}}

  gm_handler.diagonal = false
  assert(same(astar:findPath({1,1},{5,3}), {{1,1},{1,2},{1,3},{2,3},{3,3},{4,3},{5,3}}, comp))
  gm_handler.diagonal = true
  assert(same(astar:findPath({1,1},{5,3}), {{1,1},{1,2},{2,3},{3,3},{4,3},{5,3}},       comp))
end)

run('Testing point graph', function()
  local comp = function(a, b) return a.x == b[1] and a.y == b[2] end
  local pg_handler = require 'point_graph_handler'
  local astar = Astar(pg_handler)

  pg_handler.addNode('a')
  pg_handler.addNode('b')
  pg_handler.addNode('c')
  pg_handler.addNode('d')
  pg_handler.addNode('e')
  pg_handler.addEdge('a', 'b', 10)
  pg_handler.addEdge('b', 'e', 10)
  pg_handler.addEdge('a', 'c', 5)
  pg_handler.addEdge('c', 'd', 5)
  pg_handler.addEdge('d', 'e', 5)

  local comp = function(a, b) return a.name == b end
  assert(same(astar:findPath('a','e'),{'a','c','d','e'}, comp))

  pg_handler.setEdgeWeight('a', 'b', 1)
  pg_handler.setEdgeWeight('b', 'e', 1)

  assert(same(astar:findPath('a','e'),{'a','b','e'}, comp))
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
