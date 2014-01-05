def binary_search(haystack = [], needle = nil)
  return nil if needle.nil? || haystack.nil?
  lo = 0
  hi = haystack.size - 1
  while lo <= hi do
    mid = lo  + ((hi-lo) / 2 )
    return mid if haystack[mid] == needle
    (haystack[mid] < needle) ? (lo = mid + 1) : (hi = mid - 1)
  end
end
