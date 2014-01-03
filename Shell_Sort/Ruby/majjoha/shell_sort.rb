def shell_sort(array)
  h = array.size / 2
  while h > 0 do
    (h..array.length).each_with_index do |item, j|
      val = array[j]
      i = j
      while (i >= h && array[i-h] > val)
        array[i] = array[i-h]
        i -= h
      end
      array[i] = val
    end
    h /= 2
  end
  array
end
