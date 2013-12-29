<?php
    function gcd_division($a, $b)
    {
        while ($b != 0) {
            $tmp = $b;
            $b = $a % $b;
            $a = $tmp;
        }
        return $a;
    }

    function gcd_substraction($a, $b)
    {
        while ($a != $b) {
            if ($a > $b) {
                $a = $a - $b;
            } else {
                $b = $b - $a;
            }
        }
        return $a;
    }

    function gcd_recursive($a, $b)
    {
        if ($b == 0) {
            return $a;
        } else {
            return array($b, $a % $b);
        }
    }
