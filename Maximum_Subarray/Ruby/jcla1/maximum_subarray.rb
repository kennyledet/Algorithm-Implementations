def maximum_subarray(arr)
    if arr.length < 1
        return 0
    end

    cur_max, max_so_far = arr.first, arr.first

    arr[1..-1].each do |v|
        cur_max = [cur_max+v, v].max
        max_so_far = [cur_max, max_so_far].max
    end

    max_so_far
end