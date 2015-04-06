
Read( "fibonacci.gi" );

ForAll( [ 1 .. 10 ], i -> fibonacci_rec( i ) = fibonacci_internal( i ) );

ForAll( [ 1 .. 10 ], i -> fibonacci_iterative( i ) = fibonacci_internal( i ) );

iterator := fibonacci_iterator( );

ForAll( [ 1 .. 100 ], i -> iterator( ) = fibonacci_internal( i ) );
