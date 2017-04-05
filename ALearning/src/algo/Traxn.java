package algo;
/**
 * 
 */

/**
 * @author rahul
 *
 */
public class Traxn {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		char arr[] = { 'a', 'a', 'b', 'c', 'c', 'c', 'b', 'd' };

		int i = 0, j = 1;
		while (j < arr.length) {
			if (arr[i] == arr[j]) {
				while (j < arr.length && arr[i] == arr[j]) {
					j++;
				}
				j--;
				i--;
			} else {
				i++;
				arr[i] = arr[j];
			}
			j++;
			if (i < 0 && j < arr.length) {
				i = 0;
			}
		}
		for (int l = 0; l <= i; l++) {
			System.out.println(arr[l]);
		}
	}

}
