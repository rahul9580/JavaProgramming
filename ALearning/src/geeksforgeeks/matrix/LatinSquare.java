/**
 * 
 */
package geeksforgeeks.matrix;

/**
 * @author rahul
 *
 */
public class LatinSquare {

	/**
	 * @param args
	 */

	public static void main(String[] args) {
		int n = 5;
		int k = 1;
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				if (k%n == 0)
					System.out.print(n);
				else
					System.out.print(k % n);
				System.out.print(" ");
				k++;
			}
			k--;
			System.out.println();

		}

	}

}
