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

function generalized_mean(arr, power) {
    return Math.pow((1 / arr.length) * sum(arr.map(function(n) {
        return Math.pow(n, power);
    })), 1 / power);
}

function weighted_mean(arr, weights) {
    if (arr.length != weights.length) throw "# values & # weights have to be the same!";

    var weighted = 0;
    for (var i = arr.length - 1; i >= 0; i--) {
        weighted += arr[i] * weights[i]
    }

    return weighted / sum(weights);
}

function midrange_mean(arr) {
    return 0.5 * (max(arr) + min(arr))
}

function energatic_mean(arr) {
    return 10 * log(sum(arr.map(function(n) {
        return Math.pow(10, n / 10)
    })) / arr.length, 10);
}

function log(a, b) {
    return Math.log(b) / Math.log(a);
}

function max(arr) {
    return arr.reduce(function(acc, n) {
        if (n > acc) return n;
        return acc;
    })
}

function min(arr) {
    return arr.reduce(function(acc, n) {
        if (n < acc) return n;
        return acc;
    })
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