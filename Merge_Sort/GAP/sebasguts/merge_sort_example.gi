
Read( "merge_sort.gi" );

list := List( [ 1 .. 100 ], i -> Random( [ 1 .. 50 ] ) );

list := merge_sort( list );

IsSortedList( list );
