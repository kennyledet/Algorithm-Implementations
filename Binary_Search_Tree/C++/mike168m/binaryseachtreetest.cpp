#include <iostream>
#include "binarysearchtree.h"


// test binary search tree
int main() {
    BinarySearchTree<int> tree;

    tree.insert(0);
    tree.insert(4);
    tree.insert(3);
    tree.insert(2);
    tree.insert(1);

    if (tree.contains(1)) {
        std::cout << "Item found" << std::endl;
    }

    int max = tree.findMax();
    int min = tree.findMin();

    std::cout << "The maximum element: " <<  max << std::endl;
    std::cout << "The minimum element: " << min << std::endl;

    return 0;
}
