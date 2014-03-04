-- Mimics a LIFO stack, OOP style

local PATH = (...):gsub('%.lifo$','')
local class = require (PATH .. '.class')

local lifo = class()
lifo._stack = {}

-- Pushes a value at the head of the heap
function lifo:push(value) table.insert(self._stack, 1, value) end

-- Remove and return the value at the head of the heap
function lifo:pop()
  local head = self._stack[1]
  table.remove(self._stack, 1)
  return head
end

-- Clears the heap
function lifo:clear() self._stack = {} end

-- Checks if the heap is empty
function lifo:isEmpty() return #self._stack == 0 end

return lifo
