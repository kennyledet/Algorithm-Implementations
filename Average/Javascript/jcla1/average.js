function arithmetic_mean(arr) {
    return sum(arr) / arr.length;
}

function sum(arr) {
    return arr.reduce(function(acc, n) {
        return acc + n;
    });
}