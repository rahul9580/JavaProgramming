package G20.leetcode.midiumLevelTopQuestion;

public class MedianInTwoSortedArrays {

    public static double findMedianSortedArrays(int[] nums1, int[] nums2) {

        int m = nums1.length;
        int n = nums2.length;

        int medianIdx = (m+n)/2;
        int i = 0;
        int i1 = 0;
        int i2 = 0;
        boolean first = false;
        while(i < medianIdx) {

            if(i1 < m && i2 < n) {
                if(nums1[i1] < nums2[i2]) {
                    i1++;
                    first = true;
                } else {
                    i2++;
                    first = false;
                }
            } else if (i1 == m) {
                i2++;
                first = false;
            } else {
                i1++;
                first = true;
            }

            i++;
        }

        int firstEle = 0;
        int secEle = 0;
        if((m+n)%2 != 0) {
            if((i1 < m && i2 < n && nums1[i1] < nums2[i2]) || i2 == n) {
                firstEle = nums1[i1];
                i1++;
            } else if((i1 < m && i2 < n && nums1[i1] >= nums2[i2]) || i1 == m) {
                firstEle = nums2[i2];
                i2++;
            }
            return firstEle;
        } else {
            if(first) {
                firstEle = nums1[i1-1];
            } else {
                firstEle = nums2[i2-1];
            }
            if((i1 < m && i2 < n && nums1[i1] < nums2[i2]) || i2 == n) {
                secEle = nums1[i1];
            } else if((i1 < m && i2 < n && nums1[i1] >= nums2[i2]) || i1 == m) {
                secEle = nums2[i2];
            }
            return ((double) secEle + (double) firstEle) / 2;
        }

    }

    public static void main(String[] args) {
        int ar1[] = {0,0};
        int ar2[] = {0,0};
        System.out.println(findMedianSortedArrays(ar1, ar2));
    }
}
