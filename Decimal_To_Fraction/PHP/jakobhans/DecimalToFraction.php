<?php

// Decimals are received as strings to avoid PHP converting the float point into negative exponentials

// Returns array with three keys: 'numerator', 'denominator' and 'string'. The first two are the int form of each part of the fraction. The third one is the string form of the fraction ('x/n').

function convertToFraction($decimal)
{
    if (!strpos($decimal, '.')) {
        $result['denominator'] = $decimal;
        $result['numerator'] = '1';
    } else {
        $string_explosion = explode('.', $decimal);
        $ints = intval($string_explosion[0]);
        $decimals_denominator = pow(10, strlen($string_explosion[1]));
        $decimals_numerator = intval($string_explosion[1]);

        echo $decimals_numerator . ' / ' . $decimals_denominator;

        $result = simplifyFraction($decimals_numerator, $decimals_denominator);
    }

    return $result;
}

function simplifyFraction($decimals_numerator, $decimals_denominator)
{
    $result['numerator'] = $decimals_numerator;
    $result['denominator'] = $decimals_denominator;
    $result['string'] = (string)$decimals_numerator . '/' . (string)$decimals_denominator

    $found = FALSE;

    for ($i = 2; $i <= $decimals_numerator; $i++) {
        if ($decimals_numerator % $i === 0 && $decimals_denominator % $i === 0) {
            $result['numerator'] = $decimals_numerator / $i;
            $result['denominator'] = $decimals_denominator / $i;
            $result['string'] = $result['numerator'] . '/' . $result['denominator'];
            $found = TRUE;
            break;
        }
    }

    if ($found) {
        $result = simplifyFraction($result['numerator'], $result['denominator']);
    }

    return $result;

}
?>