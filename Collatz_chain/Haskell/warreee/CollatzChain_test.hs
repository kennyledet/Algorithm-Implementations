module CollatzChain_test (main) where
import CollatzChain ( chain )

main = do
    putStrLn "Collatz Chain with number 30: "
    putStrLn $ show $ chain 30
    
