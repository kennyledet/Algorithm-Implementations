<?php
    function bubble_sort($array)
    {
        // Setup variable to check if the last run has had any swapps.
        $swapped = FALSE;

        // Loop through every key with next key pair in the array to check which one goes first.
        for ($i = 0; $i < count($array); $i++) {
            $first_key = $i;
            $next_key = $i + 1;

            $first_value = $array[$first_key];
            $next_value = $array[$next_key];

            if ($first_value > $next_value) {
                $array[$first_key] = $next_value;
                $array[$next_key] = $first_value;

                $swapped = TRUE;
            }
        }

        // If there was any swaps the algorithm has to run through the array again.
        if ($swapped) {
            $sorted_array = bubble_sort($array);
        } else {
            $sorted_array = $array;
        }

        // At the end the sorted array is returned.
        return $sorted_array;
    }
