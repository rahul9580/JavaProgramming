package scripts;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 
 */

/**
 * @author delhivery
 *
 */
public class GenerateHashCode {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		String s = "abc";
		MessageDigest m;
		try {
			m = MessageDigest.getInstance("MD5");
			m.update(s.getBytes(), 0, s.length());

			BigInteger number = new BigInteger(1, m.digest());
			System.out.println("MD5: " + number.toString(16));

			System.out.println("MD5: " + String.format("%032x", number));

		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
