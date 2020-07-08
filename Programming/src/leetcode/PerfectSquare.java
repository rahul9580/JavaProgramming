package leetcode;

public class PerfectSquare {

    public static boolean isPerfectSquare1(int n) {
        int sqrt = (int) Math.sqrt(n);
        if(sqrt*sqrt == n) return true;
        return false;
    }

    public static boolean isPerfectSquare(int n) {
        for(int i = 0; i <= n/2; i++) {
            if(i*i == n) return true;
        }
        return false;
    }
    public static void main(String[] args) {
        System.out.println(isPerfectSquare(16));
    }
}
