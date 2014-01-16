-- Generic A* search algorithm implementation
-- See : http://en.wikipedia.org/wiki/A*_search_algorithm

-- Note : this is a generic implementation of A star search
--  algorithm. It is devised to be used on any type of
--  graph (point-graph, tile graph, or whatever. It
--  expects to be initialized with a handler, which 
--  defines the interface between the search algorithm
--  and the search space representation.
          
local class = require 'class'
local bheap = require 'bheap'

local Astar = class()
function Astar:__init(handler)
	self.handler = handler
	self.openList = bheap()
	self.heuristic = handler.distance
	self.visited = {}
end

function Astar:clearNodes()
	for node in pairs(self.visited) do
		node.parent, node.opened, node.closed = nil, nil, nil
		node.f, node.g, node.h = 0, 0, 0
	end
	self.visited = {}
end

local function backtrace(node)
	local path = {}
	repeat
		table.insert(path, 1, node)
		node = node.parent
	until not node
	return path
end

function Astar:searchPath(start, goal)
  start = self.handler.makeNode(start)
  goal = self.handler.makeNode(goal)

	self.openList:clear()
	self:clearNodes()

	start.g = 0
	start.h = self.heuristic(start, goal)
	start.f = start.g + start.h
	self.openList:push(start)
	self.visited[start] = true

	while not self.openList:empty() do
		local node = self.openList:pop()
		if node == goal then return backtrace(node) end
		node.closed = true
		local neighbors = self.handler.getNeighbors(node)
		for _, neighbor in ipairs(neighbors) do
			if not neighbor.closed then
				local tentative_g = (neighbor.g or 0) + self.heuristic(node, neighbor)
				if not neighbor.opened or tentative_g < neighbor.g then
					neighbor.parent = node
					neighbor.g = tentative_g
					neighbor.h = self.heuristic(neighbor, goal)
					neighbor.f = neighbor.g + neighbor.h
					self.visited[neighbor] = true
					if not neighbor.opened then
						neighbor.opened = true
						self.openList:push(neighbor)
					end
				end
			end
		end
	end

end

return Astar
