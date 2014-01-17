-- A grid map handler
-- Supports 4-directions and 8-directions moves

local Node = require 'node'
function Node:__init(x, y) self.x, self.y = x, y end
function Node:toString() return ('Node: x = %d, y = %d'):format(self.x, self.y) end
function Node:isEqualTo(n) return self.x == n.x and self.y == n.y end

local orthogonal = {
	{x = 0, y = -1}, {x = -1, y =  0},
	{x = 1, y = 0}, {x = 0, y = 1},
}

local diagonal = {
	{x = -1, y = -1}, {x = 1, y = -1},
	{x = -1, y = 1}, {x = 1, y = 1}
}

local handler = {}

function handler.makeNode(location)
  return Node(location.x, location.y)
end

function handler.distance(a, b)
	local dx, dy = a.x - b.x, a.y - b.y
  return math.sqrt(dx * dx + dy * dy)
end

function handler.isWalkable(x, y)
	return (handler.map[y][x] == 0)
end

function handler.inBounds(x, y)
	return handler.map[y] and handler.map[y][x]
end

function handler.isValidLocation(x,y)
	return handler.inBounds(x,y) and handler.isWalkable(x,y)
end

function handler.getNeighbors(node)
  local neighbors = {}
	for _, axis in ipairs(orthogonal) do
		local x, y = node.x + axis.x, node.y + axis.y
		if handler.isValidLocation(x, y) then
			table.insert(neighbors, Node(x,y))
		end
	end
	if handler.diagonal then
		for _, axis in ipairs(diagonal) do
			local x, y = node.x + axis.x, node.y + axis.y
			if handler.isValidLocation(x, y) then
				table.insert(neighbors, Node(x,y))
			end
		end
	end
  return neighbors
end

return handler
