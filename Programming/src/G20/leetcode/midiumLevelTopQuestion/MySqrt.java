package G20.leetcode.midiumLevelTopQuestion;

public class MySqrt {

    public static int mySqrt(int x) {
        // Base Cases
        if (x == 0 || x == 1)
            return x;

        // Do Binary Search for floor(sqrt(x))
        int start = 1, end = x/2, ans=0;
        while (start <= end)
        {
            int mid = start + (end - start) / 2;

            // If x is a perfect square
            if (mid*mid == x)
                return mid;

            // Since we need floor, we update answer when mid*mid is
            // smaller than x, and move closer to sqrt(x)
            if (mid*mid < x)
            {
                start = mid + 1;
                ans = mid;
            }
            else   // If mid*mid is greater than x
                end = mid-1;
        }
        return ans;
    }

    public static void main(String[] args) {
        System.out.println(mySqrt(2147395599));
        System.out.println((int)Math.sqrt(1));
        System.out.println(Integer.MAX_VALUE);
    }
}
