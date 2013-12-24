/*
 * Copyright (c) 2013 Nate Craun
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 * IN THE SOFTWARE.
 */

/*
 * ANSI C implementation of Kruskal's algorithm for minimum spanning trees
 * using disjoint sets union find. Given a connected undirected graph, this
 * will connect all vertices in a tree with the minimum cost in O(|E|log|V|)
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Disjoint_Set {
    unsigned int *parent;
    unsigned int *rank;
    unsigned int vertices;
};

typedef struct Disjoint_Set Disjoint_Set;

/* An edge is from vertex u to vertex v with cost of c. */
struct Edge {
    unsigned int u;
    unsigned int v;
    unsigned int c;
};

typedef struct Edge Edge;

/* Creates a new disjoint set. */
void
init_ds(Disjoint_Set *ds, int vertices)
{
    ds->parent = malloc(vertices * sizeof(unsigned int));
    ds->rank = malloc(vertices * sizeof(unsigned int));
    ds->vertices = vertices;

}

/* Clean up the allocated memory of a disjoint set. */
void
free_ds(Disjoint_Set *ds)
{
    free(ds->parent);
    free(ds->rank);
}

/* Create a new set within the disjoint sets containing x. */
void
ds_make_set(Disjoint_Set *ds, int x)
{
    ds->parent[x] = x;
    ds->rank[x] = 0;
}

/*
 * Find which set x belongs to. Performs path compression for more efficient
 * searching.
 */
unsigned int
ds_find(Disjoint_Set *ds, int x)
{
    if (ds->parent[x] != x) {
        ds->parent[x] = ds_find(ds, ds->parent[x]);
    }

    return ds->parent[x];
}

/* 
 * Union two of the disjoint sets together using the union by rank heuristic.
 */
void
ds_union(Disjoint_Set *ds, int x, int y)
{
    unsigned int xroot = ds_find(ds, x);
    int yroot = ds_find(ds, y);

    if (xroot == yroot) {
        return;
    }

    if (ds->rank[xroot] < ds->rank[yroot]) {
        ds->parent[xroot] = yroot;
    }
    else if (ds->rank[xroot] > ds->rank[yroot]) {
        ds->parent[yroot] = xroot;
    }
    else {
        ds->parent[yroot] = xroot;
        ds->rank[xroot] += 1;
    }
}

/* Edge comparison based on cost, for qsort. */
int
edge_compare(const void *a, const void *b)
{
    Edge *e1 = (Edge *)a;
    Edge *e2 = (Edge *)b;

    return e1->c - e2->c;
}

/*
 * Find the minimum spanning tree using Kruskals algorithm, implemented with
 * disjoint sets. Only finds the cost of the MST, if you want the tree itself,
 * return the edges added by the algorithm.
 */
unsigned int
kruskal_mst(Edge *edges, int num_vertices, int num_edges)
{
    int i;
    unsigned int cost = 0;
    
	Disjoint_Set ds;
    init_ds(&ds, num_vertices);

    /* Create the forest, 1 tree per vertex */

    for (i = 0; i < num_vertices; i++) {
        ds_make_set(&ds, i);
    }


    /* sort edge list */
    qsort(edges, num_edges, sizeof(Edge), edge_compare);

    /* Add the smallest edge that connects two distinct trees */
    for (i = 0; i < num_edges; i++) {
        Edge e = edges[i];

        if (ds_find(&ds, e.u) != ds_find(&ds, e.v)) {
            ds_union(&ds, e.u, e.v);
            cost += e.c;
        }
    }

    free_ds(&ds);
    return cost;
}
