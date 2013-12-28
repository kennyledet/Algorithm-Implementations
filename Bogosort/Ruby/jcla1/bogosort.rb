def bogosort(arr)
    while arr != arr.sort
        arr = arr.shuffle
    end
    return arr
end