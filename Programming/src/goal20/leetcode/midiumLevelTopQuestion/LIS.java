package goal20.leetcode.midiumLevelTopQuestion;

public class LIS {

    public static int lengthOfLIS(int[] nums) {

        int memoization[] = new int[nums.length];

        for(int i = 0; i < nums.length; i++) {
            memoization[i] = 1;
        }

        for(int i = 1; i < nums.length; i++) {
            for(int j = 0; j < i; j++) {
                if(nums[j] < nums[i]) {
                    if(memoization[i] < memoization[j] + 1) {
                        memoization[i] = memoization[j] + 1;
                    }
                }
            }
        }

        int max = 0;
        for(int i = 0; i < nums.length; i++) {
            if(max < memoization[i]) {
                max = memoization[i];
            }
        }
        return max;
    }

    public static void main(String[] args) {
        int arr[] = {};
        System.out.println(lengthOfLIS((arr)));
    }
}
