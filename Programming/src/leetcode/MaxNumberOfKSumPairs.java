package leetcode;

import java.util.Arrays;
/*You are given an integer array nums and an integer k.

In one operation, you can pick two numbers from the array whose sum equals k and remove them from the array.

Return the maximum number of operations you can perform on the array.



Example 1:

Input: nums = [1,2,3,4], k = 5
Output: 2
Explanation: Starting with nums = [1,2,3,4]:
- Remove numbers 1 and 4, then nums = [2,3]
- Remove numbers 2 and 3, then nums = []
There are no more pairs that sum up to 5, hence a total of 2 operations.*/
public class MaxNumberOfKSumPairs {

    public static int maxOperations(int[] nums, int k) {
        Arrays.sort(nums);
        int count = 0;
        for(int i = 0, j = nums.length - 1; i < j;) {
            if(nums[i] + nums[j] == k) {
                count++;
                i++; j--;
            } else if(nums[i] + nums[j] < k) {
                i++;
            } else {
                j--;
            }
        }

        return count;
    }

    public static void main(String[] args) {
        int arr[] = {1,2,3,4};
        System.out.println(maxOperations(arr, 5));
    }
}
