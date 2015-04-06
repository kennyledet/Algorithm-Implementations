
Read( "bogosort.gi" );

list := List( [ 1 .. 5 ], i -> Random( [ 1 .. 30 ] ) );

list := bogosort( list );

IsSortedList( list );
