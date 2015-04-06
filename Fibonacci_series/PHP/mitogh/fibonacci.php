<?php
/**
 * Fibonnaci implementation on a recursive way, using the
 * ternary operation to apply the condition
 *
 * @param   int     $n  The number of the secuence 0 to n
 */
function fibonacci($n = 0){
    return ($n < 2) ? $n : (fibonacci($n-1) + fibonacci($n-2));
}

/**
 * Iterative implementation of the fibonacci series 
 * Use a for loop to iterate until the value of the serie
 *
 * @param   int     $n  The number of the secuence 0 to n
 */
function fibonacci_iterative($n = 0){
    $i = 1; 
    $j = 0; 
    for($k = 0; $k < $n; $k++){
        $t = $i + $j; 
        $i = $j;
        $j = $t; 
    }
    return $j;
}
