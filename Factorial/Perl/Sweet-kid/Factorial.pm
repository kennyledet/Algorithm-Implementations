package Factorial;

use strict;
use warnings;

sub factorial {
    my $number = shift;
    if( $number == 0 || $number == 1 ) {
        return 1;
    } elsif( $number < 0 ) {
        die "Argument to factorial() should be greater than 0";
    } else {
        my $factorial = $number;

        for( my $i = $number - 1; $i >= 2; $i-- ) {
	    $factorial *= $i;
        }
        return $factorial;
    }
}

sub recursive_factorial {
    my $number = shift;

    if( $number == 0 || $number == 1 ) {
	return 1;
    } elsif( $number < 0 ) {
        die "Argument to recursive_factorial() should be greater than 0";
    } else {
	return factorial($number-1)*$number;
    }
}

1;
