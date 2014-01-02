def binary_search(arr, target)
    if arr.length < 1
        return -1
    end

    middle = arr.length / 2
    middle_value = arr[middle]

    if middle_value > target
        return binary_search(arr[0, middle], target)
    elsif middle_value < target
        v = binary_search(arr[(middle+1)..-1], target)
        return v + middle + 1 unless v < 0
        return v
    end

    return middle
end
