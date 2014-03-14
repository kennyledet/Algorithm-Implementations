
local function alphabeta(tree, node, depth, alpha, beta, maximize)
  if depth == 0 or tree:isLeaf(node) then
    return tree:heuristic(node)
  end
  local children = tree:children(node)
  if maximize then
    for i, child in ipairs(children) do
      alpha = math.max(alpha, alphabeta(tree, child, depth - 1, alpha, beta, false))
      if beta <= alpha then break end
    end
		return alpha
  else
    for i, child in ipairs(children) do
      beta = math.min(beta, alphabeta(tree, child, depth - 1, alpha, beta, true))
      if beta <= alpha then break end
    end
		return beta
  end
end

return AlphaBeta(node, tree, depth)
  return alphabeta(tree, node, depth, -math.huge, math.huge, true)
end


