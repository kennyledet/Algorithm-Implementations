function kmp_search(str, word) {
    var m = 0,
        i = 0,
        table = make_table(word);

    while (m + i < str.length) {
        if (word[i] === str[m + i]) {
            if (i == word.length - 1) return m;
            i++;
        } else {
            if (table[i] > -1) {
                m += i - table[i];
                i = table[i];
            } else {
                i = 0;
                m++;
            }
        }
    }

    return -1;
}

function make_table(word) {
    var pos = 2,
        cnd = 0,
        table = [-1, 0];

    while (pos < word.length) {
        if (word[pos - 1] === word[cnd]) {
            table[pos++] = ++cnd;
        } else if (cnd > 0) {
            cnd = table[cnd];
        } else {
            table[pos++] = 0;
        }
    }

    return table;
}