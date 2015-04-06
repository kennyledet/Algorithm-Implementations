module CaesarCipher_Test ( main ) where
import CaesarCipher

main = do
    putStrLn "The message \"Haskell is awesome\" encoded with a shift of 5 characters: "
    putStrLn $ encode 5 "Haskell is awesome"
    putStrLn "The message \"Mfxpjqq%nx%f|jxtrj\" decoded with a shift of 5 characters: "
    putStrLn $ decode 5 "Mfxpjqq%nx%f|jxtrj"
