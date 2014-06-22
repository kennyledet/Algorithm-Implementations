function recursiveLevenshtein(a, b) {
    if (min(a.length, b.length) == 0) return a.length | b.length;

    var cost = (a[0] != b[0])*1;

    return min(
        1 + recursiveLevenshtein(a.slice(1), b),
        1 + recursiveLevenshtein(a, b.slice(1)),
        cost + recursiveLevenshtein(a.slice(1), b.slice(1))
        );
}

function wagnerFisherLevenshtein(a, b) {
    var m = a.length,
        n = b.length,
        d = range(m + 1, range(n + 1, 0));

    for (var i = 0; i <= n; i++) {
        d[0][i] = i;
    }

    for (var j = 1; j <= n; j++) {
        for (var i = 1; i <= m; i++) {
            if (a[i-1] == b[j-1]) {
                d[i][j] = d[i-1][j-1];
            } else {
                d[i][j] = min(d[i-1][j]+1, d[i][j-1]+1, d[i-1][j-1]+1);
            }
        }
    }

    return d[m][n];
}

function range(n, elem) {
    return Array.apply(null, Array(n)).map(function(_, i) {
        if (elem === undefined) return i;
        return elem;
    });
}

function min() {
    var arr = Array.prototype.slice.call(arguments, 0)
    return arr.reduce(function(a, b) {
        if (a > b) return b;
        return a;
    });
}