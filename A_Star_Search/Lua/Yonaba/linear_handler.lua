-- A linear 1D space map handler

local Node = require 'node'
function Node:__init(value) self.value = value end
function Node:toString() return ('Node: %d'):format(self.value) end
function Node:isEqualTo(n) return self.value == n.value end

local handler = {}

function handler.makeNode(value)
  return Node(value)
end

function handler.distance(a, b)
  return math.abs(a.value - b.value)
end

function handler.getNeighbors(node)
  local neighbors = {}
  table.insert(neighbors, Node(node.value - 1))
  table.insert(neighbors, Node(node.value + 1))
  return neighbors
end

return handler
