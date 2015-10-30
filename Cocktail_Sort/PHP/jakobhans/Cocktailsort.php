<?php

// Cocktail Sort (AKA Bidirectional Bubble Sort / Cocktail Shaker Sort / Shaker Sort) - https://en.wikipedia.org/wiki/Cocktail_sort

function cocktailSort($array)
{
    $toggled = FALSE;
    do {
        for ($i = 0; $i < count($array) - 2; $i++) {
            if ($array[$i] > $array[$i+1]) {
                $temp = $array[$i];
                $array[$i] = $array[$i+1];
                $array[$i+1] = $temp;
                $toggled = TRUE;
            }
        }

        if (!$toggled) {
            break;
        }

        $toggled = FALSE;

        for ($i = count($array) - 2; $i > 0; $i--) {
            if ($array[$i] > $array[$i+1]) {
                $temp = $array[$i];
                $array[$i] = $array[$i+1];
                $array[$i+1] = $temp;
                $toggled = TRUE;
            }
        }
    } while ($toggled);

    return $array;
}