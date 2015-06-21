=begin
This method has a big O of O(nlog2n). It uses a divide and conquer startegy.
Conceptually, a merge sort works as follows:

Divide the unsorted list into n sublists, each containing 1 element (a list of 1 element is considered sorted).
Repeatedly merge sublists to produce new sorted sublists until there is only 1 sublist remaining. This will be the sorted list.
Source: https://en.wikipedia.org/?title=Merge_sort
=end

def mergesort(array)
  def merge(left_sorted, right_sorted)
    res = []
    l = 0
    r = 0
 
    loop do
      break if r >= right_sorted.length and l >= left_sorted.length
 
      if r >= right_sorted.length or (l < left_sorted.length and left_sorted[l] < right_sorted[r])
        res << left_sorted[l]
        l += 1
      else
        res << right_sorted[r]
        r += 1
      end
    end
 
    return res
  end
 
  def mergesort_iter(array_sliced)
    return array_sliced if array_sliced.length <= 1
 
    mid = array_sliced.length/2 - 1
    left_sorted = mergesort_iter(array_sliced[0..mid])
    right_sorted = mergesort_iter(array_sliced[mid+1..-1])
    return merge(left_sorted, right_sorted)
  end
 
  mergesort_iter(array)
end