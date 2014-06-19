--maxSubarray :: (Num a, Ord a) => [a] -> a
maxSubarray [x] = x
maxSubarray (x:xs) = snd $ foldl msReducer (x, x) xs

msReducer (maxEndingHere, maxSoFar) x = (meh, maxSoFar `max` meh)
    where meh = x `max` (maxEndingHere + x)




main = putStrLn "Hello World"