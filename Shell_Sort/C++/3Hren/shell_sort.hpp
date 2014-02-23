#pragma once

#include <iostream>

struct knuth_gap_generator_t {
    template<typename T>
    static int next_gap_value(T gap) {
        return 3 * gap + 1;
    }

    template<typename T>
    static int prev_gap_value(T gap) {
        return (gap - 1) / 3;
    }
};

template<class GapGenerator, class RandomAccessIterator>
inline int init_gap(RandomAccessIterator begin, RandomAccessIterator end) {
    typedef typename std::iterator_traits<RandomAccessIterator>::difference_type difference_type;

    difference_type gap = 0;
    const difference_type size = std::distance(begin, end);
    while (true) {
        const difference_type next = GapGenerator::next_gap_value(gap);
        if (next > size) {
            break;
        }

        gap = next;
    }

    return gap;
}

template<class RandomAccessIterator>
void insertion_sort(RandomAccessIterator begin, RandomAccessIterator end, typename std::iterator_traits<RandomAccessIterator>::difference_type gap = 1) {
    for (RandomAccessIterator i = begin + gap; i != end; ++i) {
        for (RandomAccessIterator j = i; j >= begin + gap; j -= gap) {
            if (*j < *(j - gap)) {
                std::iter_swap(j, j - gap);
            } else {
                break;
            }
        }
    }
}

template<class RandomAccessIterator, class GapGenerator = knuth_gap_generator_t>
void shell_sort(RandomAccessIterator begin, RandomAccessIterator end) {
    int gap = init_gap<GapGenerator>(begin, end);

    while (gap >= 1) {
        insertion_sort(begin, end, gap);
        gap = GapGenerator::prev_gap_value(gap);
    }
}
