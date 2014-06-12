function arithmetic_mean(arr) {
    return sum(arr) / arr.length;
}

function geometric_mean(arr) {
    return Math.pow(prod(arr), 1 / arr.length);
}

function harmonic_mean(arr) {
    return arr.length / sum(arr.map(function(n) {
        return 1 / n;
    }));
}

function sum(arr) {
    return arr.reduce(function(acc, n) {
        return acc + n;
    });
}

function prod(arr) {
    return arr.reduce(function(acc, n) {
        return acc * n;
    });
}