-- Generic Breadth-First search algorithm implementation
-- See : http://en.wikipedia.org/wiki/Breadth-first_search

-- Notes : this is a generic implementation of Breadth-First search algorithm.
-- It is devised to be used on any type of graph (point-graph, tile-graph,
-- or whatever. It expects to be initialized with a handler, which acts as
-- an interface between the search algorithm and the search space.

-- This implementation uses a FIFO (First In First Out) queue, which can be 
-- easily represented via a simple Lua array (see fifo.lua).

-- The BFS class expects a handler to be initialized. Roughly said, the handler
-- is an interface between your search space and the generic search algorithm.
-- This ensures flexibility, so that the generic algorithm can be adapted to
-- search on any kind of space.
-- The passed-in handler should implement those functions.
-- handler.getNode(...)   ->  returns a Node (instance of node.lua)
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
local fifo  = require 'fifo'

-- Clears nodes data between consecutive path requests.
local function resetForNextSearch(bfs)
  for node in pairs(bfs.visited) do
    node.parent, node.visited = nil, nil
  end
  bfs.queue:clear()
  bfs.visited = {}
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

-- Initializes Breadth-Fist search with a custom handler
local BFS = class()
function BFS:initialize(handler)
  self.handler = handler
  self.queue = fifo()
  self.visited = {}
end

-- Returns the path between start and goal locations
-- start   : a Node representing the start location
-- goal    : a Node representing the target location
-- returns : an array of nodes
function BFS:findPath(start, goal)
  resetForNextSearch(self)

  start.visited = true
  self.queue:push(start)
  self.visited[start] = true
  while not self.queue:isEmpty() do
    local node = self.queue:pop()
    if node == goal then return backtrace(node) end
    local neighbors = self.handler.getNeighbors(node)
    for _, neighbor in ipairs(neighbors) do
      if not neighbor.visited then
        neighbor.visited = true
        neighbor.parent = node
        self.queue:push(neighbor)
        self.visited[neighbor] = true
      end
    end
  end
end

return BFS
