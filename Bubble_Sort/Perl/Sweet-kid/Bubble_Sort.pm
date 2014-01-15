package Bubble_Sort;

use strict;
use warnings;

sub bubble_sort {
    my $array_ref = shift;
    my @array = @$array_ref;
    my $sorted = 0;

    while( !$sorted ) {
	my $modified = 0;
	for( my $i = 1; $i <= $#array; $i++ ) {
	    if( $array[ $i - 1 ] > $array[ $i ] ) {
		$modified = 1;
		my $temp = $array[ $i ];
		$array[ $i ] = $array[ $i - 1 ];
		$array[ $i - 1 ] = $temp;
           }
	}
	$sorted = ( $modified ? 0 : 1 );
    }

    return \@array;
}

1;
