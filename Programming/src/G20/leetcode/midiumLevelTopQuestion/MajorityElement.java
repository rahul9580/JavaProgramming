package G20.leetcode.midiumLevelTopQuestion;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

public class MajorityElement {

    public static int majorityElement(int[] nums) {
        Map<Integer, Integer> map = new HashMap<>();
        for(int n : nums) {
            if(Objects.isNull(map.get(n))) {
                map.put(n, 0);
            }
            if(map.get(n) >= nums.length/2) {
                return n;
            }
            map.put(n, map.get(n) + 1);
        }

        return -1;
    }

    public static void main(String[] args) {
        int arr[] = {2,2,1,1,1,2,2};
        System.out.println(majorityElement(arr));
    }
}
