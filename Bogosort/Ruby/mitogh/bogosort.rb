def bogosort(arr)
  arr.shuffle! while arr != arr.sort
  arr
end
