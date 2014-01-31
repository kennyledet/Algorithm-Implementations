-- Floyd-Warshall "all pairs-shortest" algorithm implementation
-- See : http://en.wikipedia.org/wiki/Floyd%E2%80%93Warshall_algorithm

-- Note : this implementation (and tests) were roughly translated to
--  Lua from Diego Allen's implementation of the same problem.
--  See : https://github.com/kennyledet/Algorithm-Implementations/tree/master/Floyd_Warshall/Java/dalleng

-- Creates a adjacency matrix for a graph of n nodes
-- n       : the number of nodes in the graph
-- returns :  an adjacency matrix, where each (i,i) == 0 and each(i,j) == inf.
local function makeGraph(n)
  local graph = {}
  for i = 1, n do graph[i] = {}
    for j = 1, n do
      graph[i][j] = (i == j) and 0 or math.huge
    end
  end
  return graph
end

-- Adds a weighted edge to a graph
-- g : the graph's adjacency matrix
-- s : the start node
-- e : the end node
-- w : the edge weight (can either be positive or negative)
local function addEdge(graph, s, e, w)
  graph[s][e] = w
end

-- Performs Floyd-Warshall dynamic search.
-- graph   : an adjacency matrix
-- Returns : 1. a table of shortest distances
--           2. a boolean: true if negative cycles were detected, false otherwise
local function floydWarshall(graph)
  local distances = {}
  local n = #graph
  local hasNegativeCycles = false
  
  -- Copies the original array
  for i = 1, n do distances[i] = {}
    for j = 1, n do distances[i][j] = graph[i][j] end
  end
  
  -- Dynamic search
  for k = 1, n do
    for i = 1, n do
      for j = 1, n do
        distances[i][j] = math.min(distances[i][j], distances[i][k] + distances[k][j])
      end
    end
    if distances[k][k] < 0 then hasNegativeCycles = true end
  end
  return distances, hasNegativeCycles
end

return {
  makeGraph = makeGraph,
  addEdge = addEdge,
  floydWarshall = floydWarshall
}
