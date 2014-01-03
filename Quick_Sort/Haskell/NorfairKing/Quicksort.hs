module Quicksort ( quicksort ) where

quicksort [] = []
quicksort (pivot:rest) = (quicksort smaller) ++ [pivot] ++ (quicksort greater)
    where
        greater = [ x | x <- rest, x >  pivot ]
        smaller = [ x | x <- rest, x <= pivot ]
