import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;


public class Main {
	public static void main(String[] args) {
		Trie t = new Trie();
        t.add("TEST");
        t.add("Test"); // same as first one
        System.out.println(t.contains("TEST")); // true
        System.out.println(t.contains("teST")); // true
        System.out.println(t.contains("TE2ST")); // false
	}
}
