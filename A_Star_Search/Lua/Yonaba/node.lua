-- A* Node class abstraction

-- This class represents an abstraction of the A* Node.
-- It should implemented with additional functions when
-- writing a custom handler.

-- See astar.lua comment header.
-- See custom handlers for reference (*_hander.lua).

local class = require 'class'

local Node = class {g = 0, h = 0, f = 0}
Node.__eq = function(a, b) return a:isEqualTo(b) end
Node.__lt = function(a, b) return a.f < b.f end
Node.__tostring = function(n) return n:toString() end

return Node
