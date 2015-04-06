
public class Trie<Value> {
    private static int R = 256;
    private Node root = new Node();

    private static class Node {
        private Object val;
        private Node[] next = new Node[R];
    }

    public Trie() {
        root = null;
    }

    public Value get(String key) {
        Node x = get(root, key, 0);
        if (x.val == null) return null;
        return (Value) x.val;
    }

    private Node get(Node x, String key, int d) {
        if (x == null) return null;
        if (d == key.length()) return x;

        char c = key.charAt(d);
        return get(x.next[c], key, d+1);
    }

    public void put(String key, Value val) 
    { root = put(root, key, val, 0); }

    private Node put(Node x, String key, Value val, int d) {
        if (x == null) x = new Node();
        if (d == key.length()) {
            x.val = val;
            return x;
        }

        char c = key.charAt(d);
        x.next[c] = put(x.next[c], key, val, d+1);
        return x;
    }

    public Iterable<String> keys() {
        return keysWithPrefix("");
    }

    public Iterable<String> keysWithPrefix(String s) {
        Queue<String> q = new Queue<String>();
        collect(get(root, s, 0), s, q);
        return q;
    }

    private void collect(Node x, String pre, Queue<String> q) {
        if (x == null) return;
        if (x.val != null) q.enqueue(pre);
        for (char c = 0; c < R; c++)
            collect(x.next[c], pre + c, q);
    }

    public Iterable<String> keysThatMatch(String s) {
        Queue<String> q = new Queue<String>();
        collect(root, "", s, q);
        return q;
    }

    private void collect(Node x, String pre, String pat, Queue<String> q) {
        if (x == null) return;

        int d = pre.length();
        if (d == pat.length() && x.val != null) q.enqueue(pre);
        if (d == pat.length()) return;

        char t = pat.charAt(d);
        for (char c = 0; c < R; c++)
            if (t == '.' || t == c)
                collect(x.next[c], pre + c, pat, q);
    }

    public String longestPrefixOf(String s) {
        int length = longestPrefixSearch(root, s, 0, 0);
        return s.substring(0, length);
    }

    private int longestPrefixSearch(Node x, String s, int d, int length) {
        if (x == null) return length;
        if (s.length() == d) length = d;
        if (d == s.length()) return length;
        char c = s.charAt(d);
        return longestPrefixSearch(x.next[c], s, d+1, length);
    }

    public void delete(String key)
    { root = delete(root, key, 0); }

    private Node delete(Node x, String key, int d) {
        if (x == null) return null;
        if (d == key.length()) x.val = null;
        else {
            char c = key.charAt(d);
            x.next[c] = delete(x.next[c], key + c, d + 1);
        }

        if (x.val != null) return x;

        for (char c = 0; c < R; c++)
            if (x.next[c] != null) return x;
        return null;
    }
}
