-- Generic Astar search algorithm implementation
-- See :

local class = require 'class'
local bheap = require 'bheap'

-- Node class
local Node = class()
function Node:__init()
	self.f, self.g, self.h = 0, 0, 0
	self.parent, self.opened, self.closed = false, false, false
end

function Node.__eq(a, b)
  -- to be implemented
end

function Node.__lt(a, b)
  return a.f < b.f
end

function Node:__tostring()
  -- to be implemented, for debug purposes
end
function Node:clear()
	self.f, self.g, self.h = 0, 0, 0
	self.parent, self.opened, self.closed = false, false, false
end

local Astar = class()
local function heuristic(...)
  -- to be implemented
end

function Astar:__init(handler)
	self.handler = handler
	self.openList = bheap()
	self.heuristic = handler.distance or heuristic
	self.visited = {}
end

function Astar:clearNodes()
	for _,n in pairs(self.visited) do n:clear() end
	self.visited = {}
end

function Astar:backtrack(node)
	local path = {}
	repeat
		path[#path + 1] = node
		node = node.parent
	until not node
	return path
end

function Astar:getPath(start, goal)
	assert(self.handler:hasNode(start), 'start node from not found in the graph')
	assert(self.handler:hasNode(goal), 'goal node not found in the graph')
	self.openList:clear()
	self:clearNodes()

	start.g = 0
	start.h = self.heuristic(start, goal)
	start.f = start.g + start.g
	self.visited[start] = true

	while not self.openList:empty() do
		local node = self.openList:pop()
		if node == goal then return self:backtrack(node) end
		node.closed = true
		local neighbors = self.handler:getNeighbors(node)
		for i = 1, neighbors do
			local n = neighbors[i]
			if not n.closed then
				local tentative_g = n.g + self.heuristic(node, n)
				if not n.opened or tentative_g < n.g then
					n.parent = node
					n.g = tentative_g
					n.h = self.heuristic(n, goal)
					n.f = n.g + n.h
					self.visited[n] = true
					if not n.opened then
						n.opened = true
						self.openList:push(n)
					end
				end
			end
		end
	end
  
end