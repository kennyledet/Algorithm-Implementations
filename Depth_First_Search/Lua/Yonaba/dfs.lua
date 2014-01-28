-- Generic Depth-First search algorithm implementation
-- See : http://en.wikipedia.org/wiki/Depth-first_search

-- Notes : this is a generic implementation of Depth-First search algorithm.
-- It is devised to be used on any type of graph (point-graph, tile-graph,
-- or whatever. It expects to be initialized with a handler, which acts as
-- an interface between the search algorithm and the search space.

-- This implementation uses a LIFO (Last In First Out) stack, which can be
-- easily represented via a simple Lua array (see lifo.lua).

-- The DFS class expects a handler to be initialized. Roughly said, the handler
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
local lifo  = require 'lifo'

-- Clears nodes data between consecutive path requests.
local function resetForNextSearch(dfs)
  for node in pairs(dfs.visited) do
    node.parent, node.visited = nil, nil
  end
  dfs.stack:clear()
  dfs.visited = {}
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

-- Initializes Depth-Fist search with a custom handler
local DFS = class()
function DFS:initialize(handler)
  self.handler = handler
  self.stack = lifo()
  self.visited = {}
end

-- Returns the path between start and goal locations
--  using a stack-based search
-- start   : a Node representing the start location
-- goal    : a Node representing the target location
-- returns : an array of nodes
function DFS:findPath(start, goal)
  resetForNextSearch(self)
  
  start.visited = true
  self.stack:push(start)
  self.visited[start] = true
  while not self.stack:isEmpty() do
    local node = self.stack:pop()
    if node == goal then return backtrace(node) end
    local neighbors = self.handler.getNeighbors(node)
    for _, neighbor in ipairs(neighbors) do
      if not neighbor.visited then
        neighbor.visited = true
        neighbor.parent = node
        self.stack:push(neighbor)
        self.visited[neighbor] = true
      end
    end
  end
end

return DFS
