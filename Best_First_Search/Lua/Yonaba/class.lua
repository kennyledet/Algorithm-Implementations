-- Minimalistic class implementation

local class = function(attr)
  local klass = attr or {}
  klass.__index = klass
  klass.__call = function(_,...) return klass:new(...) end
  function klass:new(...)
    local instance = setmetatable({}, klass)
    if klass.initialize then klass.initialize(instance, ...) end
    return instance
  end
  return setmetatable(klass,{__call = klass.__call})
end

return class
