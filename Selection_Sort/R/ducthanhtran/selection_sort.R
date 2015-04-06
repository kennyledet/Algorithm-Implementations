# Selection Sort algorithm
# Author: Duc Thanh Tran (ducthanhtran, Github)
# Date: 01/26/2015

# selection sort algorithm
selectionSort <- function(arr) {
  for (i in 1:(length(arr)-1)) {
    indexMin <- i;
    
    for (j in (i+1):length(arr)) {
      if(arr[j] < arr[indexMin])
        indexMin <- j;
    }
    
    if(indexMin != i)
      arr <- swap(arr, indexMin, i);
  }
  return(arr);
}


# swap function
# swaps values at indices indexA and indexB
swap <- function(arr, indexA, indexB) {
  temp <- arr[indexA];
  arr[indexA] <- arr[indexB];
  arr[indexB] <- temp;
  return(arr);
}

# test algorithm
arrA <- c(9, 2, 4, 5, 1);
print(arrA);

arrResult <- selectionSort(arrA);
print(arrResult);