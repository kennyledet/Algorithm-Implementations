-- A point graph with symmetric edges handler

local Node_mt = {
	__eq = function(a, b) return (a.name == b.name) end,
  __lt = function(a, b) return a.f < b.f end,
	__tostring = function(a) return a.name end
}

local function Node(name)
	return setmetatable({name = name, g = 0, h = 0, f = 0},Node_mt)
end

local graph = {nodes = {}, edges = {}}

local handler = {}

local function find_edge(edges_list, a, b)
  for _, edge in ipairs(edges_list) do
    if (edge.from == a and edge.to == b)
    or (edge.from == b and edge.to == a)
    then
      return edge
    end
  end
end

function handler.makeNode(name)
  return Node(name)
end

function handler.distance(a, b)
  local e = find_edge(graph.edges, a, b)
  return e and e.weight or 0
end

function handler.addNode(name)
  graph.nodes[name] = Node(name)
end

function handler.addEdge(from, to, weight)
  assert(graph.nodes[from], 'Node from not found in the graph')
  assert(graph.nodes[to], 'Node to not found in the graph')
  table.insert(graph.edges,{from = graph.nodes[from], to = graph.nodes[to], weight = weight})
end

function handler.getNeighbors(node)
  local neighbors = {}
  for _, edge in ipairs(graph.edges) do
    if edge.from == node then
      table.insert(neighbors, edge.to)
    elseif edge.to == node then
      table.insert(neighbors, edge.from)
    end
  end
  return neighbors
end

return handler
