package bozosort

import "math/rand"

func Bozosort(arr []int) []int {
    for !isSorted(arr) {
        a, b := rand.Intn(len(arr)), rand.Intn(len(arr))
        arr[a], arr[b] = arr[b], arr[a]
    }

    return arr
}

func isSorted(arr []int) bool {
    for i := 1; i < len(arr); i++ {
        if arr[i-1] > arr[i] {
            return false
        }
    }

    return true
}
