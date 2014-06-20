levenshtein [] t = length t
levenshtein s [] = length s
levenshtein (a:as) (b:bs) = minimum distances
    where
        distances = [deleteFromS, deleteFromT, deleteFromBoth]

        deleteFromS = 1 + levenshtein as (b:bs)
        deleteFromT = 1 + levenshtein (a:as) bs
        deleteFromBoth = cost + levenshtein as bs

        cost = tr $ a == b

tr True = 0
tr False = 1