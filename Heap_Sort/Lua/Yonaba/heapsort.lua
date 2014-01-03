-- Heap sort implementation
-- See: http://en.wikipedia.org/wiki/Heapsort

-- Binary heap data structure implementation
-- Based on http://github.com/Yonaba/Binary-Heaps

-- Percolates up
local function sift_up(heap, index)
  if index == 1 then return end
  local pIndex
  if index <= 1 then return end
  if index % 2 == 0 then
    pIndex =  index / 2
  else pIndex = (index - 1) / 2
  end
  if not heap._sort(heap._array[pIndex], heap._array[index]) then
    heap._array[pIndex], heap._array[index] = heap._array[index], heap._array[pIndex]
    sift_up(heap, pIndex)
  end
end

-- Percolates down
local function sift_down(heap,index)
  local lfIndex,rtIndex,minIndex
  lfIndex = 2 * index
  rtIndex = lfIndex + 1
  if rtIndex > #heap._array then
    if lfIndex > #heap._array then return
    else minIndex = lfIndex
    end
  else
    if heap._sort(heap._array[lfIndex],heap._array[rtIndex]) then
      minIndex = lfIndex
    else minIndex = rtIndex
    end
  end
  if not heap._sort(heap._array[index],heap._array[minIndex]) then
    heap._array[index], heap._array[minIndex] = heap._array[minIndex], heap._array[index]
    sift_down(heap, minIndex)
  end
end

-- Default comparison function
local function f_min(a,b) return a < b end

-- Returns a new binary heap
local function newHeap(comp)
  return {_array = {}, _sort = comp or f_min}
end

-- Checks if the heap is empty
function isEmpty(heap) return #heap._array == 0 end

-- Adds a new value in the heap
-- Note, we could have also implemented a heapify method
-- push all the values and then restore the heap property
function pushArray(heap, array)
	for i, value in ipairs(array) do
		heap._array[#heap._array + 1] = value
		sift_up(heap, #heap._array)
	end
  return heap
end

-- Pops values from the heap
function popArray(heap)
	local array = {}
	while not isEmpty(heap) do
		local root
		if #heap._array > 0 then
			root = heap._array[1]
			heap._array[1] = heap._array[#heap._array]
			table.remove(heap._array)
			if #heap._array > 1 then sift_down(heap, 1) end
		end
		array[#array + 1] = root
	end
	return array
end


return function(array, comp)
	if #array <= 1 then return {array[1]} end
	return popArray(pushArray(newHeap(comp), array))
end
