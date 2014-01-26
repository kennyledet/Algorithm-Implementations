-- A point graph handler

-- This handler is devised for waypoints graphs.
-- Waypoints are locations represented via labelled nodes
-- and are connected with edges.
-- It assumes edges are symmetric, that is if an edge exists
-- between a and b, (a -> b) ==  (b -> a)

-- Implements Node class (from node.lua)
local Node = require 'node'
function Node:initialize(name) self.name = name end
function Node:toString() return ('Node: %s'):format(self.name) end
function Node:isEqualTo(n) return self.name == n.name end

-- Internal graph data
local graph = {nodes = {}, edges = {}}

-- Looks for an edge between a and b.
local function find_edge(edges_list, a, b)
  for _, edge in ipairs(edges_list) do
    if (edge.from == a and edge.to == b)
    or (edge.from == b and edge.to == a)
    then
      return edge
    end
  end
end

-- Handler implementation
local handler = {}

-- Returns a Node
function handler.getNode(name) return Node(name) end

-- Adds a new node labelled with name
function handler.addNode(name) graph.nodes[name] = Node(name) end

-- Adds a new edge between nodes labelled from and to
function handler.addEdge(from, to)
  table.insert(graph.edges,
    {from = graph.nodes[from], to = graph.nodes[to]})
end

-- Returns an array of neighbors of node n
function handler.getNeighbors(n)
  local neighbors = {}
  for _, edge in ipairs(graph.edges) do
    if edge.from == n then
      table.insert(neighbors, edge.to)
    elseif edge.to == n then
      table.insert(neighbors, edge.from)
    end
  end
  return neighbors
end

return handler
