-- Tests for dijkstra.lua
local Dijkstra = require 'dijkstra'

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
  local ln_handler = require 'handlers.linear_handler'
  ln_handler.init(1,5)
  local dijkstra = Dijkstra(ln_handler)


  local source, dest = ln_handler.getNode(1), ln_handler.getNode(5)
  assert(same(dijkstra:process(source, dest), {1,2,3,4,5}, comp))

  dijkstra:process(source)
  assert(ln_handler.getNode(1).distance == 0)
  assert(ln_handler.getNode(2).distance == 1)
  assert(ln_handler.getNode(3).distance == 2)
  assert(ln_handler.getNode(4).distance == 3)
  assert(ln_handler.getNode(5).distance == 4)
end)

run('Testing grid graph', function()
  local comp = function(a, b) return a.x == b[1] and a.y == b[2] end
  local gm_handler = require 'handlers.gridmap_handler'
  local dijkstra = Dijkstra(gm_handler)
  local map = {{0,0,0,0,0},{0,1,1,1,1},{0,0,0,0,0}}
  gm_handler.init(map)
  gm_handler.diagonal = false

  local source, dest = gm_handler.getNode(1,1), gm_handler.getNode(5,3)
  assert(same(dijkstra:process(source, dest), {{1,1},{1,2},{1,3},{2,3},{3,3},{4,3},{5,3}}, comp))
  gm_handler.diagonal = true
  assert(same(dijkstra:process(source, dest), {{1,1},{1,2},{2,3},{3,3},{4,3},{5,3}},       comp))
end)

run('Testing point graph', function()
  local comp = function(a, b) return a.x == b[1] and a.y == b[2] end
  local pg_handler = require 'handlers.point_graph_handler'

  local dijkstra = Dijkstra(pg_handler)

  pg_handler.addNode('a')
  pg_handler.addNode('b')
  pg_handler.addNode('c')
  pg_handler.addNode('d')
  pg_handler.addNode('e')
  pg_handler.addNode('f')
  pg_handler.addEdge('a', 'b',  5)
  pg_handler.addEdge('b', 'c', 10)
  pg_handler.addEdge('c', 'd',  5)
  pg_handler.addEdge('d', 'e',  5)
  pg_handler.addEdge('e', 'f', 10)
  pg_handler.addEdge('f', 'a',  5)
  pg_handler.addEdge('f', 'b', 10)
  pg_handler.addEdge('e', 'c', 10)
  pg_handler.addEdge('a', 'd', 15)

  local comp = function(a, b) return a.name == b end
  local source, dest = pg_handler.getNode('a'), pg_handler.getNode('d')
  assert(same(dijkstra:process(source, dest),{'a','d'}, comp))

  pg_handler.setEdgeWeight('a', 'd', 40)
  assert(same(dijkstra:process(source, dest),{'a','b','c', 'd'}, comp))

  pg_handler.setEdgeWeight('a', 'b', 6)
  assert(same(dijkstra:process(source, dest),{'a','f','e', 'd'}, comp))
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
