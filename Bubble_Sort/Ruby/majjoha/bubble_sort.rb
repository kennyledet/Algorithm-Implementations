def bubble_sort(array)
  n = array.length - 2

  while true do
    swapped = false
    (0..n).each_with_index do |item, i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        swapped = true
      end
    end
    break unless swapped
  end
  array
end
