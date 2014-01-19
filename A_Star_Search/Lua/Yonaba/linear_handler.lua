-- A linear boundless 1D space map handler

-- This handler is devised for 1-directional continuous space, where
-- nodes are represented with consecutive integer values: 0, 1, 2, etc.
-- Similar to a range (interval) with no bounds.
-- i.e., the path from 5 to 0 would be 5, 4, 3, 2, 1, 0.

-- Implements Node class (from node.lua)
local Node = require 'node'
function Node:initialize(value) self.value = value end
function Node:toString() return ('Node: %d'):format(self.value) end
function Node:isEqualTo(n) return self.value == n.value end

-- Handler implementation
local handler = {}

-- Creates and returns a Node
function handler.getNode(value) return Node(value) end

-- Returns the distance between node a and node b
function handler.distance(a, b) return math.abs(a.value - b.value) end

-- Returns an array of neighbors of node n
function handler.getNeighbors(n)
  local neighbors = {}
  table.insert(neighbors, handler.getNode(n.value - 1))
  table.insert(neighbors, handler.getNode(n.value + 1))
  return neighbors
end

return handler
