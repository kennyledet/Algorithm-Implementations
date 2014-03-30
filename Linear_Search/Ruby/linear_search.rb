def linear_search(array, value)
    for element in 0..array.length
        if array[element] == value
            return element
        end
    end

    return -1
end