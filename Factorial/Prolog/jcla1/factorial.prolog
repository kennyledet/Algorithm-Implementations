factorial(0, 1).
factorial(1, 1).

factorial(A, B) :-
    A > 1, C is A-1, factorial(C, Y), B is A * Y.