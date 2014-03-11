-- Tests for dijkstra.lua
local BellmanFord = require 'bellmanford'

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

run('Testing Bellman Ford', function()
  local comp = function(a, b) return a.x == b[1] and a.y == b[2] end
  local graph = require 'utils.graph'

  graph.addNode('A')
  graph.addNode('B')
  graph.addNode('C')
  graph.addNode('D')
  graph.addNode('E')
  graph.addEdge('A','B',-1)
  graph.addEdge('A','C',4)
  graph.addEdge('B','C',3)
  graph.addEdge('B','D',2)
  graph.addEdge('D','B',1)
  graph.addEdge('D','C',5)
  graph.addEdge('B','E',2)
  graph.addEdge('E','D',-3)

  local bf = BellmanFord(graph)
  local nodeA = graph.getNode('A')
  local nodeD = graph.getNode('D')
  local pathAtoD = bf:process(nodeA, nodeD)

  assert(graph.getNode('A').distance,  0)
  assert(graph.getNode('B').distance, -1)
  assert(graph.getNode('C').distance,  2)
  assert(graph.getNode('D').distance, -2)
  assert(graph.getNode('E').distance,  1)

  assert(pathAtoD[1], graph.getNode('A'))
  assert(pathAtoD[2], graph.getNode('B'))
  assert(pathAtoD[3], graph.getNode('E'))
  assert(pathAtoD[4], graph.getNode('D'))
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
