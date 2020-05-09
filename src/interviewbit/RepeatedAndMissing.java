/**
 * 
 */
package interviewbit;

import java.util.HashMap;
import java.util.Map;

/**
 * @author rahulkumar
 *
 */
public class RepeatedAndMissing {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Map<Integer, Boolean> map = new HashMap<Integer, Boolean>();
		int[] arr = { 3, 1, 2, 5, 3 };
		int n = arr.length;
		long summ = (n * (n + 1)) / 2;
		long sumArr = 0;
		for (int i = 0; i < n; i++) {
			sumArr += arr[i];
			map.put(arr[i], Boolean.TRUE);
		}

		int aMinusB = (int) (sumArr - summ);

		int a = 1;
		int b = 1;
		for (int i = 1; i <= n; i++) {
			if (!map.containsKey(i)) {
				b = i;
				a = aMinusB + b;
			}
		}
		System.out.println("[" + a + ", " + b + "]");
	}

}
