/*
    Author: Darrin Schmitz
    Sources/resources to help you better understand the algorithm:
    http://www.geeksforgeeks.org/greedy-algorithms-set-6-dijkstras-shortest-path-algorithm/
    https://www.youtube.com/watch?v=8Ls1RqHCOPw
    https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm
*/

#include <stdio.h>
#include <limits.h>
#include <assert.h>

#define VERTICES 9       
#define INFINITY INT_MAX

int dijkstra(int graph[VERTICES][VERTICES], int source, int destination)
{
    int i = 0;
    int v = 0;
    int distance[VERTICES]; // distance[i] holds the distance from source to a vertex.
    int shortest[VERTICES]; // shortest[i] will be 1 (true) if the distance to that vertex
                            // is found to be the shortest during an iteration. 
 
    // Initialize all distances as INFINITE and all found shortest distances to 0 (false).
    for (i = 0; i < VERTICES; i++)
    {
        distance[i] = INFINITY;
        shortest[i] = 0;
    }
 
    distance[source] = 0; // The distance from the source vertex to itself is 0.
 
    // Find shortest path for all vertices.
    for (i = 0; i < VERTICES - 1; i++)
    {
        // Pick the minimum distance vertex from the array of vertices not yet processed.
        int minV = minDistance(distance, shortest);
        
        shortest[minV] = 1; // Mark the picked vertex as processed
 
        // Update distance value of the adjacent vertices of the picked vertex.
        for (v = 0; v < VERTICES; v++)
        {
            // Update distance[v] only if is not in shortest, there is an edge from 
            // minV to v, and total weight of path from source to v through minV is 
            // smaller than current value of distance[v].
            if (!shortest[v] && graph[minV][v] && ((distance[minV] + graph[minV][v]) < distance[v]))
            {
                distance[v] = distance[minV] + graph[minV][v];
            }
        }
    }
    return distance[destination];
}

// A utility function to find the vertex with the smallest distance value from
// the set of vertices not yet included in shortest[].
int minDistance(int distance[], int shortest[])
{
    int minV = INFINITY;
    int min_index;
    int i;
    
    for (i = 0; i < VERTICES; i++)
        if (shortest[i] == 0 && distance[i] <= minV)
        {
            minV = distance[i];
            min_index = i;
        }
    return min_index;
}

int main()
{
    // Visual representation of the graph can be found at the 
    // geeksforgeeks website at the top of the file.
    int graph[VERTICES][VERTICES] = {{0, 4, 0, 0, 0, 0, 0, 8, 0},
                                     {4, 0, 8, 0, 0, 0, 0, 11, 0},
                                     {0, 8, 0, 7, 0, 4, 0, 0, 2},
                                     {0, 0, 7, 0, 9, 14, 0, 0, 0},
                                     {0, 0, 0, 9, 0, 10, 0, 0, 0},
                                     {0, 0, 4, 14, 10, 0, 2, 0, 0},
                                     {0, 0, 0, 0, 0, 2, 0, 1, 6},
                                     {8, 11, 0, 0, 0, 0, 1, 0, 7},
                                     {0, 0, 2, 0, 0, 0, 6, 7, 0}
                                    };
    
    printf("\nThe ditance from vertex %d to vertex %d is: %d\n", 0, 4, dijkstra(graph, 0, 4));
    assert(dijkstra(graph, 0, 4) == 21);
    
    printf("The ditance from vertex %d to vertex %d is: %d\n", 4, 0, dijkstra(graph, 4, 0));
    assert(dijkstra(graph, 4, 0) == 21);
    
    printf("The ditance from vertex %d to vertex %d is: %d\n", 1, 5, dijkstra(graph, 1, 5));
    assert(dijkstra(graph, 1, 5) == 12);
    
    printf("The ditance from vertex %d to vertex %d is: %d\n", 3, 7, dijkstra(graph, 3, 7));
    assert(dijkstra(graph, 3, 7) == 14);
    
    printf("The ditance from vertex %d to vertex %d is: %d\n\n", 1, 6, dijkstra(graph, 1, 6));
    assert(dijkstra(graph, 1, 6) == 12);
    return 0;
}
