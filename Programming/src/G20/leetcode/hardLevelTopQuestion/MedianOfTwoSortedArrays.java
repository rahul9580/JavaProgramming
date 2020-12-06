package G20.leetcode.hardLevelTopQuestion;
/*Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.

Follow up: The overall run time complexity should be O(log (m+n)).

Example 1:

Input: nums1 = [1,3], nums2 = [2]
Output: 2.00000
Explanation: merged array = [1,2,3] and median is 2.
*/
public class MedianOfTwoSortedArrays {

    public static double findMedianSortedArrays(int[] nums1, int[] nums2) {
        int m = nums1.length;
        int n = nums2.length;
        if(m > n) {
            return findMedianSortedArrays(nums2, nums1);
        }

        int low = 0;
        int high = m;
        while (low <= high) {
            int partitionX = (low + high) / 2;
            int partitionY = (m+n+1) / 2 - partitionX;
            int maxLeftX = (partitionX-1) >= 0 ? nums1[partitionX-1] : Integer.MIN_VALUE;
            int maxLeftY = (partitionY-1) >= 0 ? nums2[partitionY-1] : Integer.MIN_VALUE;
            int minRightX = (partitionX) <= m-1 ? nums1[partitionX] : Integer.MAX_VALUE;
            int minRightY = (partitionY) <= n-1 ? nums2[partitionY] : Integer.MAX_VALUE;
            if(maxLeftX <= minRightY && maxLeftY <= minRightX) {
                if((m+n) % 2 == 0) {
                    // Even length
                    return (double) (Math.max(maxLeftX, maxLeftY) + Math.min(minRightX, minRightY))/2;
                } else {
                    return (double) Math.max(maxLeftX, maxLeftY);
                }
            } else if(maxLeftX>minRightY) {
                high = partitionX-1;
            } else {
                low = partitionX+1;
            }
        }
        return -1;
    }

    public static void main(String[] args) {
        int nums1[] = {1};
        int nums2[] = {1};
        // 1,2,3,4,5,6,7,8 - 4,5 - 4.5
        System.out.println(findMedianSortedArrays(nums1, nums2));
    }
}
