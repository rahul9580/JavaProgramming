/**
 * 
 */
package delhivery;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * @author rahul
 *
 */
public class Sol2 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int N = 0;
		try {
			N = Integer.valueOf(br.readLine());
			String s = br.readLine();
			String[] sArr = s.split(" ");
			int arr[] = new int[N];
			for (int i = 0; i < N; i++) {
				arr[i] = Integer.valueOf(sArr[i]);
			}
			
			int max = arr[0];
			int min = arr[0];
			for (int i = 1; i < N; i++) {
				if (arr[i] < min) {
					min = arr[i];
				}
				if (arr[i] > max) {
					max = arr[i];
				}
			}
			System.out.println(min  + " " + max);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
