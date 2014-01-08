/**
 * Factorial recursive way
 * 
 * n! = 1 if n = 0
 * n! = (n-1)! * n if n > 0
 */
var factorial = function(n){
    return (n <= 1) ? n : (n * factorial(n-1));
}

/**
 * Factorial implemented iterative
 * throught n until n >= 1 
 */
var factorial_iterative = function(n){
    var factorial = 1; 
    while(n >= 1){
        factorial *= n--;
    }
    return factorial;
}
