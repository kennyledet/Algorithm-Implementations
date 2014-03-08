use HeapSort;

my @array = (10, 9, 8, 7, 6, 5, 4, 3, 2, 1);
print "Unsorted array : \n";
print_array( \@array );
HeapSort::heap_sort( \@array );
print "Sorted array : \n";
print_array( \@array );
for( my $i = 0; $i < $#array; $i++ ) {
    if( $array[ $i ] > $array[ $i + 1 ] ) {
	print STDERR "Array is not sorted\n";
	exit;
    }
}

print "Array is sorted\n";

sub print_array {
    my $array_ref = shift;
    my @array = @$array_ref;

    for( my $i = 0; $i <= $#array; $i++ ) {
	print $array_ref->[ $i ]." ";
    }

    print "\n\n";
}

