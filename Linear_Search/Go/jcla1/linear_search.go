package linearSearch

func LinearSearch(arr []int, key int) int {
    for i, v := range arr {
        if v == key {
            return i
        }
    }
    return -1
}