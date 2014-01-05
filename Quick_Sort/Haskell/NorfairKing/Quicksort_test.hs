module Quicksort_test (main) where
import Quicksort ( quicksort )

main = do
    let list = [1..5] ++ [1,3,4,6,2]  ++ [5..1]
    putStrLn "Unsorted: "
    putStrLn (show list)
    putStrLn ""
    putStrLn "|"
    putStrLn "v"
    putStrLn ""
    putStrLn "Sorted: "
    putStrLn $ (show . quicksort) list 
