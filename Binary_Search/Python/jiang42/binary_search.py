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

if __name__ == "__main__":
  lst = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
  print(binary_search(lst,15))
