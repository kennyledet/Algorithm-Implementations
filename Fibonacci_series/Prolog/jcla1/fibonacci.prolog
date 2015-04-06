fib(0, 0).
fib(1, 1).
fib(N, A) :-
    N1 is N-1, N2 is N-2,
    fib(N1, B), fib(N2, C),
    A is B + C.
