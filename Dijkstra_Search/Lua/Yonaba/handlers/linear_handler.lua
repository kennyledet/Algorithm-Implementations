-- A linear boundless 1D space map handler

-- This handler is devised for 1-directional continuous space, where
-- nodes are represented with consecutive integer values: 0, 1, 2, etc.
-- Similar to a range (interval) with no bounds.
-- i.e., the path from 5 to 0 would be 5, 4, 3, 2, 1, 0.

local PATH = (...):gsub('handlers.linear_handler$','')
local Node = require (PATH .. '.utils.node')

-- Implements Node class (from node.lua)
function Node:initialize(value) self.value = value end
function Node:toString() return ('Node: %d'):format(self.value) end
function Node:isEqualTo(n) return self.value == n.value end

-- Finds a specific node in an array
local function array_find(array, value)
  for i, v in ipairs(array) do
    if v.value == value then return v end
  end
end

-- Internal cache for all nodes
local nodes = {}
local limits = {}

-- Handler implementation
local handler = {}

-- Inits the search space with bounds
function handler.init(from, to)
  limits.low, limits.high = from, to
  for i = from, to do
    table.insert(nodes, Node(i))
  end
end

-- Creates and returns a Node
function handler.getNode(value) return array_find(nodes, value) end

-- Returns an array of all nodes in the graph
function handler.getAllNodes() return nodes end

-- Returns the distance between node a and node b
function handler.distance(a, b) return math.abs(a.value - b.value) end

-- Returns an array of neighbors of node n
function handler.getNeighbors(n)
  local neighbors = {}
  if n.value - 1 >= limits.low then
    table.insert(neighbors, handler.getNode(n.value - 1))
  end
  if n.value + 1 <= limits.high then
    table.insert(neighbors, handler.getNode(n.value + 1))
  end
  return neighbors
end

return handler
