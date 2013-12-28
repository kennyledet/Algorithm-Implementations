module AStarSearchTest where

import AStarSearch
import Data.Maybe (fromJust)

-- We use A* search to find the shortest path (path with least number of moves) of a knight
-- from a start square to a goal square on a chess board.

-- Finds the next squares a knight can move to from a given square
nextKnightPos (x, y) =
	zip (filter isValidMove . map (\(dx, dy) -> (x + dx, y + dy)) $ moves) (repeat 1)
	where
    moves = [(1,2), (1,-2), (-1,2), (-1,-2), (2,1), (2,-1), (-2,1), (-2,-1)]
    isValidMove (x, y) = and [x > 0, x < 9, y > 0, y < 9]

-- Creates the heuristic function given a goal square. The heuristic used is half of the max of
-- the distance between x coordinates and the distance between y coordinates.
mkHeuristic (gx, gy) (x, y) = max (abs (x-gx)) (abs (y-gy)) `div` 2

-- Finds the shortest path of the knight
knightsShortestPath :: (Int, Int) -> (Int, Int) -> [(Int, Int)]
knightsShortestPath initSq goalSq =
  snd . fromJust $ astarSearch initSq (== goalSq) nextKnightPos (mkHeuristic goalSq)

-- example runs
main :: IO ()
main = do
  print $ knightsShortestPath (1,1) (2,2)
  -- prints [(1,1),(3,2),(5,3),(4,1),(2,2)]
  print $ knightsShortestPath (4,1) (7,2)
  -- prints [(4,1),(5,3),(7,2)]
  print $ knightsShortestPath (4,1) (8,7)
  -- prints [(4,1),(6,2),(5,4),(7,5),(8,7)]
  print $ knightsShortestPath (8,1) (7,8)
  -- prints [(8,1),(7,3),(8,5),(6,6),(7,8)]
  print $ knightsShortestPath (1,1) (8,8)
  -- prints [(1,1),(2,3),(3,5),(4,3),(5,5),(7,6),(8,8)]
  print $ knightsShortestPath (1,1) (1,1)
  -- prints [(1,1)]
  return ()
