// Boyer–Moore–Horspool algorithm (or Horspool's algorithm) is an algorithm
// for finding substrings in strings.

function boyer_moore_horspool(haystack, needle) {
    var badMatchTable = {},
        maxOffset = (haystack.length - needle.length),
        last = (needle.length - 1),
        offset = 0,
        scan;

    // Generate the "bad match table", which is the location of offsets
    // to jump forward when a comparison fails
    Array.prototype.forEach.call(needle, function (char, i) {
        badMatchTable[char] = (last - i);
    });

    // Now look for the needle
    while (offset <= maxOffset) {
        // Search right-to-left, checking to see if the current offset at
        // needle and haystack match.  If they do, rewind 1, repeat, and if we
        // eventually match the first character, return the offset.
        for (scan=last; needle[scan] === haystack[scan+offset]; scan--) {
            if (scan === 0) {
              return offset;
            }
        }

        offset += (badMatchTable[haystack[offset + last]] || last+1);
    }

    return -1;
}

var stringLocation = boyer_moore_horspool('Because sometimes algorithms are more fun than str.search()', 'algorithms');

console.log(stringLocation); // 18
