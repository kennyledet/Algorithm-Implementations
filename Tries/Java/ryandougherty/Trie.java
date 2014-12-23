import java.util.Collection;
import java.util.HashMap;

@SuppressWarnings("rawtypes")
public class Trie {
	private final HashMap<Character, HashMap> root = new HashMap<Character, HashMap>();
	private final Character END_CHARACTER = '$';

	public Trie() {
	}
	
	public Trie(String s) {
		add(s);
	}

	public Trie(Collection<String> c) {
		for (String s : c) {
			add(s);
		}
	}
	
	@SuppressWarnings("unchecked")
	public void add(String s) {
		HashMap<Character, HashMap> node = root;
		s = s.toLowerCase();
		for (int i=0, len=s.length(); i<len; i++) {
			Character c = s.charAt(i);
			if (node.containsKey(c)) {
				node = node.get(c);
			} else {
				node.put(c, new HashMap<Character, HashMap>());
				node = node.get(c);
			}
		}
		node.put(END_CHARACTER, new HashMap<Character, HashMap>(0));
	}
	
	@SuppressWarnings("unchecked")
	public boolean contains(String s) {
		HashMap<Character, HashMap> node = root;
		s = s.toLowerCase();
		for (int i=0, len=s.length(); i<len; i++) {
			Character c = s.charAt(i);
			if (node.containsKey(c)) {
				node = node.get(c);
			} else {
				return false;
			}
		}
		return node.containsKey(END_CHARACTER);
	}
}
