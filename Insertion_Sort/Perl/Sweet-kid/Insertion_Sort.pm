package Insertion_Sort;

use strict;
use warnings;

sub insertion_sort {
    my $array_ref = shift;
    my @array = @$array_ref;

    for( my $i = 1; $i <= $#array; $i++ ) {
        my $key = $array[ $i ];
        my $j = $i - 1;
        while( $j >= 0  && $array[ $j ] > $key ) {
            $array[ $j + 1 ] = $array[ $j ];
            $j--;
        }
        $array[ $j + 1 ] = $key;
    }

    return \@array;
}

1;
