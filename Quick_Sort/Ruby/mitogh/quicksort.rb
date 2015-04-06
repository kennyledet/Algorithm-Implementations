def quicksort(array = [])
  len = array.length - 1
  return array if len < 1

  index = len / 2
  pivot = array[index]
  array.delete_at(index)
  
  less = []
  greater = []

  array.each do |x|
    (x <= pivot) ? (less << x) : (greater << x)
  end

  return quicksort(less) + [pivot] + quicksort(greater)
end
