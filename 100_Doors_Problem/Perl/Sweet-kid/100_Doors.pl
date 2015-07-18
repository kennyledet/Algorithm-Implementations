#!/usr/bin/env perl

use strict;
use warnings;

use POSIX;

sub toggle_doors {
    my ($doors, $start) = @_;
    for( my $i = 1; ($start*$i - 1) < 100; $i++ ) {
        $doors->[ $start*$i - 1 ] = !$doors->[ $start*$i - 1 ];
    }
}

sub print_open_doors {
    my ($doors) = @_;
    print "Open doors:\n";
    for( my $i = 0; $i < 100; $i++ ) {
        if( $doors->[ $i ] ) {
            print ($i + 1);
            print " ";
        }
    }
    print "\n";
}

sub test_doors {
    my $doors = shift;

    my @expected = (0) x 100 ;
    
    for( my $i = 1; $i <= 10; $i++ ) {
        $expected[ ($i*$i) - 1 ] = 1;
    }

    for( my $i = 0; $i <= $#expected; $i++ ) {
        if( $doors->[ $i ] != $expected[ $i ] ) {
            die "test failed for index $i\n";
        }
    }

    print "\nAll tests passed\n\n";
}

my @doors = ( 0 ) x 100;
for( my $i = 1; $i <= 100; $i++ ) {
    toggle_doors( \@doors, $i );
}

print_open_doors( \@doors );
test_doors( \@doors );

