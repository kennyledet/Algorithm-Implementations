use Test::More;

use Insertion_Sort;

my @array = (5, 4, 3, 2, 1);

is_deeply( Insertion_Sort::insertion_sort( \@array ),
           [1, 2, 3, 4, 5],
	   "Got a sorted array");

done_testing;
