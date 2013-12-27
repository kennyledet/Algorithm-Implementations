first([H|_], H).

split(A, B, C) :-
    append(B, C, A), length(B, L1), length(C, L2), L1 = L2.
split(A, B, C) :-
    append(B, C, A), length(B, L1), length(C, L2), L3 is L2+1, L1 = L3.


merge([], R, R).
merge(L, [], L).

merge([L1|L2], R, B) :-
    first(R, R1), L1 =< R1, merge(L2, R, C), append([L1], C, B).
merge(L, [R1|R2], B) :-
    first(L, L1), R1 < L1, merge(R2, L, C), append([R1], C, B).


mergesort([H|[]], [H]).

mergesort(A, B) :-
    length(A, Len), Len > 1,
    split(A, L, R),
    mergesort(L, SL), mergesort(R, SR),
    merge(SL, SR, B).