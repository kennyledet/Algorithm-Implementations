module CollatzChain_test (main) where
import CollatzChain ( chain )

main = do
    let list = chain 30
    putStrLn "Collatz Chain with number 30: "
    putStrLn (show  list)
    putStrLn $ show $ chain 30
    
