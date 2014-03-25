function euclidean_distance(q, p) {
    if (p.length != q.length) throw "Vectors need to have same length!";
    var n = zip(p, q).map(function(a) {
        return Math.pow(a[0]-a[1], 2);
    }).reduce(function(sum, x) {
        return sum + x;
    });

    return Math.sqrt(n);
}

function euclidean_distance_procedural(q, p) {
    if (p.length != q.length) throw "Vectors need to have same length!";

    var sum = 0;
    for (var i = 0; i < q.length; i++) {
        sum += Math.pow(q[i]-p[i], 2);
    }

    return Math.sqrt(sum);
}

// Not part of the actual algorithm
// Just used to zip up values
function zip() {
    var min_len = arguments[0].length;
    for (var i = arguments.length - 1; i >= 0; i--) {
        if (arguments[i].length < min_len) min_len = arguments[i].length;
    }

    var zipped = [];
    for (var i = 0; i < min_len; i++) {
        zipped[i] = [];
        for (var j = 0; j < arguments.length; j++) {
            zipped[i].push(arguments[j][i]);
        }
    }
    return zipped;
}