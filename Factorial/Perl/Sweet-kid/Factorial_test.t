use Test::More; # for is(...)
use Test::Fatal; # for like(...)

use Factorial;

# tests for factorial

is( Factorial::factorial(0),
    1,
    "factorial of 0 is 1");

is( Factorial::factorial(1),
    1,
    "factorial of 1 is 1");

is( Factorial::factorial(4),
    24,
    "factorial of 4 is 24" );

is( Factorial::factorial(10),
    3628800,
    "factorial of 10 is 3628800" );

like( exception { Factorial::factorial( -2 ); },
      qr/\QArgument to factorial() should be greater than 0/,
      "program died because of factorial(-2)");

# tests for recursive_factorial

is( Factorial::recursive_factorial(0),
    1,
    "factorial of 0 is 1");

is( Factorial::recursive_factorial(1),
    1,
    "factorial of 1 is 1");

is( Factorial::recursive_factorial(4),
    24,
    "factorial of 4 is 24" );

is( Factorial::recursive_factorial(10),
    3628800,
    "recursive_factorial of 10 is 3628800" );

like( exception { Factorial::recursive_factorial( -2 ); },
      qr/\QArgument to recursive_factorial() should be greater than 0/,
      "program died because of recursive_factorial(-2)");

done_testing;
