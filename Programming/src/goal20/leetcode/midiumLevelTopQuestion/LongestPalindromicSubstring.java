package goal20.leetcode.midiumLevelTopQuestion;

public class LongestPalindromicSubstring {

    public static String longestPalindrome(String s) {

        boolean memoization[][] = new boolean[s.length()][s.length()];

        String output = "";
        int gap = 0;
        for(int i = 0; i < s.length(); i++) {
            for(int j = 0; j < s.length() - gap; j++) {
                if(gap == 0) {
                    memoization[j][j] = true;
                    output = s.substring(j, j+1);
                } else if(gap == 1) {
                    if(s.charAt(j) == s.charAt(j+gap)) {
                        memoization[j][j+gap] = true;
                        if(output.length() < 2) {
                            output = s.substring(j, j+gap+1);
                        }
                    } else {
                        memoization[j][j+gap] = false;
                    }
                } else {
                    int k = j + gap;
                    if(memoization[j+1][k-1] && s.charAt(j) == s.charAt(k)) {
                        memoization[j][k] = true;
                        if(output.length() < k-j+1) {
                            output = s.substring(j, k+1);
                        }
                    } else {
                        memoization[j][k] = false;
                    }
                }
            }
            gap++;
        }

        return output;
    }

    public static void main(String[] args) {

        String s = "babad";
        System.out.println(longestPalindrome(s));

    }
}
