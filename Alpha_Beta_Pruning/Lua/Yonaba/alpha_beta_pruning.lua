
local function alphabeta(handler, node, depth, alpha, beta, maximize)
  if depth == 0 then
    return handler.heuristic(node)
  end
  local successors = handler.getNeighbors(node)
  if maximize then
    for i, successor in ipairs(successors) do
      alpha = math.max(alpha, alphabeta(handler, successor, depth - 1, alpha, beta, false))
      if beta <= alpha then break end
      return alpha
    end
  else
    for i, successor in ipairs(successors) do
      beta = math.min(alpha, alphabeta(handler, successor, depth - 1, alpha, beta, true))
      if beta <= alpha then break end
      return beta
    end
  end
end

function AlphaBeta(node, depth, handler)
  return alphabeta(handler, node, depth, -math.huge, math.huge, true)
end

return AlphaBeta
