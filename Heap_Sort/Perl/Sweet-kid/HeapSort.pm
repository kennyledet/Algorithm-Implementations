package HeapSort;

use strict;
use warnings;

sub heap_sort {
    my $array_ref = shift;
    my @array = @$array_ref;

    build_max_heap( $array_ref );
    my $size = scalar @array;
    for( my $i = $#array; $i > 0; $i-- ) {
	my $temp = $array_ref->[ 0 ];
	$array_ref->[ 0 ] = $array_ref->[ $i ];
	$array_ref->[ $i ] = $temp;	
	max_heapify( $array_ref, 0, --$size );
    }

    return $array_ref;
}

sub build_max_heap {
    my $array_ref = shift;

    for( my $i = int( @$array_ref / 2 ) - 1; $i >= 0; $i-- ) {
	max_heapify( $array_ref, $i, scalar @$array_ref );
    }
}

sub parent {
    my $i = shift;
    return int( ($i + 1) / 2 ) - 1;
}

sub left {
    my $i = shift;
    return $i * 2 + 1;
}

sub right {
    my $i = shift;
    return $i * 2 + 2;
}

sub max_heapify {
    my ($array_ref, $i, $size) = @_;

    my $left = left( $i );
    my $right = right( $i );

    my $largest;
    if( $left < $size && ( $array_ref->[ $left ] )> ($array_ref->[ $i ]) ) {
	$largest = $left;
    } else {
	$largest = $i;
    }

    if( $right < $size && ( $array_ref->[ $right ] ) > ( $array_ref->[ $largest ]) ) {
	$largest = $right;
    }

    if( $largest != $i ) {
	my $temp = $array_ref->[ $i ];
	$array_ref->[ $i ] = $array_ref->[ $largest ];
	$array_ref->[ $largest ] = $temp;
	max_heapify( $array_ref, $largest, $size );
    }
}

1;
