maxSubarray :: (Num a, Ord a) => [a] -> a
maxSubarray [x] = x
maxSubarray (x:xs) = snd $ foldl msReducer (x, x) xs

msReducer :: (Num a, Ord a) => (a, a) -> a -> (a, a)
msReducer (maxEndingHere, maxSoFar) x = (meh, maxSoFar `max` meh)
    where meh = x `max` (maxEndingHere + x)

testMaxSubarray :: Bool
testMaxSubarray = and $ map (\ (xs, e) -> e == (maxSubarray xs)) testCases
    where testCases = [([-2, 1, -3, 4, -1, 2, 1, -5, 4], 6)] ++
                      [([2, 3, 7, -5, -1, 4, -10], 12)]
