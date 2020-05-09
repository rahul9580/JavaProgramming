package algo;

import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

public class VoteWin {

	public static void main(String[] args) {
		char var1 = 'A';
        char var2 = 'a';
        System.out.println((int)var1 +(int)var2);
		String winner = null;
		String[] vetes = { "aa", "ab", "aa", "ab" };
		Map<String, Integer> map = new TreeMap<String, Integer>();
		for (String s : vetes) {
			Integer count = map.get(s);
			if (count == null) {
				count = 0;
			}
			count++;
			map.put(s, count);
		}
		
		synchronized (Object.class) {
			
		}{}
		int max = 0;

		Set<Map.Entry<String, Integer>> entrySet = map.entrySet();
		for (Map.Entry<String, Integer> entry : entrySet) {
			if (entry.getValue() >= max) {
				max = entry.getValue();
				winner = entry.getKey();
			}
		}
		System.out.println(winner);
	}
}
