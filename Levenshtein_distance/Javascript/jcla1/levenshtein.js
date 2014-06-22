function recursiveLevenshtein(a, b) {
    if (min(a.length, b.length) == 0) return a.length | b.length;

    var cost = (a[0] != b[0])*1;

    return min(
        1 + recursiveLevenshtein(a.slice(1), b),
        1 + recursiveLevenshtein(a, b.slice(1)),
        cost + recursiveLevenshtein(a.slice(1), b.slice(1))
        );
}

function min() {
    var arr = Array.prototype.slice.call(arguments, 0)
    return arr.reduce(function(a, b) {
        if (a > b) return b;
        return a;
    });
}