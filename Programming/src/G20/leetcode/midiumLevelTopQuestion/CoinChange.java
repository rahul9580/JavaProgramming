package G20.leetcode.midiumLevelTopQuestion;

public class CoinChange {

    public static int coinChange(int[] coins, int amount) {

        int memoization[] = new int[amount+1];
        for(int i = 0; i < memoization.length; i++) {
            memoization[i] = Integer.MAX_VALUE;
        }
        for(int coin : coins) {
            if(coin < memoization.length)
                memoization[coin] = 1;
        }

        for(int i = 1; i <= amount; i++) {

            for(int j = 0; j < coins.length; j++) {
                if(coins[j] <= i && (memoization[i - coins[j]]) < memoization[i] - 1) {
                    memoization[i] = memoization[i - coins[j]] + 1;
                }
            }

        }
        if(memoization[amount] == Integer.MAX_VALUE) return -1;
        else return memoization[amount];
    }

    public static void main(String[] args) {
        int coins[] = {1};
        System.out.println(coinChange(coins, 0));
    }
}
