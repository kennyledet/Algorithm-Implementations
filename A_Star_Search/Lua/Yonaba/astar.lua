-- Generic A* search algorithm implementation
-- See : http://en.wikipedia.org/wiki/A*_search_algorithm

-- Notes : this is a generic implementation of A star search algorithm.
-- It is devised to be used on any type of graph (point-graph, tile-graph,
-- or whatever. It expects to be initialized with a handler, which acts as
-- an interface between the search algorithm and the search space.

-- This implementation uses internally a binary heap to handle fast retrieval
-- of the lowest-F-cost node.
-- See: http://www.policyalmanac.org/games/binaryHeaps.htm for more details.

-- The A* class expects a handler to be initialized. Roughly said, the handler
-- is an interface between your search space and the generic search algorithm.
-- This ensures flexibility, so that the generic algorithm can be adapted to
-- search on any kind of space.
-- The passed-in handler should implement those functions.
-- handler.getNode(...)   ->  returns a Node (instance of node.lua)
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
local bheap = require 'bheap'

-- Clears data between consecutive path requests.
local function resetForNextSearch(astar)
  for node in pairs(astar.visited) do
    node.parent, node.opened, node.closed = nil, nil, nil
    node.f, node.g, node.h = 0, 0, 0
  end
  astar.openList:clear()  
  astar.visited = {}
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

-- Initializes A* search with a custom handler
local Astar = class()
function Astar:initialize(handler)
  self.handler = handler
  self.openList = bheap()
  self.heuristic = handler.distance
  self.visited = {}
end

-- Returns the path between start and goal locations
-- start  : a Node representing the start location
-- goal   : a Node representing the target location
-- returns: an array of nodes
function Astar:findPath(start, goal)
  resetForNextSearch(self)

  start.g = 0
  start.h = self.heuristic(start, goal)
  start.f = start.g + start.h
  self.openList:push(start)
  self.visited[start] = true

  while not self.openList:isEmpty() do
    local node = self.openList:pop()
    if node == goal then return backtrace(node) end
    node.closed = true
    local neighbors = self.handler.getNeighbors(node)
    for _, neighbor in ipairs(neighbors) do
      if not neighbor.closed then
        local tentative_g = node.g + self.heuristic(node, neighbor)
        if not neighbor.opened or tentative_g < neighbor.g then
          neighbor.parent = node
          neighbor.g = tentative_g
          neighbor.h = self.heuristic(neighbor, goal)
          neighbor.f = neighbor.g + neighbor.h
          self.visited[neighbor] = true
          if not neighbor.opened then
            neighbor.opened = true
            self.openList:push(neighbor)
          else
            self.openList:sort(neighbor)
          end
        end
      end
    end
  end
end

return Astar
