#include <iostream>
#include <string>
#include "graph.h"


int main() {
    int key = 0;
    Graph<int> g(13);
    g.add(0, 5);
    g.add(0, 6);
    g.add(1, 6);

    DepthFirstSearch<int> depthFirstSearch(g, 6);
    depthFirstSearch.dfs();

    std::cin >> key;
}
