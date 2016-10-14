import BubbleSort

main = do
    putStrLn "Tests for BubbleSort algorithm: "
    let results = tests
    putStrLn $ "Test array1: " ++ (succesornot $ head results)
    putStrLn $ "Test array2: " ++ (succesornot $ (!!) results 1)
    putStrLn $ "Test array3: " ++ (succesornot $ last results)
    where succesornot = (\x -> if x then "Succeeded!" else "Failed") 
    
    
array1 :: (Integral a) => [a]
array1 = [99,98..0]
array1' = [0..99]

array2 :: String
array2 = "This is just a string, used to test our BubbleSort algorithm!"
array2' = "          !,BSTaabbdeeegghhiiiijllmnoooorrrrsssssstttttttuuuu"

array3 :: [Int]
array3 = [2,45,3,3585,4135,748,6384,358,43865,4,83654,354,658,4,36848,83,7,12,1,24,45,4,54,54,54,5,413,13,54] 
array3' = [1,2,3,4,4,4,5,7,12,13,24,45,45,54,54,54,54,83,354,358,413,658,748,3585,4135,6384,36848,43865,83654]

tests :: [Bool]
tests = [bubbleSort array1 == array1'] ++ [bubbleSort array2 == array2'] ++ [bubbleSort array3 == array3']


