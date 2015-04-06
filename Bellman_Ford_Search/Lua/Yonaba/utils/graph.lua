-- A point graph handler

-- This handler is devised for way-points graphs.
-- Way-points are locations represented via labelled nodes
-- and are connected with edges having a positive or negative weight.
-- It assumes edges are non-symmetric, that is if an edge exists from
-- a to b, it does not mean there is also an edge from b to a, unless it is
-- explicitly defined.

local PATH = (...):gsub('%.graph$','')
local Node = require (PATH .. '.node')

-- Implements Node class (from utils/node.lua)
function Node:initialize(name) self.name = name end
function Node:toString() return ('Node: %s - %.2f'):format(self.name, self.distance) end

-- Internal graph data
local graph = {nodes = {}, edges = {}}

-- Looks for an edge between a and b.
local function find_edge(edges_list, a, b)
  for _, edge in ipairs(edges_list) do
    if (edge.from == a and edge.to == b) then
      return edge
    end
  end
end

-- Collects values from a map-table to an array
local function collect(map)
  local array = {}
  for _, element in pairs(map) do table.insert(array, element) end
  return array
end

-- Handler implementation
local handler = {}

-- Returns an array of all nodes in the graph
function handler.getAllNodes() return collect(graph.nodes) end

-- Returns an array of all edges in the graph
function handler.getAllEdges() return collect(graph.edges) end

-- Returns a Node
function handler.getNode(name) return graph.nodes[name] end

-- Adds a new node labelled with name
function handler.addNode(name) graph.nodes[name] = Node(name) end

-- Adds a new edge between nodes labelled from and to
function handler.addEdge(from, to, weight)
  table.insert(graph.edges,
    {from = graph.nodes[from], to = graph.nodes[to], weight = weight or 0})
end

-- Sets the weight of edge from -> to
function handler.setEdgeWeight(from, to, weight)
  local e = find_edge(graph.edges, graph.nodes[from], graph.nodes[to])
  if e then e.weight = weight end
end

return handler
