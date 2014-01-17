-- A* Node class abstraction

local class = require 'class'

local Node = class {g = 0, h = 0, f = 0}
local Node_mt = getmetatable(Node)
Node_mt.__eq = function(a, b) return a:isEqualTo(b) end
Node_mt.__lt = function(a, b) return a.f < b.f end
Node_mt.__tostring = function(n) return n:toString() end

return Node