<?php
function binary_search($arr, $target){

    if(!is_array($arr) || !count($arr) || !is_numeric($target)){
        return -1;
    }

    $top = count($arr) - 1; 
    $bottom = 0; 

    while($bottom <= $top){
        $middle = ($top + $bottom) / 2; 

        if($arr[$middle] === $target){
            return $middle; 
        }else{
            if($target < $arr[$middle]){
                $top = $middle - 1;
            }else{
                $bottom = $middle + 1; 
            }
        }
    }
    return -1;
}
