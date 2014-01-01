def maximum_subarray(arr)
    if arr.length < 1
        return 0
    end

    cur_max, max_so_far = arr.first, arr.first

    # arr[1..-1] is getting everything,
    # but the first element of the array.
    # It is equivalent to (cdr arr) in Lisp/Scheme etc.
    arr[1..-1].each do |v|
        cur_max = [cur_max+v, v].max
        max_so_far = [cur_max, max_so_far].max
    end

    # Ruby automatically returns the last evaluated
    # expression, so we've no need for return
    max_so_far
end


def maximum_subarray_functional(arr)
    # This is the functional one-liner of Kadane's algorithm
    # The accumulator in reduce is an array containing:
    # [0] - maximum sum so far
    # [1] - current maximum streak
    arr[1..-1].reduce([arr[0], arr[0]]) { |mem, n| c = [n, mem[1]+n].max; [[mem[0], c].max, c] }[0]
end