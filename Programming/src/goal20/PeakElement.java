package goal20;

public class PeakElement {

    public static int findPeakElement(int[] nums) {

        if(nums.length == 0) {
            return -1;
        }
        if(nums.length == 1) {
            return 0;
        }
        if(nums[0] > nums[1]) {
            return 0;
        }

        int i = 1;
        while (i < nums.length - 1) {
            if(nums[i-1] < nums[i] && nums[i+1] < nums[i]) {
                return i;
            }
            i++;
        }

        if(nums[nums.length-1] > nums[nums.length-2]) {
            return nums.length-1;
        }

        return -1;
    }

    public static void main(String[] args) {
        int arr[] = {1,2,1,3,5,6,4};
        System.out.println(findPeakElement(arr));
    }
}
