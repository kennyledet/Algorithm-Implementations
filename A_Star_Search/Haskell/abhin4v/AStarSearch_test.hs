{-# LANGUAGE TemplateHaskell, GeneralizedNewtypeDeriving #-}

module AStarSearchTest where

import AStarSearch
import Data.Hashable (Hashable)
import Data.List (foldl')
import Data.Maybe (fromJust, fromMaybe)
import Data.Sequence ((|>))
import Test.QuickCheck
import Test.QuickCheck.All
import qualified Data.HashMap.Strict as Map
import qualified Data.Sequence as Seq

-- We use A* search to find the shortest path (path with least number of moves) of a knight
-- from a start square to a goal square on a chess board.

newtype Square = Square (Int, Int) deriving (Eq, Hashable, Show)
type Path = [Square]

-- Finds the next squares a knight can move to from a given square
nextKnightPos (Square (x, y)) =
  map Square . filter isValidMove . map (\(dx, dy) -> (x + dx, y + dy)) $ moves
  where
    moves = [(1,2), (1,-2), (-1,2), (-1,-2), (2,1), (2,-1), (-2,1), (-2,-1)]
    isValidMove (x, y) = and [x > 0, x < 9, y > 0, y < 9]

-- Creates the heuristic function given a goal square. The heuristic used is half of the max of
-- the distance between x coordinates and the distance between y coordinates.
mkHeuristic (Square (gx, gy)) (Square (x, y)) = max (abs (x-gx)) (abs (y-gy)) `div` 2

-- Finds the shortest path of the knight, returns empty path if the goal is invalid
knightsShortestPath :: Square -> Square -> Path
knightsShortestPath initSq goalSq =
  snd . fromMaybe (0, [])
  $ astarSearch initSq (== goalSq) (flip zip (repeat 1) . nextKnightPos) (mkHeuristic goalSq)

-- Finds the shortest path using breadth first search. Used for checking if the path returned by
-- A* search is indeed shortest.
bfs :: Square -> Square -> Path
bfs startSq goalSq =
  bfs' goalSq (Map.singleton startSq noSuchSq) (Seq.singleton startSq)
  where
    noSuchSq = Square (-1, -1)

    bfs' goalSq tracks open = let
      (first, rest) = Seq.splitAt 1 open
      currentSq = Seq.index first 0
      in if currentSq == goalSq
         then consPath currentSq
         else let
           nextSqs = filter (not . flip Map.member tracks) . nextKnightPos $ currentSq
           tracks' = foldl' (\t s -> Map.insert s currentSq t) tracks nextSqs
           in bfs' goalSq tracks' (foldl (|>) rest nextSqs)
      where
        consPath square =
          if Map.member square tracks
          then consPath (fromJust . Map.lookup square $ tracks) ++ [square]
          else []

-- Setup to generate arbitrary squares for testing
instance Arbitrary Square where
  arbitrary = do
    x <- choose (1, 8)
    y <- choose (1, 8)
    return $ Square (x, y)

-- Properties to test
prop_path_starts_with_start_square startSq goalSq =
  head (knightsShortestPath startSq goalSq) == startSq

prop_path_ends_with_goal_square startSq goalSq =
  last (knightsShortestPath startSq goalSq) == goalSq

prop_path_consists_of_valid_knights_moves startSq goalSq =
  let path = knightsShortestPath startSq goalSq
  in all isValidKnightsMove $ zip path (tail path)
  where
    isValidKnightsMove (sqFrom, sqTo) = sqTo `elem` nextKnightPos sqFrom

prop_no_path_for_invalid_goal startSq =
  knightsShortestPath startSq (Square (-1, -1)) == []

prop_path_is_shortest startSq goalSq =
  length (knightsShortestPath startSq goalSq) == length (bfs startSq goalSq)

-- Tests all the properties 1000 times each
testAllProps = $forAllProperties $ quickCheckWithResult (stdArgs {maxSuccess = 1000})

-- main function runs the tests. Type `runhaskell AStarSearch_test.hs` on command line to run the tests.
main = testAllProps >> return ()
