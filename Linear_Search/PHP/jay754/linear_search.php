<?php

function linear_search($arr, $key){
    for($i=0 ; $i < count($arr); $i++){
        if($arr[$i] === $key){
            return $i . "\n";
        }
    }

    return -1 . "\n";
}

?>