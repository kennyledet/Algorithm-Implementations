use Test::More;

use Bubble_Sort;

my @array = (5, 4, 3, 2, 1);

is_deeply( Bubble_Sort::bubble_sort( \@array ),
           [1, 2, 3, 4, 5],
	   "Got a sorted array");

done_testing;
