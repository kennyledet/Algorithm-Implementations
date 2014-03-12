-- Bellman Ford single source shortest path search algorithm implementation
-- See : https://en.wikipedia.org/wiki/Bellman%E2%80%93Ford_algorithm

-- Notes : this is a generic implementation of Bellman Ford search algorithm.
-- It is devised to be used on waypoint graphs.
-- The BellmanFord class expects a handler to be initialized. Roughly said, the handler
-- is an interface between your graph and the search algorithm.
-- The passed-in handler should implement those functions.
-- handler.getNode(...)    -> returns a Node (instance of node.lua)
-- handler.getAllNodes()   -> returns an array list of all nodes in the graph
-- handler.getAllEdges()   -> returns an array list of all edges in the graph

-- See utils/graph.lua for reference

-- The generic Node class provided (see utils/node.lua) should also be implemented
-- through the handler. Basically, it should describe how nodes are labelled
-- and tested for equality for a custom search space.
-- The following functions should be implemented:
-- function Node:initialize(...) -> creates a Node with custom attributes
-- function Node:toString()      -> returns a unique string representation of
--                                  the node, for debug purposes

-- Dependencies
local class = require 'utils.class'

-- Clears nodes data between consecutive path requests.
local function resetForNextSearch(bellmanford)
  local nodes = bellmanford.handler.getAllNodes()
  for _, node in pairs(nodes) do
    node.parent = nil
    node.distance = math.huge
  end
end

-- Builds and returns the path to the goal node
local function backtrace(node)
  local path = {}
  repeat
    table.insert(path, 1, node)
    node = node.parent
  until not node
  return path
end

-- Initializes Bellman Ford search with a custom handler
local BellmanFord = class()
function BellmanFord:initialize(handler)
  self.handler = handler
end

-- Processes the graph for shortest paths
-- source : the starting node from which the search will spread.
-- target : the goal node
--   When done, the shortest path from one node to another can easily 
--   backtraced by indexing the parent field of a node. 
-- Return : if target supplied, returns the shortest path from source 
--   to target.
function BellmanFord:process(source, target)
  resetForNextSearch(self)
  source.distance = 0
  local nodes = self.handler.getAllNodes()
  local edges = self.handler.getAllEdges()

  -- Relaxing all edges |V| - 1 times
  for i = 1, #nodes - 1 do
    for i, edge in ipairs(edges) do
      local u, v, w = edge.from, edge.to, edge.weight
      local tempDistance = u.distance + w
      if tempDistance < v.distance then
        v.distance, v.parent = tempDistance, u
      end
    end
  end

  -- Checking for negative cycles
  for i, edge in ipairs(edges) do
    local u, v, w = edge.from, edge.to, edge.weight
    local tempDistance = u.distance + w
    assert(tempDistance >= v.distance, 'Negative cycle found!')
  end
  
  if target then return backtrace(target) end
end

return BellmanFord
