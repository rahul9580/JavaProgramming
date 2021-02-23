package G20.leetcode.hardLevelTopQuestion;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Stack;

/**
 * Given a string s which represents an expression, evaluate this expression and return its value.
 *
 * The integer division should truncate toward zero.
 *
 *
 *
 * Example 1:
 *
 * Input: s = "3+2*2"
 * Output: 7
 * Example 2:
 *
 * Input: s = " 3/2 "
 * Output: 1
 * Example 3:
 *
 * Input: s = " 3+5 / 2 "
 * Output: 5
 *
 */
public class BasicCalculator2 {

    private static final List<String> precedence = new ArrayList<>(Arrays.asList("+", "-", "/", "*"));

    private static boolean precedenceCompare(String a, String b) {
        return precedence.indexOf(a) >= precedence.indexOf(b);
    }

    private static int doOperation(Integer v1, Integer v2, String operator) {
        switch (operator) {
            case "+":
                return v1 + v2;
            case "-":
                return v1 - v2;
            case "*":
                return v1 * v2;
            case "/":
                return v1 / v2;
        }
        return 0;
    }

    private static boolean isOperator(String s) {
        switch (s) {
            case "+":
            case "-":
            case "*":
            case "/":
                return true;
            default:
                return false;
        }
    }

    private static List<String> convertInfixToPostfix(String strArr[]) {
        List<String> postFix = new ArrayList<>();
        Stack<String> stack = new Stack<>();
        for(String s : strArr) {
            if(!isOperator(s)) {
                postFix.add(s);
            } else {
                if(stack.isEmpty()) {
                    stack.push(s);
                } else {
                    while(!stack.isEmpty() && precedenceCompare(stack.peek(), s)) {
                        postFix.add(stack.pop());
                    }
                    stack.push(s);
                }
            }
        }
        while (!stack.isEmpty()) {
            postFix.add(stack.pop());
        }
        return postFix;
    }

    private static int stringToInt(String s) {
        int num = 0;
        for(Character c : s.toCharArray()) {
            num = (num * 10) + (c-48);
        }
        return num;
    }

    private static int evaluatePostfix(List<String> strArr) {
        Stack<Integer> stack = new Stack<>();
        for(String s : strArr) {
            if(!isOperator(s)) {
                stack.push(stringToInt(s));
            } else {
                Integer v1 = stack.pop();
                Integer v2 = stack.pop();
                Integer cal = doOperation(v2, v1, s);
                stack.push(cal);
            }
        }

        return stack.pop();
    }

    private static String[] tokenize(String s) {
        List<String> tokens = new ArrayList<>();
        String token = "";
        for(Character c : s.toCharArray()) {
            if(isOperator(c.toString())) {
                tokens.add(token);
                tokens.add(c.toString());
                token = "";
            } else {
                token+=c.toString();
            }
        }
        tokens.add(token);
        String[] tokenArr = new String[tokens.size()];
        tokens.toArray(tokenArr);
        return tokenArr;
    }

    public static int calculate(String s) {
        String noSpaceStr = s.replaceAll("\\s", "");
        String[] strArr = tokenize(noSpaceStr);
        List<String> postfix = convertInfixToPostfix(strArr);
        return evaluatePostfix(postfix);
    }

    public static void main(String[] args) {
        String s = "1+2*5/3+6/4*2";
        System.out.println(calculate(s));
    }
}
