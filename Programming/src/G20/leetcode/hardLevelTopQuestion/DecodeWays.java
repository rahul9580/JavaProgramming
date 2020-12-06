package G20.leetcode.hardLevelTopQuestion;

/* *
A message containing letters from A-Z is being encoded to numbers using the following mapping:

'A' -> 1
'B' -> 2
...
'Z' -> 26
Given a non-empty string containing only digits, determine the total number of ways to decode it.

Example 1:

Input: "12"
Output: 2
Explanation: It could be decoded as "AB" (1 2) or "L" (12).
* */
public class DecodeWays {
    public static int numDecodings(String s) {
        int count = 0;
        int len = s.length();
        if(len == 0 || s.startsWith("0") || s.contains("00")
                || s.contains("30") || s.contains("40") || s.contains("50") || s.contains("60")
                || s.contains("70")|| s.contains("80") || s.contains("90")) {
            return 0;
        }

        if(len == 1) {
            return 1;
        }
        count++;

        for(int i = 1; i < s.length(); i++) {
            if(Integer.valueOf(s.charAt(i))-48 == 0) {
                continue;
            }
            if(Integer.valueOf(s.charAt(i-1))-48 == 1) {
                count++;
            } else if(Integer.valueOf(s.charAt(i-1))-48 == 2 && Integer.valueOf(s.charAt(i))-48 <= 6) {
                count++;
            }
        }
        return count;
    }

    public static void main(String[] args) {
        String s = "101";
        System.out.println(numDecodings(s));
    }
}
