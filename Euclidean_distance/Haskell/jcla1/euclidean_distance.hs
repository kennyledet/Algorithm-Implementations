euclideanDistance :: [Double] -> [Double] -> Double
euclideanDistance p q = sqrt . sum $ zipWith (\ u v -> (u-v)^2) p q
