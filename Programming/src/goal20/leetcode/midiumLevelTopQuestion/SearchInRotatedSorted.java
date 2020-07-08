package goal20.leetcode.midiumLevelTopQuestion;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class SearchInRotatedSorted {

    public static int search(int[] nums, int target) {

        int st = 0;
        int end = nums.length-1;

        while(st <= end) {
            int mid = st + (end - st) / 2;
            if(nums[mid] == target) {
                return mid;
            } else if(nums[st] < nums[mid]) {
                if(target < nums[st]) {
                    st = mid + 1;
                } else {
                    end = mid - 1;
                }
            } else {
                if(target <= nums[end]) {
                    st = mid + 1;
                } else {
                    end = mid - 1;
                }
            }
        }
        return -1;
    }

    public static void main(String[] args) throws IOException {
        int arr[] = {1,3,5};
        //System.out.println(search(arr, 5));
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int i = Integer.parseInt(br.readLine());
        System.out.println(i);
    }
}
