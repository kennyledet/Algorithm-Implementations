def fisher_yates(arr = [])
  n = arr.length
  arr.each_with_index do |element, index|
    i = rand(n)
    arr[index], arr[i] = arr[i], arr[index]
  end
  arr
end
