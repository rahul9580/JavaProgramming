package algo;

import java.util.Scanner;
import java.util.Stack;

public class Solution {
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		int t = in.nextInt();
		for (int a0 = 0; a0 < t; a0++) {
			String s = in.next();
			Boolean isDone = false;
			Stack<String> stack = new Stack<String>();
			char[] c = s.toCharArray();
			for (char temp : c) {
				String str = Character.toString(temp);
				if (str.equalsIgnoreCase("(") || str.equalsIgnoreCase("{") || str.equalsIgnoreCase("[")) {
					stack.push(str);
				} else if (str.equalsIgnoreCase(")") || str.equalsIgnoreCase("}") || str.equalsIgnoreCase("]")) {
					if (stack.isEmpty()) {
						isDone = true;
						break;
					}

					if ((str.equals(")") && stack.peek().equals("(")) || (str.equals("}") && stack.peek().equals("{"))
							|| (str.equals("]") && stack.peek().equals("["))) {
						stack.pop();
					} else {
						isDone = true;
						break;
					}
				}
			}
			if (stack.isEmpty() && isDone == false) {
				System.out.println("YES");
			} else {
				System.out.println("NO");
			}

		}

	}

}
