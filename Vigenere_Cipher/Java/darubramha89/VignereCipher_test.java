package vignere.cipher;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class VignereCipher_test {

	@Test
	public void test() {
		
		VigenereCipher vc = new VigenereCipher();
		assertEquals("Encrypted Cipher Should Match", "TTSSRVWAUDPCOZBLMARYUARV", vc.encrypt("Time and tide waits for no man", "ALGORITHM"));
		assertEquals("Decrypted Cipher Should Match", "TIMEANDTIDEWAITSFORNOMAN", vc.decrypt(vc.encrypt("Time and tide waits for no man", "ALGORITHM"),"ALGORITHM"));
		
	}

}
