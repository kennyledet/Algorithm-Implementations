<?php
/**
 * Counting Sort Algirithm 
 *
 * @param   Array   $array  The original array
 * @return  Array   $order  The order array
 */
function counting_sort($array = []){
    // Return [] if the array has no elements
    if( !is_array($array) || !count($array) ){
        return $array;
    }
    
    // Find the min and max value
    $max = max($array);
    $min = min($array);
    
    // Fill the aux array from min to max with 0
    $aux = [];
    $aux = array_fill($min, $max, 0);

    foreach($array as $element){
        $aux[$element]++;
    }

    // Fill the order array
    $order = [];
    foreach($aux as $key => $value){
        $i = 0; 
        while($i++ < $value){
            array_push($order, $key);
        }
    }
    return $order;
}
