<?php
function sieve($n = 0){
    $numbers = array_fill(2, $n + 1, true);
    $numbers[0] = false;
    $numbers[1] = false;

    $limit = floor(sqrt($n));

    for($i = 2; $i <= $limit; $i++){
        if($numbers[$i]){
            while(true){
                $j = pow($i,2) + ($k++ * $i);
                if($j <= $n){
                    $numbers[$j] = false;
                }else{
                    break;
                }
            }
        }
    }
    return $numbers;
}
