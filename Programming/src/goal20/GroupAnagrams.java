package goal20;

import java.util.*;

public class GroupAnagrams {

    public static List<List<String>> groupAnagrams(String[] strs) {

        Map<String, List<String>> map = new HashMap<>();
        for(String str : strs) {
            char[] ar = str.toCharArray();
            Arrays.sort(ar);
            String sorted = String.valueOf(ar);

            if(Objects.isNull(map.get(sorted))) {
                map.put(sorted, new ArrayList<>());
            }
            map.get(sorted).add(str);
        }

        List<List<String>> output = new ArrayList<>();
        for(Map.Entry entry : map.entrySet()) {
            output.add((List<String>) entry.getValue());
        }

        return output;
    }

    public static void main(String[] args) {
        String arr[] = {"eat", "tea", "tan", "ate", "nat", "bat"};
        System.out.println(groupAnagrams(arr));
    }
}
