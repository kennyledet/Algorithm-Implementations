-- Alpha-beta pruning search implementation
-- See: http://en.wikipedia.org/wiki/Alpha%E2%80%93beta_pruning

-- Internal recursive alpha-beta pruning search
local function alphabeta(tree, node, depth, alpha, beta, maximize)
  if depth == 0 or tree:isLeaf(node) then
    return tree:heuristic(node)
  end
  local children = tree:children(node)
  if maximize then
    for i, child in ipairs(children) do
      alpha = math.max(alpha,
        alphabeta(tree, child, depth - 1, alpha, beta, false))
      if beta <= alpha then break end
    end
    return alpha
  else
    for i, child in ipairs(children) do
      beta = math.min(beta,
        alphabeta(tree, child, depth - 1, alpha, beta, true))
      if beta <= alpha then break end
    end
    return beta
  end
end

-- Performs alpha-beta pruning search
-- node : the node from where to start the search, usually the head node
-- tree : the search tree
-- depth : the maximum depth of search
return function(node, tree, depth)
  return alphabeta(tree, node, depth, -math.huge, math.huge, true)
end


