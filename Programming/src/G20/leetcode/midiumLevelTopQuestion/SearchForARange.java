package G20.leetcode.midiumLevelTopQuestion;

public class SearchForARange {

    public static int[] searchRange(int[] nums, int target) {

        int st = 0; int end = nums.length-1;
        int a = -1;
        int b = -1;

        int idx = 0;
        while(st <= end && st < nums.length && end >= 0) {
            int mid = st + (end - st)/2;
            if(nums[mid] == target) {
                idx = mid;
                break;
            } else if(nums[mid] >= target) {
                end = mid-1;
            } else {
                st = mid+1;
            }
        }
        int temp = idx;
        while(temp < nums.length && nums[temp] == target) {
            b = temp;
            temp++;
        }

        temp = idx;
        while (temp >= 0 && nums[temp] == target) {
            a = temp;
            temp--;
        }

        int out[] = {a,b};
        return out;
    }

    public static void main(String[] args) {
        int arr[] = {1, 4};
        int out[] = searchRange(arr, 4);
        System.out.println(out);
    }
}
