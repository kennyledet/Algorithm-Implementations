euclideanNorm :: [Double] -> Double
euclideanNorm p = sqrt . sum $ map (\ n -> n*n) p