-module(harshad_number).
-compile(export_all).

main() ->
    Numbers = lists:seq(1, 200),
    HarshadNumbers = lists:filter(
                       fun(Number) ->
                               Digits = integer_to_list(Number),
                               Sum = sum( Digits, 0 ),
                               if Number rem Sum == 0 ->
                                       true;
                                  true ->
                                       false
                               end
                               %% end if
                       end
                       %% end fun(Number)
                       , Numbers),
    Expected = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
                12, 18, 20, 21, 24, 27, 30, 36,
                40, 42, 45, 48, 50, 54, 60, 63,
                70, 72, 80, 81, 84, 90, 100, 102,
                108, 110, 111, 112, 114, 117, 120,
                126, 132, 133, 135, 140, 144, 150,
                152,153, 156, 162, 171, 180, 190,
                192, 195, 198, 200],
    if HarshadNumbers == Expected ->
            io:format("Test passed~n");
       true ->
            io:format("Test failed~n")
    end.

sum([], Sum) ->
    Sum;
sum([H|T], Sum) ->
    {Integer,_} = string:to_integer([H]),
    sum(T, Sum + Integer).
