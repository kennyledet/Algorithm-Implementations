<?php
/**
 * QuickSort Algorithm for order elements inside of an array
 *
 * @params  Array   $array  The array to order
 * @return  Array           The order array
 */
function quicksort($array = []){
    $length = count($array) - 1;

    if($length < 1){
        return $array;
    }
    $index = $length / 2;
    $pivot = $array[$index];
    // Remove element from the array
    unset($array[$index]);
    
    $less = [] ;
    $greater = [];

    // Loop over the whole array
    foreach($array as $element){
        ($element <= $pivot) ? array_push($less, $element) : array_push($greater, $element);
    }

    // Merge the whole array as a recursive call to the 
    // two arrays: $less and $greater
    return array_merge( quicksort($less), [$pivot], quicksort($greater) );
}
