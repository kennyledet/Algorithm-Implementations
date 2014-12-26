module CaesarCipher where

import Data.Char

encode :: Int -> String -> String
encode shift = map (\s -> chr $ ord s + shift) 

decode :: Int -> String -> String
decode shift = encode $ negate shift
