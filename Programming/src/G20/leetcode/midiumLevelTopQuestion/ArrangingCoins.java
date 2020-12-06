package G20.leetcode.midiumLevelTopQuestion;

public class ArrangingCoins {

    public static int arrangeCoins(int n) {

        long nn = n;
        if(n < 2) return n;

        long base = 0;
        long count = 1;
        long it = base + count;
        while(true) {
            while(it*(it+1)/2 < nn) {
                count = count * 2;
                it = base + count;
                System.out.println(count);
            }
            base = (it-base)/2 + base;
            count = 1;
            it = base + count;
            if((it)*(it+1)/2 > nn) {
                return (int) base;
            }
        }
    }

    public static void main(String[] args) {
        System.out.println(arrangeCoins(3));
    }
}
