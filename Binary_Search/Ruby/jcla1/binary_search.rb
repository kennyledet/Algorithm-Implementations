def binary_search(arr, target)
    if arr.length < 1
        return -1
    end

    middle = arr.length / 2
    middle_value = arr[middle]

    if middle_value > target
        binary_search(arr[0, middle], target)
    elsif middle_value < target
        v = binary_search(arr[(middle+1)..-1], target)
        v < 0 ? v : (v + middle + 1)
    else
        middle
    end
end
