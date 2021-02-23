package leetcode;

/*
* Given a string s, return the longest palindromic substring in s.

Example 1:
Input: s = "babad"
Output: "bab"
Note: "aba" is also a valid answer.
* */
public class LongestPalindromicSubstring {

    public static String longestPalindrome(String s) {
        int startPal = 0;
        int endPal = 0;
        int n = s.length();
        boolean memoization[][] = new boolean[n][n];
        for(int i = 0; i<n; i++) {
            memoization[i][i] = true;
        }
        for(int i = 0; i < n-1; i++) {
            if(s.charAt(i) == s.charAt(i+1)) {
                memoization[i][i+1] = true;
                startPal = i;
                endPal = i+1;
            }
        }

        for(int it = 2; it < n; it++) {
            int i = 0;
            int j = it;
            while(i < n && j < n) {
                int max = Integer.MIN_VALUE;
                if(s.charAt(i) == s.charAt(j) && memoization[i+1][j-1] == true) {
                    memoization[i][j] = true;
                    if(endPal - startPal < j - i) {
                        startPal = i;
                        endPal = j;
                    }
                }

                i++; j++;
            }
        }

        return s.substring(startPal, endPal + 1);
    }

    public static void main(String[] args) {
        String s = "aacabdkacaa";
        String out = longestPalindrome(s);
        System.out.println(out);
    }
}
