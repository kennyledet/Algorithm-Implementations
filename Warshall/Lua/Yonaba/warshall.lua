-- Warshall algorithm implementation
-- See : http://en.wikipedia.org/wiki/Transitive_closure
-- See : http://www.sroede.nl/pages/warshall/

-- This algorithm evaluates the transitive closure of a given matrix
--  See : http://en.wikipedia.org/wiki/Transitive_closure#In_graph_theory

-- Note : this implementation is close to Floyd-Warshall algorithm
--  See : http://en.wikipedia.org/wiki/Floyd%E2%80%93Warshall_algorithm

-- Creates a adjacency matrix for a graph of n nodes
-- G       : A boolean adjacency matrix for an input graph
-- returns :  the transitive closure of the given matrix
return function (G)
  local A, n = {}, #G

  for i = 1, n do A[i] = {}
    for j = 1,n do A[i][j] = G[i][j] end
  end

  for k = 1, n do
    for i = 1, n do
      for j = 1, n do
        A[i][j] = A[i][j] or (A[i][k] and A[k][j])
      end
    end
  end

  return A
end

