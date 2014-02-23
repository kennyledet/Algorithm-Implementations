#include <assert.h>

#include <cstdlib>
#include <iostream>
#include <vector>

#include "shell_sort.hpp"

namespace aux {

template<class RandomAccessIterator>
bool is_sorted(RandomAccessIterator begin, RandomAccessIterator end) {
    for (RandomAccessIterator it = begin; it != end - 1; ++it) {
        if (*it > *(it + 1)) {
            return false;
        }
    }

    return true;
}

} // namespace aux

int main(int argc, char** argv) {
    if (argc != 2) {
        std::cerr << "Usage: shell_sort_test N" << std::endl;
        exit(1);
    }

    const int N = std::stoi(argv[1]);

    std::srand(std::time(0));

    std::vector<int> data;
    data.reserve(N);
    for (int i = 0; i < N; ++i) {
        data.push_back(std::rand() % N);
    }

    shell_sort(data.begin(), data.end());

    assert(aux::is_sorted(data.begin(), data.end()));
}
