gcd(A, 0) :- write(A).
gcd(A, B) :- 
    R is mod(A, B),
    gcd(B, R).
    



