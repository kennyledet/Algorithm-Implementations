levenshtein :: Eq a => [a] -> [a] -> Int
levenshtein [] t = length t
levenshtein s [] = length s
levenshtein (a:as) (b:bs) = minimum distances
    where
        distances = [deleteFromS, deleteFromT, deleteFromBoth]

        deleteFromS = 1 + levenshtein as (b:bs)
        deleteFromT = 1 + levenshtein (a:as) bs
        deleteFromBoth = cost + levenshtein as bs

        cost = bool2Int $ a == b

bool2Int :: Bool -> Int
bool2Int True = 0
bool2Int False = 1

levenshteinTest = and $ map (\ (a, b, d) -> d == (levenshtein a b)) cases
    where cases = [("soylent green is people", "people soiled our green", 19)] ++
                  [("horse", "ros", 3)] ++
                  [("hello world", "how are you", 10)]
