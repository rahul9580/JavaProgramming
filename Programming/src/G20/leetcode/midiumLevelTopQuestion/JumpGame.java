package G20.leetcode.midiumLevelTopQuestion;

public class JumpGame {

    public static boolean canJump(int[] nums) {
        if(nums.length == 0) {
            return false;
        }
        boolean memoization[] = new boolean[nums.length];
        memoization[nums.length-1] = true;
        for(int i = nums.length - 2; i >= 0; i--) {
            int j = 1;
            while (j <= nums[i] && j < nums.length) {
                if(memoization[i+j]) {
                    memoization[i] = true;
                    break;
                }
                j++;
            }
        }
        return memoization[0];
    }

    public static void main(String[] args) {
        int arr[] = {0,0};
        System.out.println(canJump(arr));
    }
}
