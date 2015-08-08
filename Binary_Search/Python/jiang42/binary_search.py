def binary_search(arr, target):
  low, high = 0, len(arr)-1
  while low < high:
    mid = (low + high)/2
    if arr[mid] == target:
      return mid
    elif arr[mid] > target:
      high = mid - 1
    else:
      low = mid + 1
  return high
