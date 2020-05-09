/**
 * 
 */
package leetcode;

/**
 * @author rahul.kumar
 *
 */
public class SafeAndDangerGame {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		int[] slots = { 0, 0, 1, 1, 1, 1, 0, 1, 0 };

		int[] range = { 2, 6 };

		boolean[] visited = new boolean[slots.length];

		boolean reached = reachToEnd(0, slots, range, visited);

		if (reached == Boolean.TRUE)
			System.out.println(Boolean.TRUE);
		else
			System.out.println(Boolean.FALSE);
	}

	private static boolean reachToEnd(int start, int[] slots, int[] range, boolean[] visited) {
		visited[start] = Boolean.TRUE;
		if (start == slots.length - 1) {
			return true;
		}

		boolean flag = false;
		if (slots[start + 1] == 0 && visited[start + 1] == Boolean.FALSE && start + 1 < slots.length) {
			flag = reachToEnd(start + 1, slots, range, visited);
		}
		for (int i = range[0]; i <= range[1] && start + i < slots.length && !flag; i++) {
			if (slots[start + i] == 0 && visited[start + i] == Boolean.FALSE) {
				flag = reachToEnd(start + 1, slots, range, visited);
			}
		}

		return flag;
	}
}
