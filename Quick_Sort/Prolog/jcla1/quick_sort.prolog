%% Taken from: "Good Math" by Mark C. Chu-Carroll PragProg
partition(_, [], [], []).
partition(Pivot, [Head|Tail], [Head|Smaller], Bigger) :-
    Head @=< Pivot,
    partition(Pivot, Tail, Smaller, Bigger).
partition(Pivot, [Head|Tail], Smaller, [Head|Bigger]) :-
    Head @> Pivot,
    partition(Pivot, Tail, Smaller, Bigger).

quicksort([], []).
quicksort([Head|Tail], Sorted) :-
    partition(Head, Tail, Smaller, Bigger),
    quicksort(Smaller, SmallerSorted),
    quicksort(Bigger, BiggerSorted),
    append(SmallerSorted, [Head | BiggerSorted], Sorted).