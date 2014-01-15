package Fibonacci;

use strict;
use warnings;

sub fibonacci {
    my $number = shift;

    if( $number < 2 ) {
        return 1;
    } else {
        fibonacci($number - 1) + fibonacci( $number - 2);
    }
}

1;
