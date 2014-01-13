import Data.List

insertion [] = []
insertion [x] = [x]
insertion list = m : ( insertion $ delete m list )
    where m = minimum list

insertion' = foldr insert []
