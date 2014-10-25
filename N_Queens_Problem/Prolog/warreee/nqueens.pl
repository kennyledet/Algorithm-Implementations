% The position of the queens on the bord is represented by a List.
% The index number of a list represents the column number and the number on that place in the list is the rownumber (or vice-versa). With this representation we only need to check the diagonals, because it is not possible to have double indices or double numbers on these indices.

queens(N,L):-
    numlist(1,N,R),
    permutation(L,R),
    diagonal(L).
    
diagonal([]).

diagonal([H|T]):-
    diagonal2(H,T,1),
    diagonal(T).

diagonal2(_,[],_).

diagonal2(H,[H2|T],V):-
    Tmp is V + 1,
    Verschil is abs(H-H2),
    V \== Verschil,
    diagonal2(H,T,Tmp).

 
