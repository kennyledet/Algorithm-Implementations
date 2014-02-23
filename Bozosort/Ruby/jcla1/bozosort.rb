# The bang (!) denotes that the function mutates the original array
# Works by, if not sorted yet, picking 2 random indicies
# and swapping the 2 elements
def bozosort!(arr)
    while not arr.sort == arr
        a, b = rand(arr.length), rand(arr.length)
        arr[a], arr[b] = arr[b], arr[a]
    end
    return arr
end