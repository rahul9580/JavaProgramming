package companies.yatra;
import java.util.Stack;

/**
 * 
 */

/**
 * @author rahul
 *
 */
public class BracesBalance {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String arr[] = new String[2];
		arr[0] = "{[}]";
		arr[1] = "{{[]}}()";
		String output[] = braces(arr);
		for(String s : output) {
			System.out.println(s);
		}
	}
	
    static String[] braces(String[] values) {
        String[] output = new String[values.length];
        int count = -1;
        for(String s : values) {
            count++;
            Stack<Character> stack = new Stack<Character>();
            for(int i = 0; i < s.length(); i++) {
                char c = s.charAt(i);
                switch(c) {
                    case '(':
                    case '{':
                    case '[':
                        stack.push(c);
                        break;
                    case ')': {
                        if(stack.isEmpty() || stack.pop() != '(') {
                            output[count] = "NO";
                        }
                        break;
                    }
                    case '}': {
                        if(stack.isEmpty() || stack.pop() != '{') {
                            output[count] = "NO";
                        }
                        break;
                    }
                     case ']': {
                        if(stack.isEmpty() || stack.pop() != '[') {
                            output[count] = "NO";
                        }
                        break;
                    }
                }
            }
            if(!stack.isEmpty())
                output[count] = "NO";
            else
                output[count] = "YES";
        }
        return output;
    }

}
