-- A grid map handler
-- Supports 4-directions and 8-directions moves

-- This handler is devised for 2d bounded grid where nodes are indexed
-- with a pair of (x, y) coordinates. It features straight (4-directions)
-- and diagonal (8-directions) moves.

local PATH = (...):gsub('handlers.gridmap_handler$','')
local Node = require (PATH .. '.utils.node')

-- Implements Node class (from node.lua)
function Node:initialize(x, y) self.x, self.y = x, y end
function Node:toString() return ('Node: x = %d, y = %d'):format(self.x, self.y) end
function Node:isEqualTo(n) return self.x == n.x and self.y == n.y end

-- Direction vectors for straight moves
local orthogonal = {
  {x =  0, y = -1},
  {x = -1, y =  0},
  {x =  1, y =  0},
  {x =  0, y =  1},
}

-- Direction vectors for diagonal moves
local diagonal = {
  {x = -1, y = -1},
  {x =  1, y = -1},
  {x = -1, y =  1},
  {x =  1, y =  1}
}

-- Checks of a given location is walkable on the grid.
-- Assumes 0 is walkable, any other value is unwalkable.
local function isWalkable(map, x, y) return map[y] and map[y][x] and map[y][x] == 0 end

local nodes = {}

-- Handler implementation
local handler = {}

-- Inits the search space
function handler.init(map)
  handler.map = map
  nodes = {}
  for y, line in ipairs(map) do
    for x in ipairs(line) do
      table.insert(nodes, Node(x, y))
    end
  end
end

-- Returns an array of all nodes in the graph
function handler.getAllNodes() return nodes end

-- Returns a Node
function handler.getNode(x, y)
  local h, w = #handler.map, #handler.map[1]
  local k = (y - 1) * w + (x%w == 0 and w or x)
  return nodes[k]
end

-- Returns manhattan distance between node a and node b
function handler.distance(a, b)
  local dx, dy = a.x - b.x, a.y - b.y
  return math.abs(dx) + math.abs(dy)
end

-- Returns an array of neighbors of node n
function handler.getNeighbors(n)
  local neighbors = {}
  for _, axis in ipairs(orthogonal) do
    local x, y = n.x + axis.x, n.y + axis.y
    if isWalkable(handler.map, x, y) then
      table.insert(neighbors, handler.getNode(x, y))
    end
  end
  if handler.diagonal then
    for _, axis in ipairs(diagonal) do
      local x, y = n.x + axis.x, n.y + axis.y
      if isWalkable(handler.map, x, y) then
        table.insert(neighbors, handler.getNode(x,y))
      end
    end
  end
  return neighbors
end

return handler
