-- Binary Heap data structure implementation
-- See: http://www.policyalmanac.org/games/binaryHeaps.htm
-- Adapted from: https://github.com/Yonaba/Binary-Heaps

local class = require 'class'

-- Percolates up to restore heap property
local function sift_up(bheap, index)
  if index == 1 then return end
  local pIndex
  if index <= 1 then return end
  if index%2 == 0 then
    pIndex =  index/2
  else pIndex = (index-1)/2
  end
  if not bheap.sort(bheap.__heap[pIndex], bheap.__heap[index]) then
    bheap.__heap[pIndex], bheap.__heap[index] =
      bheap.__heap[index], bheap.__heap[pIndex]
    sift_up(bheap, pIndex)
  end
end

-- Percolates down to restore heap property
local function sift_down(bheap,index)
  local lfIndex,rtIndex,minIndex
  lfIndex = 2*index
  rtIndex = lfIndex + 1
  if rtIndex > bheap.size then
    if lfIndex > bheap.size then return
    else minIndex = lfIndex  end
  else
    if bheap.sort(bheap.__heap[lfIndex],bheap.__heap[rtIndex]) then
      minIndex = lfIndex
    else
      minIndex = rtIndex
    end
  end
  if not bheap.sort(bheap.__heap[index],bheap.__heap[minIndex]) then
    bheap.__heap[index],bheap.__heap[minIndex] = bheap.__heap[minIndex],bheap.__heap[index]
    sift_down(bheap,minIndex)
  end
end

-- Binary heap class
-- Instantiates minHeaps by default
local bheap = class()
function bheap:initialize()
  self.size = 0
  self.sort = function(a,b) return a < b end
  self.__heap = {}
end

-- Clears the heap
function bheap:clear()
  self.__heap = {}
  self.size = 0
end

-- Checks if the heap is empty
function bheap:isEmpty()
  return (self.size==0)
end

-- Pushes a new item into the heap
function bheap:push(item)
  self.size = self.size + 1
  self.__heap[self.size] = item
  sift_up(self, self.size)
end

-- Pops the lowest (or highest) best item out of the heap
function bheap:pop()
  local root
  if self.size > 0 then
    root = self.__heap[1]
    self.__heap[1] = self.__heap[self.size]
    self.__heap[self.size] = nil
    self.size = self.size-1
    if self.size > 1 then
      sift_down(self, 1)
    end
  end
  return root
end

return bheap
