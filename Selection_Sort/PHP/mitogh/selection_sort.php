<?php

function selection_sort($unorder = []){
    $n = count($unorder);

    for($j = 0; $j < $n -1; $j++){
        $iMin = $j; 
        for( $i = $j + 1; $i < $n; $i++){
            if($unorder[$i] < $unorder[$iMin]){
                $iMin = $i; 
            }
        }
        if($iMin != $j){
            $t = $unorder[$iMin];
            $unorder[$iMin] = $unorder[$j];
            $unorder[$j] = $t;
        }
    }
    return $unorder;
}
