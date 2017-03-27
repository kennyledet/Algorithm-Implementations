-module(doors_100).
-compile(export_all).
-import(lists).

main() ->
    %% false represents a closed door & true represents an open door
    Doors = lists:duplicate(100, false),
    Result = toggle_doors( Doors, 0 ),
    io:format("Open doors:~n"),
    print_open_doors( Result, 1),
    OpenDoorsIndex = [ X*X || X <- lists:seq( 1, 10) ],
    TestPassed = test_open_doors( Result, 1, OpenDoorsIndex ),
    if TestPassed == true ->
            io:format("~nTest passed~n");
       true ->
            io:format("~nTest failed~n")
    end.

test_open_doors(_, 101, _) ->
    true;

test_open_doors(Result, CurrentIndex, OpenDoorsIndex) ->
    IsAnOpenDoor = lists:member( CurrentIndex, OpenDoorsIndex ),
    %% index for nth should be >=1
    Door = lists:nth( CurrentIndex, Result ),
    if IsAnOpenDoor == true ->
            if Door == true ->
                    test_open_doors( Result, CurrentIndex + 1, OpenDoorsIndex );
               true ->
                    io:format("test failed for ~p~n", [CurrentIndex]),
                    false
            end;
       true ->
            if Door == false ->
                    test_open_doors( Result, CurrentIndex + 1, OpenDoorsIndex );
               true ->
                    io:format("test failed for ~s~n", [CurrentIndex]),
                    false
            end
    end.

print_list([], _) ->
    io:format("~n");
print_list([H|T], N) ->
    io:format("~p ", [H]),
    if (N rem 10) == 0 ->
            io:format("~n"),
            print_list(T, N+1);
       true ->
            print_list(T, N+1)
    end.

print_open_doors([], _) ->
    io:format("~n");
print_open_doors([H|T], N) ->
    if H == true ->
            io:format("~p ",[N]),
            print_open_doors(T, N+1);
       true ->
            print_open_doors(T, N+1)
    end.

toggle_doors( Doors, 100 ) -> Doors;
toggle_doors( Doors, Turn) ->
    toggle_doors( toggle_doors_per_turn( Doors, 1, Turn), Turn + 1 ).

toggle_doors_per_turn( Doors, Current, Turn ) ->
    if Current*(Turn+1) > 100 ->
            Doors;
       true ->
            ToggledDoors = lists:sublist( Doors, Current*(Turn + 1) - 1 ) ++
                [ not lists:nth(  Current*(Turn + 1) , Doors) ] ++
                lists:sublist( Doors, Current*(Turn + 1) + 1, length( Doors ) - Current*(Turn + 1) + 1 ),
            toggle_doors_per_turn( ToggledDoors, Current + 1, Turn )
    end.
