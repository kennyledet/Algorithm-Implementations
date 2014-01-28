-- Generic Depth-Limited search algorithm implementation
-- See : http://en.wikipedia.org/wiki/Depth-limited_search

-- Notes : this is a generic implementation of Depth-Limited search algorithm.
-- It is devised to be used on any type of graph (point-graph, tile-graph,
-- or whatever. It expects to be initialized with a handler, which acts as
-- an interface between the search algorithm and the search space.

-- The DLS class expects a handler to be initialized. Roughly said, the handler
-- is an interface between your search space and the generic search algorithm.
-- This ensures flexibility, so that the generic algorithm can be adapted to
-- search on any kind of space.
-- The passed-in handler should implement those functions.
-- handler.getNode(...)   ->  returns a Node (instance of node.lua)
-- handler.getNeighbors(n) -> returns an array of all nodes that can be reached
--                            via node n (also called successors of node n)

-- The actual implementation uses recursion to look up for the path.
-- Between consecutive path requests, the user must call the :resetForNextSearch()
--  method to clear all nodes data created during a previous search.
 
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

-- Builds and returns the path to the goal node
local function backtrace(node)
  local path = {}
  repeat
    table.insert(path, 1, node)
    node = node.parent
  until not node
  return path
end

-- Initializes Depth-Limited search with a custom handler
local DLS = class()
function DLS:initialize(handler)
  self.handler = handler
end

-- Clears all nodes for a next search
-- Must be called in-between consecutive searches
function DLS:resetForNextSearch()
  local nodes = self.handler.getAllNodes()
  for _, node in ipairs(nodes) do
    node.visited, node.parent = nil, nil
  end
end

-- Returns the path between start and goal locations
-- start   : a Node representing the start location
-- goal    : a Node representing the target location
-- depth   : the maximum depth of search
-- returns : an array of nodes
function DLS:findPath(start, goal, depth)
  if start == goal then  return backtrace(start) end
  if depth == 0 then return end
  start.visited = true
  local neighbors = self.handler.getNeighbors(start)
  for _, neighbor in ipairs(neighbors) do
    if not neighbor.visited then
      neighbor.parent = start
      local foundGoal = self:findPath(neighbor, goal, depth - 1)
      if foundGoal then return foundGoal end
    end
  end
end

return DLS
