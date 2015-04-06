use Test::More;

use Fibonacci;

is( Fibonacci::fibonacci(0),
    1,
    "fibonacci(0) = 1");

is( Fibonacci::fibonacci(1),
    1,
    "fibonacci(1) = 1");

is( Fibonacci::fibonacci(2),
    2,
    "fibonacci(2) = 2" );

is( Fibonacci::fibonacci(5),
    8,
    "fibonacci(5) = 8" );

is( Fibonacci::fibonacci(10),
    89,
    "fibonacci(10) = 89" );

done_testing;
