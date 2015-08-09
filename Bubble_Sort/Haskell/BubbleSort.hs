module BubbleSort (bubbleSort) where

bubble :: (Ord a) => [a] -> [a]
bubble [] = []
bubble [a] = [a]
bubble (x:y:z) = min x y : bubble ((max x y):z)


bubbleSort :: (Ord a) => [a] -> [a]
bubbleSort [] = []
bubbleSort xs = helpbubble (length xs) xs
                where helpbubble 1 xs = bubble xs
                      helpbubble n xs = helpbubble (n-1) $ bubble xs
