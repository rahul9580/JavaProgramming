package G20.leetcode.midiumLevelTopQuestion;

public class IncreasingTripletSubsequence {

    public static boolean increasingTriplet(int[] nums) {
        if(nums.length < 3) {
            return false;
        }
        int min[] = new int[nums.length];
        int max[] = new int[nums.length];
        min[0] = nums[0];
        max[nums.length-1] = nums[nums.length-1];
        for(int i = 1; i < nums.length; i++) {
            if(min[i-1] < nums[i]) {
                min[i] = min[i-1];
            } else {
                min[i] = nums[i];
            }
        }
        for(int i = nums.length-2; i >= 0; i--) {
            if(max[i+1] > nums[i]) {
                max[i] = max[i+1];
            } else {
                max[i] = nums[i];
            }
        }
        for(int i = 0; i < nums.length; i++) {
            if(min[i] < nums[i] && max[i] > nums[i]) {
                return true;
            }
        }

        return false;
    }

    public static void main(String[] args) {
        int arr[] = {};
        System.out.println(increasingTriplet(arr));
    }
}
