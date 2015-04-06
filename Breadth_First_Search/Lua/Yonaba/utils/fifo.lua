-- Mimics a FIFO queue, OOP style

local PATH = (...):gsub('%.fifo$','')
local class = require (PATH .. '.class')

local fifo = class()
fifo._queue = {}

-- Pushes a value at the tail of the heap
function fifo:push(value) table.insert(self._queue, value) end

-- Remove and return the value at the head of the heap
function fifo:pop()
  local head = self._queue[1]
  table.remove(self._queue, 1)
  return head
end

-- Clears the heap
function fifo:clear(f) self._queue = {} end

-- Checks if the heap is empty
function fifo:isEmpty() return #self._queue == 0 end

return fifo
