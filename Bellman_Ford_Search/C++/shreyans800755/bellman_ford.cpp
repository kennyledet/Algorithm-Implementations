#include <iostream>
#include <vector>
#include <cassert>
#include <climits>

/**
* Bellman-ford algorithm is single source shortest distance algorithm that
* works for positive and negative both types of edges.
* 1. Initialize distance from source all the vertices as infinity, but source itself.
*    Distance to source will be zero.
* 2. Select any edge u-v
* 3. If dist[v] > dist[u] + weight(u-v), then dist[v] = dist[u] + weight(u-v)
* 4. Execute step 2 and 3 for all the edges in the graph.
* 5. Iterate steps 2 to 4 (V - 1) times, where V is number of vertices in the graph.
* 6. For any edge u-v, if dist[v] > dist[u] + weight(u-v), then graph contains negative cycles.
*/

class Edge
{
public:
	Edge(long long src, long long dest, long long weight) : _src(src), _dest(dest), _weight(weight)
	{
	}
	int getSrc() const
	{
		return _src;
	}
	int getDest() const
	{
		return _dest;
	}
	long long getWeight() const
	{
		return _weight;
	}
private:
	int _src, _dest;
	long long _weight;;
};

class Graph
{
public:
	Graph(int v) : _v(v)
	{
	}
	void addEdge(int a, int b, int wt)
	{
		assert(0 <= a && a < _v);
		assert(0 <= b && b < _v);
		_edges.push_back(Edge(a, b, wt));
	}
	int getV() const
	{
		return _v;
	}
	const std::vector<Edge> getEdges() const
	{
		return _edges;
	}
private:
	std::vector<Edge> _edges;
	int _v;
};

// Stores shortest distance in the vector result, and returns true if no negative cycles present.
// Returns false otherwise.
bool bellmanFord(const Graph& g, int src, std::vector<long long>& result)
{
	result.clear();
	result.reserve(g.getV());
	for(int i = 0; i < g.getV(); i++)
		result.push_back(INT_MAX);
	result[src] = 0;

	auto edgeList = g.getEdges();
	for(int i = 0; i < g.getV() - 1; i++)
	{
		for(const auto edge: edgeList)
		{
			if(result[edge.getDest()] > result[edge.getSrc()] + edge.getWeight())
				result[edge.getDest()] = result[edge.getSrc()] + edge.getWeight();
		}
	}
	for(const auto edge: edgeList)
	{
		if(result[edge.getDest()] > result[edge.getSrc()] + edge.getWeight())
		{
			result.clear();
			return true;
		}
	}
	return false;
}

const Graph& test1()
{
	const int vertices = 6;
	static Graph g(vertices);

	g.addEdge(0, 2, 2);
	g.addEdge(1, 0, 1);
	g.addEdge(2, 1, -2);
	g.addEdge(3, 0, -4);
	g.addEdge(3, 2, -1);
	g.addEdge(4, 3, 1);
	g.addEdge(5, 0, 10);
	g.addEdge(5, 4, 8);

	return g;
}

const Graph& test2()
{
	const int vertices = 3;
	static Graph g(vertices);

	g.addEdge(0, 2, -2);
	g.addEdge(1, 0, 1);
	g.addEdge(2, 1, -5);

	return g;
}

int main()
{
	Graph g1 = test1();

	std::vector<long long> result;
	bool cycle = bellmanFord(g1, 5, result);

	std::cout << "Test 1: " << std:: endl
			  << "Result for vertice 5 as source:" << std::endl;
	if(not cycle)
	{
		for(auto distance: result)
			std::cout << distance << ' ';
	}
	else
		std::cout << "Negative cycle is present in the graph";
	std::cout << std::endl << std::endl;

	std::cout << "Test 2: " << std:: endl
			  << "Result for vertice 1 as source:" << std::endl;


	g1 = test2();
	cycle = bellmanFord(g1, 1, result);
	if(not cycle)
	{
		for(auto distance: result)
			std::cout << distance << ' ';
	}
	else
		std::cout << "Negative cycle is present in the graph";
	std::cout << std::endl << std::endl;

	return 0;
}
