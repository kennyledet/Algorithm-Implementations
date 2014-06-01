-- The Ackermann function is so easy to define in Haskell.
-- Just write down the definition an you've already almost got working code.
ackermann 0 n = n+1
ackermann m 0 = ackermann (m-1) 1
ackermann m n = ackermann (m-1) (ackermann m (n-1))
