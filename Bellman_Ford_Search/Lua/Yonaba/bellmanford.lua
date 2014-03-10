-- Generic Dijkstra graph search algorithm implementation
-- See : http://en.wikipedia.org/wiki/Dijkstra%27s_algorithm

-- Notes : this is a generic implementation of Dijkstra graph search algorithm.
-- It is devised to be used on any type of graph (point-graph, tile-graph,
-- or whatever. It expects to be initialized with a handler, which acts as
-- an interface between the search algorithm and the search space.

-- This implementation uses internally a binary heap to handle fast retrieval
-- of the lowest-cost node.

-- The Dijkstra class expects a handler to be initialized. Roughly said, the handler
-- is an interface between your search space and the generic search algorithm.
-- This model ensures flexibility, so that this generic implementation can be
-- adapted to search on any kind of space.
-- The passed-in handler should implement those functions.
-- handler.getNode(...)    -> returns a Node (instance of node.lua)
-- handler.getAllNodes()   -> returns an array list of all nodes in graph
-- handler.distance(a, b)  -> heuristic function which returns the distance
--                            between node a and node b
-- handler.getNeighbors(n) -> returns an array of all nodes that can be reached
--                            via node n (also called successors of node n)

-- The generic Node class provided (see node.lua) should also be implemented
-- through the handler. Basically, it should describe how nodes are labelled
-- and tested for equality for a custom search space.
-- The following functions should be implemented:
-- function Node:initialize(...) -> creates a Node with custom attributes
-- function Node:isEqualTo(n)    -> returns if self is equal to node n
-- function Node:toString()      -> returns a unique string representation of
--                                  the node, for debug purposes

-- See custom handlers for reference (*_hander.lua).

-- Dependencies
local class = require 'class'

-- Clears nodes data between consecutive path requests.
local function resetForNextSearch(bellmanford)
	local nodes = bellmanford.handler.getAllNodes()
  for _, node in pairs(nodes) do
    --node.previous = nil
    node.distance = math.huge
  end
end

-- Builds and returns the path to the goal node
local function backtrace(node)
  local path = {}
  repeat
    table.insert(path, 1, node)
    node = node.previous
  until not node
  return path
end

-- Initializes Dijkstra search with a custom handler
local BellmanFord = class()
function BellmanFord:initialize(handler)
  self.handler = handler
end

-- Processes the graph for shortest paths
-- source  : the starting node from which the search will spread
-- target  : the goal location. If passed, returns the shortest path from
--  source to this target. If not given, will evaluate all the shortest
--  paths length from to source to all nodes in the graph. This length can
--  be retrieved by indexing in each node after the search (node.distance)
-- Returns : an array of nodes (if target supplied)
function BellmanFord:process(source)
  resetForNextSearch(self)
  source.distance = 0

  local nodes = self.handler.getAllNodes()
  local edges = self.handler.getAllEdges()

  for i = 1, #nodes - 1 do
    for i, edge in ipairs(edges) do
      local u, v, w = edge.from, edge.to, edge.weight
      local tempDistance = u.distance + w
      if tempDistance < v.distance then
        v.distance = tempDistance
      end
    end
  end

  for i, edge in ipairs(edges) do
    local u, v, w = edge.from, edge.to, edge.weight
    local tempDistance = u.distance + w
    assert(tempDistance >= v.distance, 'Negative cycle found!')
  end

end


return BellmanFord
