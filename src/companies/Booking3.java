package companies;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

public class Booking3 {

	public static void main(String args[]) throws Exception {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int sqc = 0;
		int rerc = 0;
		int other = 0;
		String line;
		while ((line = br.readLine()) != null) {
			String ss[] = line.split(" ");
			Integer arr[] = new Integer[ss.length];
			int i = 0;
			for (String str : ss) {
				arr[i] = Integer.valueOf(str);
				i++;
			}
			Map<Integer, Integer> m = new HashMap<Integer, Integer>();
			m.put(arr[0], 1);
			m.put(arr[1], 1);
			m.put(arr[2], 1);
			m.put(arr[3], 1);
			if (m.size() == 1) {
				sqc++;
			} else if (m.size() == 2)
				rerc++;
			else
				other++;
		}
		System.out.println(sqc + " " + rerc + " " + other);

	}
}
