package algo;

import java.util.Stack;

/**
 * @author rahul
 *
 */
public class BalenceParenthesis {
	public static void main(String[] args) {

		Stack<Character> stk = new Stack<Character>();

		String exp = "{[}]";
		int len = exp.length();
		boolean flag = false;
		for (int i = 0; i < len; i++) {
			char ch = exp.charAt(i);
			switch (ch) {
			case '(':
			case '{':
			case '[':
				stk.push(ch);
				break;
			case ')': {
				if (stk.isEmpty() || '(' != stk.pop()) {
					System.out.println("String is not balenced");
					flag = true;
				}
				break;
			}
			case '}': {
				if (stk.isEmpty() || '{' != stk.pop()) {
					System.out.println("String is not balenced");
					flag = true;
				}
				break;
			}
			case ']': {
				if (stk.isEmpty() || '[' != stk.pop()) {
					System.out.println("String is not balenced");
					flag = true;
				}
				break;
			}
			}
			if (flag)
				break;
		}
		if (!flag) {
			if (!stk.isEmpty())
				System.out.println("String is not balenced");
			else
				System.out.println("String is balenced");
		}
	}
}
