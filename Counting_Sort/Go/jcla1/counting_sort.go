package countingsort


// Warning: Only works with slices that
//          have non-negative entries!
func CountingSort(arr []int) []int {
    maximum := max(arr)
    aux := make([]int, maximum+1)

    for _, v := range arr {
        aux[v] += 1
    }

    ordered := make([]int, 0, len(arr))

    for i, v := range aux {
        for j := 0; j < v; j++ {
            ordered = append(ordered, i)
        }
    }

    return ordered
}

func max(arr []int) int {
    if len(arr) < 1 {
        return 0
    }

    maximum := arr[0]

    for _, v := range arr {
        if v > maximum {
            maximum = v
        }
    }

    return maximum
}