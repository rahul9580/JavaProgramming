package G20.leetcode.hardLevelTopQuestion;
/*
Given an integer array nums, find the contiguous subarray within an array (containing at least one number) which has the largest product.

Example 1:

Input: [2,3,-2,4]
Output: 6
Explanation: [2,3] has the largest product 6.
Example 2:

Input: [-2,0,-1]
Output: 0
Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
*/
public class MaximumProductSubarray {

    public static int maxProduct(int[] nums) {
        /*int n = nums.length;
        int memoization[][] = new int[n][n];

        int max = Integer.MIN_VALUE;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                if(i==j) {
                    memoization[i][j] = nums[i];
                } else {
                    memoization[i][j] = memoization[i][j-1] * nums[j];
                }
                if(max < memoization[i][j]) {
                    max = memoization[i][j];
                }
            }
        }

        return max;
        */


        int n = nums.length;
        if(n == 1) return nums[0];
        // max positive product ending at the current position
        int max_ending_here = 1;

        // min negative product ending at the current position
        int min_ending_here = 1;

        // Initialize overall max product
        int max_so_far = 1;
        int flag = 0;

        /* Traverse through the array. Following
        values are maintained after the ith iteration:
        max_ending_here is always 1 or some positive product
                        ending with arr[i]
        min_ending_here is always 1 or some negative product
                        ending with arr[i] */
        for (int i = 0; i < n; i++) {
            /* If this element is positive, update max_ending_here.
                Update min_ending_here only if min_ending_here is
                negative */
            if (nums[i] > 0) {
                max_ending_here = max_ending_here * nums[i];
                min_ending_here = Math.min(min_ending_here * nums[i], 1);
                flag = 1;
            }

            /* If this element is 0, then the maximum product cannot
            end here, make both max_ending_here and min_ending
            _here 0
            Assumption: Output is alway greater than or equal to 1. */
            else if (nums[i] == 0) {
                max_ending_here = 1;
                min_ending_here = 1;
            }

            /* If element is negative. This is tricky
            max_ending_here can either be 1 or positive.
            min_ending_here can either be 1 or negative.
            next min_ending_here will always be prev.
            max_ending_here * arr[i]
            next max_ending_here will be 1 if prev
            min_ending_here is 1, otherwise
            next max_ending_here will be
            prev min_ending_here * arr[i] */
            else {
                int temp = max_ending_here;
                max_ending_here = Math.max(min_ending_here * nums[i], 1);
                min_ending_here = temp * nums[i];
            }

            // update max_so_far, if needed
            if (max_so_far < max_ending_here)
                max_so_far = max_ending_here;
        }

        // if all values in array is non positive and max_so_far,
        // check if two contiguous -1 exists ans will be 1
        // otherwise ans will be 0
        if (flag == 0 && max_so_far == 1) {
            for (int i = 0; i < n-1; i++) {
                if(nums[i] == -1 && nums[i+1] == -1) {
                    return 1;
                }
            }
            return 0;
        }

        return max_so_far;
    }

    public static void main(String[] args) {
        int arr[] = {-1,-1, 1, -1, 2};
        System.out.println(maxProduct(arr));
    }
}
