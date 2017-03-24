#pragma once

#include <iostream>
#include <vector>
#include <iterator>
#include <algorithm> // hehe... algoception :)
#include <list>

// an undirected graph
template<class Type>
class Graph
{
public:
    int vertices;
    int edges;
    std::vector<std::vector<Type>> adjList;

    explicit Graph(int numVertices)
        :vertices(numVertices), edges(0)
    {
        adjList = std::vector<std::vector<Type>>(vertices);
        std::generate(adjList.begin(), adjList.end(), []{
           return std::vector<Type>{};
        });
    }

    ~Graph() = default;

    void add(Type v, Type w) {
        adjList[v].push_back(w);
        adjList[w].push_back(v);
        edges++;
    }

    std::vector<Type>& adj(Type v) {
        return adjList[v];
    }

    std::string to_string() const {
        std::string str;
        for (int i = 0; i < vertices; i++) {
            str += std::to_string(i) + "\n";
            for (auto t : adj(i)) {
                str += "\t" + t;
            }
        }

        return str;
    }
};

template<class Type>
class DepthFirstSearch {
    const Type startVertex;
    Graph<Type>& graph;
    std::vector<bool> markedVertexes;
public:
    DepthFirstSearch(Graph<Type>& _graph, Type _startVertex)
        :startVertex(_startVertex), graph(_graph)
    {
        markedVertexes = std::vector<bool>(_graph.vertices);
    }

    void dfs() {
        dfs_impl(graph, this->startVertex);
    }

    void dfs_impl(Graph<Type>& _graph, Type start) {
        markedVertexes[start] = true;
        for (const Type& t : _graph.adj(start)) {
            if (!markedVertexes[t]) {
                dfs_impl(_graph, t);
            }
        }
    }
};




