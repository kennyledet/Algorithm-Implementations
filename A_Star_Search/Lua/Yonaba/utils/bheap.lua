-- Binary Heap data structure implementation
-- See: http://www.policyalmanac.org/games/binaryHeaps.htm
-- Adapted from: https://github.com/Yonaba/Binary-Heaps

local PATH = (...):gsub('%.bheap$','')
local class = require (PATH .. '.class')

-- Looks for item in an array
local function findIndex(array, item)
  for k,v in ipairs(array) do
    if v == item then return k end
  end
end

-- Percolates up to restore heap property
local function sift_up(bheap, index)
  if index == 1 then return end
  local pIndex
  if index <= 1 then return end
  if index%2 == 0 then
    pIndex =  index/2
  else pIndex = (index-1)/2
  end
  if not bheap._sort(bheap._heap[pIndex], bheap._heap[index]) then
    bheap._heap[pIndex], bheap._heap[index] =
      bheap._heap[index], bheap._heap[pIndex]
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
    if bheap._sort(bheap._heap[lfIndex],bheap._heap[rtIndex]) then
      minIndex = lfIndex
    else
      minIndex = rtIndex
    end
  end
  if not bheap._sort(bheap._heap[index],bheap._heap[minIndex]) then
    bheap._heap[index],bheap._heap[minIndex] = bheap._heap[minIndex],bheap._heap[index]
    sift_down(bheap,minIndex)
  end
end

-- Binary heap class
-- Instantiates minHeaps by default
local bheap = class()
function bheap:initialize()
  self.size = 0
  self._sort = function(a,b) return a < b end
  self._heap = {}
end

-- Clears the heap
function bheap:clear()
  self._heap = {}
  self.size = 0
end

-- Checks if the heap is empty
function bheap:isEmpty()
  return (self.size==0)
end

-- Pushes a new item into the heap
function bheap:push(item)
  self.size = self.size + 1
  self._heap[self.size] = item
  sift_up(self, self.size)
end

-- Pops the lowest (or highest) best item out of the heap
function bheap:pop()
  local root
  if self.size > 0 then
    root = self._heap[1]
    self._heap[1] = self._heap[self.size]
    self._heap[self.size] = nil
    self.size = self.size-1
    if self.size > 1 then
      sift_down(self, 1)
    end
  end
  return root
end

-- Sorts a specific item in the heap
function bheap:sort(item)
  if self.size <= 1 then return end
  local i = findIndex(self._heap, item)
  if i then sift_up(self, i) end
end

return bheap
