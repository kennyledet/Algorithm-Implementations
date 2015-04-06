package gnomeSort

// Gnome sort runs in O(n^2), but if the array
// is nearly sorted already it runs in about O(n)
// http://en.wikipedia.org/wiki/Gnome_sort
func GnomeSort(arr []int) []int {
    for pos := 1; pos < len(arr); pos++ {
        if arr[pos] >= arr[pos-1] {
            continue
        } else {
            arr[pos], arr[pos-1] = arr[pos-1], arr[pos]
            if pos > 1 {
                pos -= 1
            }
        }
        pos -= 1
    }

    return arr
}