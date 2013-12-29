module AStarSearch where

import qualified Data.PQueue.Prio.Min as PQ
import qualified Data.HashSet as Set
import qualified Data.HashMap.Strict as Map
import Data.Hashable (Hashable)
import Data.List (foldl')
import Data.Maybe (fromJust)

-- A* search: Finds the shortest path from a start node to a goal node using a heuristic function.
astarSearch :: (Eq a, Hashable a) =>
  a                     -- startNode: the node to start the search from
  -> (a -> Bool)        -- isGoalNode: a function to test if a node is the goal node
  -> (a -> [(a, Int)])  -- nextNodeFn: a function which calculates the next nodes for a current node
                        -- along with the costs of moving from the current node to the next nodes
  -> (a -> Int)         -- heuristic: a function which calculates the (approximate) cost of moving
                        -- from a node to the nearest goal node
  -> Maybe (Int, [a])   -- result: Nothing is no path is found else
                        -- Just (path cost, path as a list of nodes)
astarSearch startNode isGoalNode nextNodeFn heuristic =
  astar (PQ.singleton (heuristic startNode) (startNode, 0))
         Set.empty (Map.singleton startNode 0) Map.empty
  where
    -- pq: open set, seen: closed set, tracks: tracks of states
    astar pq seen gscore tracks
      -- If open set is empty then search has failed. Return Nothing
      | PQ.null pq = Nothing
      -- If goal node reached then construct the path from the tracks and node
      | isGoalNode node = Just (gcost, findPath tracks node)
      -- If node has already been seen then discard it and continue
      | Set.member node seen = astar pq' seen gscore tracks
      -- Else expand the node and continue
      | otherwise = astar pq'' seen' gscore' tracks'
      where
        -- Find the node with min f-cost
        (node, gcost) = snd . PQ.findMin $ pq

        -- Delete the node from open set
        pq' = PQ.deleteMin pq

        -- Add the node to the closed set
        seen' =  Set.insert node seen

        -- Find the successors (with their g and h costs) of the node
        -- which have not been seen yet
        successors =
          filter (\(s, g, _) ->
                    not (Set.member s seen') &&
                      (not (s `Map.member` gscore)
                        || g < (fromJust . Map.lookup s $ gscore)))
          $ successorsAndCosts node gcost

        -- Insert the successors in the open set
        pq'' = foldl' (\q (s, g, h) -> PQ.insert (g + h) (s, g) q) pq' successors

        gscore' = foldl' (\m (s, g, _) -> Map.insert s g m) gscore successors

        -- Insert the tracks of the successors
        tracks' = foldl' (\m (s, _, _) -> Map.insert s node m) tracks successors

    -- Finds the successors of a given node and their costs
    successorsAndCosts node gcost =
      map (\(s, g) -> (s, gcost + g, heuristic s)) . nextNodeFn $ node

    -- Constructs the path from the tracks and last node
    findPath tracks node =
      if Map.member node tracks
      then findPath tracks (fromJust . Map.lookup node $ tracks) ++ [node]
      else [node]
