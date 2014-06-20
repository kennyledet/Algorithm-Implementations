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