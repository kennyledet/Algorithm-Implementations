/*
  Divides a set of integers such that their subsets have the minimum difference.
  See http://www.geeksforgeeks.org/tug-of-war/.
*/


package main

import (
  "fmt"
  "math"
)

// Tries every possible solution until it arrives at the minimum difference
func tugOfWarUtil(array []int, n int, current_elements []bool, num_of_selected_elements int,
  ret []bool, min_diff *int, sum int, current_sum int, current_position int) {
  if current_position == n {
    return
  }

  if ((n/2 - num_of_selected_elements) > (n - current_position)) {
    return
  }

  tugOfWarUtil(array, n, current_elements, num_of_selected_elements, ret,
                min_diff, sum, current_sum, current_position + 1)

  num_of_selected_elements++
  current_sum = current_sum + array[current_position]
  current_elements[current_position] = true

  if num_of_selected_elements == (n/2) {
    if (math.Abs(float64(sum/2) - float64(current_sum)) < float64(*min_diff)) {
      *min_diff = int(math.Abs(float64(sum/2) - float64(current_sum)))
      for i := 0; i < n; i++ {
        ret[i] = current_elements[i]
      }
    }
  } else {
    tugOfWarUtil(array, n, current_elements, num_of_selected_elements, ret,
                  min_diff, sum, current_sum, current_position + 1)
  }

  current_elements[current_position] = false
}

// Generates the array
func tugOfWar(array []int, n int) (firstSubset []int, secondSubset[]int){
  // Forms the inclusion/exclusion array. The excluded elements form the other
  // set
  current_elements := make([]bool, n)

  ret := make([]bool, n)

  min_diff := math.MaxInt32
  sum := 0
  for i := 0; i < n; i++ {
    sum += array[i]
    current_elements[i] = false
    ret[i] = false
  }

  tugOfWarUtil(array, n, current_elements, 0, ret, &min_diff, sum, 0, 0)

  firstSubset := []int{}
  secondSubset := []int{}
  fmt.Println("The first subset is: ")
  for i := 0; i < n; i++ {
    if ret[i] == true {
      firstSubset = append(firstSubset, array[i])
    }
  }
  fmt.Println(firstSubset)

  fmt.Println()
  fmt.Println("The second subset is: ")
  for i := 0; i < n; i++ {
    if ret[i] == false {
      secondSubset = append(secondSubset, array[i])
    }
  }

  fmt.Println(secondSubset)
}

func main() {
  array := []int{23, 45, -34, 12, 0, 98, -99, 4, 189, -1, 4}
  fmt.Println(array)

  n := len(array)
  tugOfWar(array, n)
}
