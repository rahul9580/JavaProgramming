package G20.leetcode.midiumLevelTopQuestion;

public class MyPow {

    public static double myPow(double x, int n) {

        double d = 1.00;
        if(x == 1.0) {
            return d;
        }
        if(n == 0) {
            return d;
        } else if(n > 0) {
            int i = 0;
            while(i < n) {
                d = d*x;
                i++;
            }
        } else {
            int i = n;
            while (i < 0) {
                d = d/x;
                i++;
            }
        }

        return d;
    }

    public static void main(String[] args) {
        System.out.println(myPow(2.00000, -2147483648));
        System.out.println(Math.pow(2.00000, -2147483648));
        System.out.println(Integer.MIN_VALUE);
    }
}
