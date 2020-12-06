package G20.leetcode.midiumLevelTopQuestion;

import java.util.Stack;

public class EvaluateReversePolishNotation {

    public static int evalRPN(String[] tokens) {
        Stack<Integer> stack = new Stack<>();
        for(String token : tokens) {
            switch (token) {
                case "+":
                    stack.push(stack.pop()+stack.pop());
                    break;
                case "-":
                    int a = stack.pop();
                    int b = stack.pop();
                    stack.push(b-a);
                    break;
                case "*":
                    stack.push(stack.pop()*stack.pop());
                    break;
                case "/":
                    int aa = stack.pop();
                    int bb = stack.pop();
                    stack.push(bb/aa);
                    break;
                default:
                    stack.push(Integer.valueOf(token));
            }
        }

        return stack.peek();
    }

    public static void main(String[] args) {
        String arr[] = {"10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"};
        System.out.println(evalRPN(arr));
    }
}
