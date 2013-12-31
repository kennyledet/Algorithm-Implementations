def insertion_sort(arr = [])    
  arr.each_with_index do |element, i| 
    j = i
    while(j > 0 and arr[j-1] > element) do
      arr[j] = arr[j-1]
      j -= 1
    end
    arr[j] = element
  end
end
