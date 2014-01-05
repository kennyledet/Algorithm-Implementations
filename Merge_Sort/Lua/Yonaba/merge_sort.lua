-- Mergesort top down implementation
-- See : http://en.wikipedia.org/wiki/Merge_sort#Top-down_implementation

-- Splices a list from i to j
local function slice(list, i, j)
  local t = {}
  for k = i, j do t[#t + 1] = list[k] end
  return t
end

-- Top down merge
local function top_down_merge(left, right, comp)
  local llen, rlen = #left, #right
  local lindex, rindex = 1, 1
  local t = {}

  comp = comp or function(a, b) return a < b end

  repeat
    if lindex <= llen and rindex <= rlen then
      if comp(left[lindex], right[rindex]) then
        t[#t + 1] = left[lindex]
        lindex = lindex + 1
      else
        t[#t + 1] = right[rindex]
        rindex = rindex + 1
      end
    elseif lindex <= llen then
        t[#t + 1] = left[lindex]
        lindex = lindex + 1
    else
        t[#t + 1] = right[rindex]
        rindex = rindex + 1
    end
  until (lindex > llen and rindex > rlen)

  return t
end

-- Mergesort top down split merge implementation
-- list: a list to be sorted
-- comp : (optional) a comparison function
--  defaults to function(a, b) return a < b end
local function top_down_split_merge(list, comp)
  local n = #list
  if n <= 1 then return list end
  local mid = math.floor(n/2)
  local left = top_down_split_merge(slice(list, 1, mid), comp)
  local right = top_down_split_merge(slice(list, mid+1, n), comp)
  return top_down_merge(left, right, comp)
end

return top_down_split_merge