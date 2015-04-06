<?php
/**
 * Factorial in a recursive way
 * for convention 0! = 1
 * 
 * @param   int     $n  Factorial of $n
 */
function factorial($n = 0){
    return ($n <= 0) ? 1 : ($n * factorial($n-1));
}

/**
 * Factorial implemented in trought a while
 * loop. 
 *
 * @param   int     $n  Factorial of $n
 */
function factorial_iterative($n = 0){
    $factorial = 1; 
    if(!$n){
        return $factorial;
    }

    while($n){
        $factorial *= $n--;
    }
    return $factorial;
}
