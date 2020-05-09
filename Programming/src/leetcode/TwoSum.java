/**
 * 
 */
package leetcode;

import java.util.Arrays;

/**
 * @author rahul.kumar
 *
 */
public class TwoSum {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		int[] nums = {2,7,11,15};
		
		int target = 9;
		int result[] = new int[2];

		Arrays.sort(nums);
		int i = 0;
		int j = nums.length - 1;
		
		while(i < j) {
			if(nums[i] + nums[j] == target) {
				result[0] = i;
				result[1] = j;
				break;
			} else if(nums[i] + nums[j] < target) {
				i++;
			} else {
				j--;
			}
		}
		
		System.out.println(result);
		
	}

}
