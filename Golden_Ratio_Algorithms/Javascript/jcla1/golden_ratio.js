function golden_ratio_root_iteration(seed, acc) {
    var phi = seed || 1;
    var acc = acc || 1E-8;
    var tmp = 0;

    while (!Math.abs(phi - tmp) <= acc) {
        tmp = phi;
        phi = Math.sqrt(1 + phi);
    }

    return phi;
}

function golden_ration_fractional_iteration(seed, acc) {
    var phi = seed || 1;
    var acc = acc || 1E-8;
    var tmp = 0;

    while (!Math.abs(phi - tmp) <= acc) {
        tmp = phi;
        phi = 1 + (1 / phi)
    }

    return phi;
}

function golden_ratio_babylonian_iteration(seed, acc) {
    var phi = seed || 1;
    var acc = acc || 1E-8;
    var tmp = 0;

    while (!Math.abs(phi - tmp) <= acc) {
        tmp = phi;
        phi = (phi * phi + 1) / (2 * phi - 1);
    }

    return phi;
}

// Warning: This is slow, probably because calculating
//          the fibonacci terms is also slow.
function golden_ration_fibonacci_iteration(seed, acc) {
    var seed = seed || 2;
    var acc = acc || 1E-8;

    var denum = fibonacci(seed);
    var num = fibonacci(seed + 1);

    var phi = num / denum;
    var tmp = 0;

    while (!Math.abs(phi - tmp) <= acc) {
        tmp = phi;
        seed += 1;
        denum = num;
        num = fibonacci(seed);
        phi = num / denum;
    }

    return phi;
}

// Gives the n-th fibonacci term
function fibonacci(n) {
    if (n <= 2) return 1;
    return fibonacci(n - 1) + fibonacci(n - 2)
}