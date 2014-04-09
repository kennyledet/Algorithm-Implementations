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

