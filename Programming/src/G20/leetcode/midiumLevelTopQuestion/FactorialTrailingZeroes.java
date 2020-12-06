package G20.leetcode.midiumLevelTopQuestion;

public class FactorialTrailingZeroes {

    public static long trailingZeroes(int n) {
        long trailingZeroes = 0;

        int i = 5;
        while(i <= n) {
            trailingZeroes += Math.floor(n/i);
            i *= 5;
        }

        return trailingZeroes;
    }

    public static int factorial(int n) {
        if(n == 0 || n == 1) {
            return 1;
        }
        return n * factorial(n-1);
    }

    public static void main(String[] args) {
        System.out.println(factorial(30));
        System.out.println(trailingZeroes(1808548329));
    }
}
