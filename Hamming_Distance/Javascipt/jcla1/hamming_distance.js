function hamming_distance(p, q) {
    if (p.length != q.length) throw "Sequences need to be of same length!";
    return sum(zip(p, q).map(function(v) {
        if (v[0] != v[1]) return 1;
        return 0;
    }))
}

function sum(arr) {
    return arr.reduce(function(acc, e) { return acc + e; })
}

function zip(p, q) {
    if (p.length != q.length) throw "Sequences need to be of same length!";
    return p.map(function(e, i) { return [e, q[i]]; })
}