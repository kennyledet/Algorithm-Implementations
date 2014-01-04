-- Maximum Sub array problem (Kadanes algorithm) implementation
-- See: http://en.wikipedia.org/wiki/Maximum_subarray_problem

-- array: a list of numbers
-- returns:
--   max_so_far: the maximum subarray sum
--        begin: the initial index of the max subarray
--         last: the last index of the max subarray
return function(array)
  local n = #array
  if n< 1 then return 0 end
  local max_ending_here, max_so_far = array[1], array[1]
  local begin, begin_tmp, last = 1, 1, 1
  for i = 2, n do
		if max_ending_here < 0 then
			max_ending_here = array[i]
			begin_tmp = i
		else
			max_ending_here = max_ending_here + array[i]
		end
		if max_ending_here >= max_so_far then
			max_so_far = max_ending_here
			begin = begin_tmp
			last = i
		end
  end
  return max_so_far, begin, last
end
