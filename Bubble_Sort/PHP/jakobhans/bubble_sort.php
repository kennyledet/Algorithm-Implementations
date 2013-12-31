<?php
    function bubble_sort($array = [])
    {
        // Just ask one time the length of the array
        $n = count($array);

        if(!$n){
            return $array;
        }
        // Iterate over all the elments
        for($i = 0; $i < $n; $i++){
            $flag = false;
            // Order the array
            for($j = 0; $j < $n - $i - 1; $j++){
                if($array[$j] > $array[$j+1]){
                    $flag = true; 
                    // Swap values
                    $temp = $array[$j+1];
                    $array[$j+1] = $array[$j];
                    $array[$j] = $temp;
                }  
            }
            // Already order
            if(!$flag){
                return $array;
            }
        }
    }
