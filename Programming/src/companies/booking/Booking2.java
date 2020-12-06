package companies.booking;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Booking2 {

	public static void main(String args[]) throws Exception {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		String s = br.readLine();
		String ss[] = s.split(" ");
		Integer arr[] = new Integer[ss.length];
		int i = 0;
		for (String str : ss) {
			arr[i] = Integer.valueOf(str);
			i++;
		}
		printDiff(arr);
	}

	static void printDiff(Integer arr[]) {
		System.out.print(arr[0]);
		System.out.print(" ");
		for (int i = 1; i < arr.length; ++i) {
			if (arr[i] - arr[i - 1] <= -127 || arr[i] - arr[i - 1] >= 127) {
				System.out.print(-128);
				System.out.print(" ");
			}
			System.out.print(arr[i] - arr[i - 1]);
			System.out.print(" ");
		}
	}
}
