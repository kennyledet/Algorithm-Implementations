-- Node class abstraction

-- This class represents an abstraction of a Node.
-- It should implemented with additional functions when
-- writing a custom handler.

-- See dfs.lua comment header.
-- See custom handlers for reference (*_hander.lua).

local PATH = (...):gsub('%.node$','')
local class = require (PATH .. '.class')

local Node = class ()
Node.__eq = function(a, b) return a:isEqualTo(b) end
Node.__tostring = function(n) return n:toString() end

return Node
