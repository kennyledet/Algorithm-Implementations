module CollatzChain ( chain ) where

chain :: Int -> [Int]
chain 1 = [1]
chain n
    | even n = n:chain (n `div` 2)
    | odd n = n:chain (n*3 + 1)
