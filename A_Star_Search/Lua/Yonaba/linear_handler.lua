-- A linear 1D space map handler

local Node_mt = {
    __eq = function(a, b) return a.value == b.value end,
    __lt = function(a, b) return a.f < b.f end,
		__tostring = function(a) return ('Node: %02d'):format(a.value) end
  }

local function Node(value)
	return setmetatable({value = value, g = 0, h = 0, f = 0},Node_mt)
end

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
