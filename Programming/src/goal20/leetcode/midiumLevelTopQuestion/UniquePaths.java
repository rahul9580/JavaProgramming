package goal20.leetcode.midiumLevelTopQuestion;

public class UniquePaths {

    public static int uniquePaths(int m, int n) {

        if(m == 0 || n == 0) {
            return 0;
        }

        int memoization[][] = new int[m][n];

        for(int i = 0; i < m; i++) {
            memoization[i][0] = 1;
        }
        for(int j = 0; j < n; j++) {
            memoization[0][j] = 1;
        }

        for(int i = 1; i < m; i++) {
            for(int j = 1; j < n; j++) {
                memoization[i][j] = memoization[i-1][j] + memoization[i][j-1];
            }
        }

        return memoization[m-1][n-1];
    }

    public static void main(String[] args) {
        System.out.println(uniquePaths(3,2));
    }
}
