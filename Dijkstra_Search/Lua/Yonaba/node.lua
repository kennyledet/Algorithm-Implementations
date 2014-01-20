-- Node class abstraction

local class = require 'class'

local Node = class {distance = math.huge}
Node.__eq = function(a, b) return a:isEqualTo(b) end
Node.__lt = function(a, b) return a.distance < b.distance end
Node.__tostring = function(n) return n:toString() end

return Node
