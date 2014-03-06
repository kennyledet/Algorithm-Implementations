-module(heap_sort).
-export([heapSort/1, heapSort_test/0]).

heapSort( List ) ->
    NewList = buildMaxHeap( List ),
    heapSort( NewList, length( NewList ) ).

heapSort( List, 1 ) ->
    List;

heapSort( List, Size ) ->
    NewList = swapElements( List, 1, Size ),
    NewList2 = maxHeapify( NewList, 1, Size - 1 ),
    heapSort( NewList2, Size - 1 ).

buildMaxHeap( List ) ->
    buildMaxHeap( List, trunc( length( List ) / 2 ) ).

buildMaxHeap( List, I ) ->
    case (I =< length( List ) / 2) and (I > 0 ) of
	true ->
	    NewList = maxHeapify( List, I, length( List ) ),
	    buildMaxHeap( NewList, I - 1 );
	false ->
	    List
    end.

maxHeapify( List, I, Size ) ->
    L = left( I ),
    R = right( I ),

    IElem = lists:nth(I, List ),

    case ( L =< Size ) andalso ( List =/= [] ) andalso ( lists:nth( L, List ) > IElem ) of
	true  -> Largest = L;
	false -> Largest = I
    end,
    LargestElem = lists:nth( Largest, List ),

    case ( R =< Size ) andalso ( List =/= [] ) andalso ( lists:nth( R, List ) > LargestElem ) of
	true  -> FinalLargest = R;
	false -> FinalLargest = Largest
    end,

    if FinalLargest =/= I ->
	    NewList = swapElements( List, I, FinalLargest ),
	    maxHeapify( NewList, FinalLargest, Size );
       true -> List
    end.

left( I ) ->
    2 * I.

right( I ) ->
    2 * I + 1.

swapElements( List, I, J ) ->
    if I < J ->
	    { SubListTillI, SubListAfterI } = lists:split( I, List ),
	    { SubListBetweenIAndJ, SubListAfterJ } = lists:split( J - I, SubListAfterI ),
	    getList( List, J, I, SubListTillI, SubListBetweenIAndJ, SubListAfterJ );
       true ->
	    { SubListTillJ, SubListAfterJ } = lists:split( J, List ),
	    { SubListBetweenJAndI, SubListAfterI } = lists:split( I - J, SubListAfterJ ),
	    getList( List, I, J, SubListTillJ, SubListBetweenJAndI, SubListAfterI )
    end.

getList( List, I, J, SubList1, SubList2, SubList3 ) ->
    L1 = lists:sublist( SubList1, 1, length( SubList1 ) - 1 ),
    L2 = [ lists:nth( I, List ) ],
    L3 = lists:sublist( SubList2, 1, length( SubList2 ) - 1 ),
    L4 = [ lists:nth( J, List ) ],
    L5 = lists:sublist( SubList3, 1, length( SubList3 ) ),
    L1 ++ L2 ++ L3 ++ L4 ++ L5.

heapSort_test() ->
    [ 1, 2, 3, 4, 5 ] = heapSort( [ 3, 5, 1, 2, 4 ] ),
    [ 6, 12, 34, 45, 67, 89, 90, 96 ] = heapSort( [ 12, 34, 45, 90, 67, 96, 89, 6 ] ).

