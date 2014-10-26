function digits(n) {
    return String(n).split("").map(function(e) { return Number(e); });
}

function sum(arr) {
    return arr.reduce(function(acc, n) {
        return acc + n;
    });
}

function is_harshad_number(n) {
    return n % sum(digits(n)) === 0;
}