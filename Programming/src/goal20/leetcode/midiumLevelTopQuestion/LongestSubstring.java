package goal20.leetcode.midiumLevelTopQuestion;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

public class LongestSubstring {

    public static int lengthOfLongestSubstring(String s) {
        int n = s.length();
        int maxLength = 0;
        Map<Character, Integer> map = new HashMap<>();
        int st = 0;
        int end = 0;
        while (end < n) {
            if(Objects.nonNull(map.get(s.charAt(end)))) {
                if(maxLength < end - st) {
                    maxLength = end - st;
                }
                int i = st;
                int idx = map.get(s.charAt(end));
                for(; i <= idx; i++) {
                    map.remove(s.charAt(i));
                }
                st = i;
            }
            map.put(s.charAt(end), end);
            end++;
        }

        if(maxLength < end - st) {
            maxLength = end - st;
        }

        return maxLength;
    }

    public static void main(String[] args) {
        String s = "aaabadecfd";
        System.out.println(lengthOfLongestSubstring(s));
    }
}
