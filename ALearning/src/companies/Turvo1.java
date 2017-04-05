package companies;

import java.util.Arrays;
import java.util.Scanner;

public class Turvo1 {

	public static int findPlatform(int arr[], int dep[]) {
		Arrays.sort(arr);
		Arrays.sort(dep);

		int plat_needed = 1, result = 1;
		int i = 1, j = 0;

		int n = arr.length;
		while (i < n && j < n) {
			// If next event in sorted order is arrival, increment count of
			// platforms needed
			if (arr[i] < dep[j]) {
				plat_needed++;
				i++;
				if (plat_needed > result) // Update result if needed
					result = plat_needed;
			} else // Else decrement count of platforms needed
			{
				plat_needed--;
				j++;
			}
		}

		return result;
	}

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int N = scanner.nextInt();
		int arr[] = new int[N];
		int dep[] = new int[N];
		int i = 0;
		while (i < N) {
			String str1[] = scanner.nextLine().split(":");
			arr[i] = (Integer.parseInt(str1[0]) * 100) + Integer.parseInt(str1[1]);

			String str2[] = scanner.nextLine().split(":");
			;
			dep[i] = (Integer.parseInt(str2[0]) * 100) + Integer.parseInt(str2[1]);
			i = i + 1;
		}
		System.out.println(findPlatform(arr, dep));
	}
}
