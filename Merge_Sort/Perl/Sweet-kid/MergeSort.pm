package MergeSort;

use strict;
use warnings;
use POSIX;

sub merge_sort {
    my ($array_ref, $p, $r) = @_;

    if( $p < $r ) {
	my $q = floor(($p + $r) / 2);
	merge_sort( $array_ref, $p, $q );
	merge_sort( $array_ref, $q + 1, $r );
	merge( $array_ref, $p, $q, $r );
    }
}

sub merge {
    my ($array_ref, $p, $q, $r) = @_;

    my (@array1, @array2);
    my $n1 = $q - $p + 1;
    my $n2 = $r - $q;

    for( my $i = 0; $i < $n1; $i++ ) {
	$array1[ $i ] = $array_ref->[ $p + $i ];
    }

    for( my $j = 0; $j < $n2; $j++ ) {
	$array2[ $j ] = $array_ref->[ $q + $j + 1 ];
    }

    for( my ($i, $j, $k) = ( 0, 0, $p); $k <= $r; $k++ ) {
	if( $i < $n1 && $j >= $n2 ) {
	    $array_ref->[ $k ] = $array1[ $i++ ];
	} elsif( $j < $n2 && $i >= $n1 ) {
	    $array_ref->[ $k ] = $array2[ $j++ ];
	} elsif( $array1[ $i ] < $array2[ $j ] ) {
	    $array_ref->[ $k ] = $array1[ $i++ ];
	} else {
	    $array_ref->[ $k ] = $array2[ $j++ ];
	}
    }
}

1;
