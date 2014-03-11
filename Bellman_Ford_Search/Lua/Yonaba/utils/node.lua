-- Node class abstraction

-- This class represents an abstraction of a Node in the graph.
-- It should implemented with additional functions when
-- writing a custom handler.

local PATH = (...):gsub('%.node$','')
local class = require (PATH .. '.class')

local Node = class {distance = math.huge}
Node.__eq = function(a, b) return a:isEqualTo(b) end
Node.__tostring = function(n) return n:toString() end

return Node
