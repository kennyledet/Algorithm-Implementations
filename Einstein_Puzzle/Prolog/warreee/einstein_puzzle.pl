% house(Color,Nationality,Animal,Beverage,Job)

% This is a version of the Einstein Problem
% Notice that the problem is overstated!

main :-houses(H),
% List of all houses
    member(house(red, briton, _, _, _), H),
    member(house(_, spaniard, dog, _, _), H),
    member(house(_, japanese, _, _, painter), H),
    member(house(_, italian, _, thee, _), H),
    H = [house(_, norwegian, _, _, _)|_],
    member(house(green, _, _, coffee, _), H),
    right_of(house(green,_,_,_,_), house(white,_,_,_,_), H),
    member(house(_, _, snake, _, artist), H),
    member(house(yellow, _, _, _, diplomat), H),
    H = [_, _, house(_, _, _, milk, _), _,_],
    next_to(house(_,norwegian,_,_,_), house(blue,_,_,_,_), H),
    member(house(_, _, _,juice, violist), H),
    next_to(house(_,_,_,_,doctor), house(_,_,fox,_,_), H),
    next_to(house(_,_,_,_,diplomat), house(_,_,horse,_,_), H),
    member(house(_, _, zebra, _, _), H),
    member(house(_, _, _, water, _), H), 
    write(H).



houses([house(_, _, _, _, _),house(_, _, _, _, _),house(_, _, _, _, _),house(_, _, _, _,_),house(_, _, _, _, _)]).

right_of(A, B, [B, A | _]).
right_of(A, B, [_ | Y]) :- right_of(A, B, Y).

next_to(A, B, [A, B | _]).
next_to(A, B, [B, A | _]).
next_to(A, B, [_|T]):- next_to(A,B,T).
