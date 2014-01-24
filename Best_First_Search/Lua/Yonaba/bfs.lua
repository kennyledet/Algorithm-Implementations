-- Generic Best First Search algorithm implementation
-- See : http://en.wikipedia.org/wiki/Best-first_search

-- Notes : this is a generic implementation of BFS graph search algorithm.
-- It is devised to be used on any type of graph (point-graph, tile-graph,
-- or whatever. It expects to be initialized with a handler, which acts as
-- an interface between the search algorithm and the search space.

-- This implementation uses internally a binary heap to handle fast retrieval
-- of the lowest-cost node.

-- The BFS class expects a handler to be initialized. Roughly said, the handler
-- is an interface between your search space and the generic search algorithm.
-- This model ensures flexibility, so that this generic implementation can be
-- adapted to search on any kind of space.
-- The passed-in handler should implement those functions.
-- handler.getNode(...)    -> returns a Node (instance of node.lua)
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

-- Clears nodes data between consecutive path requests.
local function clearNodes(bfs)
  for node in pairs(bfs.visited) do
    node.parent, node.opened, node.closed = nil, nil, nil
    node.cost = 0
  end
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

-- Initializes BFS search with a custom handler
local BFS = class()
function BFS:initialize(handler)
  self.handler = handler
  self.Q = bheap()
  self.heuristic = handler.distance
  self.visited = {}
end

-- Returns the path between start and goal locations
-- start  : a Node representing the start location
-- goal   : a Node representing the target location
-- greedy : if true, switches to Greedy Best-First Search
function BFS:findPath(start, goal)
  self.Q:clear()
  clearNodes(self)

  start.cost = self.heuristic(start, goal)
  self.Q:push(start)
  self.visited[start] = true

  while not self.Q:isEmpty() do
    local node = self.Q:pop()
    if node == goal then return backtrace(node) end
    node.closed = true
    local neighbors = self.handler.getNeighbors(node)
    if greedy then
      -- Greedy Best-First Search
      local first_neighbor = neighbors[1]
      if first_neighbor then
        local cost_from_first_neighbor = self.heuristic(first_neighbor, goal)
        if cost_from_first_neighbor < node.cost then
          first_neighbor.parent = node
          first_neighbor.cost = cost_from_first_neighbor
          self.Q:push(first_neighbor)
          self.Q:push(node)
          self.visited[first_neighbor] = true
        end
      end
    else
      -- STandard Best-First Search
      for _, neighbor in ipairs(neighbors) do
        if not neighbor.closed then
          local tentative_cost = self.heuristic(neighbor, goal)
          if not neighbor.opened or tentative_cost < neighbor.cost then
            neighbor.parent = node
            neighbor.cost = tentative_cost
            self.visited[neighbor] = true
            if not neighbor.opened then
              neighbor.opened = true
              self.Q:push(neighbor)
            else
              self.openList:sort(neighbor)
            end
          end
        end
      end
    end
  end

end

return BFS
