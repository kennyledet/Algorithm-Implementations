<?php

    // Arithmetic Mean
    function arithmeticMean($numbers)
    {
        return (array_sum($numbers) / count($numbers));
    }

    function geometricMean($numbers)
    {
        $multiplier = 1;

        foreach ($numbers as $num) {
            $multiplier *= $num;
        }

        return (pow($multiplier, 1/count($numbers)));
    }

    function harmonicMean($numbers)
    {
        $sum = 0;

        foreach ($numbers as $num) {
            $sum += 1/$num;
        }

        return (count($numbers) / $sum);
    }

    function quadraticMean($numbers)
    {
        $sum = 0;

        foreach ($numbers as $num) {
            $sum += pow($num, 2);
        }

        return (sqrt(1/count($numbers) * $sum));
    }

    function generalizedMean($numbers, $power)
    {
        $sum = 0;

        foreach ($numbers as $num) {
            $sum += pow($num, $power);
        }

        return (pow((1/count($numbers) * $sum), 1/$power));
    }

    function weightedMean($values, $weights)
    {
        $sum = 0;

        for ($i = 0; $i < count($values); $i++) {
            $sum += $values[$i] * $weights[$i];
        }

        return ($sum / array_sum($weights));
    }

    function midrangeMean($values)
    {
        return (0.5 * (min($values) + max($values)));
    }

?>