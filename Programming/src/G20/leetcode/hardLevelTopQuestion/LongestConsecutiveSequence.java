package G20.leetcode.hardLevelTopQuestion;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

public class LongestConsecutiveSequence {

    public static int longestConsecutive(int[] nums) {

        Map<Integer, Boolean> map = new HashMap<>();
        for(Integer i : nums) {
            map.put(i, true);
        }

        int max = 0;
        for(Integer i : nums) {
            if(Objects.isNull(map.get(i-1))) {
                int count = 1;
                int num = i+1;
                while(Objects.nonNull(map.get(num))) {
                    count++;
                    num++;
                }
                if(count > max) {
                    max = count;
                }
            }
        }

        return max;
    }

    public static void main(String[] args) {
        int arr[] = {100, 4, 200, 1, 3, 2};
        System.out.println(longestConsecutive(arr));
    }
}
