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
local class = require 'utils.class'
local bheap = require 'utils.bheap'

-- Clears nodes data between consecutive path requests.
local function resetForNextSearch(dijkstra)
  for node in pairs(dijkstra.visited) do
    node.previous = nil
    node.distance = math.huge
  end
  dijkstra.Q:clear()
  dijkstra.visited = {}
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
local Dijkstra = class()
function Dijkstra:initialize(handler)
  self.handler = handler
  self.Q = bheap()
  self.visited = {}
end

-- Processes the graph for shortest paths
-- source  : the starting node from which the search will spread
-- target  : the goal location. If passed, returns the shortest path from
--  source to this target. If not given, will evaluate all the shortest 
--  paths length from to source to all nodes in the graph. This length can 
--  be retrieved by indexing in each node after the search (node.distance)
-- Returns : an array of nodes (if target supplied) 
function Dijkstra:process(source, target)
  resetForNextSearch(self)

  source.distance = 0
  self.visited[source] = true

  local nodes = self.handler.getAllNodes()
  for _, node in ipairs(nodes) do self.Q:push(node) end

  while not self.Q:isEmpty() do
    local u = self.Q:pop()
    if u == target then return backtrace(u) end
    if u.distance == math.huge then break end
    local neighbors = self.handler.getNeighbors(u)
    for _, v in ipairs(neighbors) do
      local alt = u.distance + self.handler.distance(u, v)
      if alt < v.distance then
        v.distance = alt
        v.previous = u
        self.visited[v] = true
        self.Q:sort(v)
      end
    end
  end
end

return Dijkstra
