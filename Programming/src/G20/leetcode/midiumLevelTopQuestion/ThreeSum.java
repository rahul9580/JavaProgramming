package G20.leetcode.midiumLevelTopQuestion;

import java.util.*;

public class ThreeSum {
    public static List<List<Integer>> threeSum(int[] nums) {

        List<List<Integer>> lists = new ArrayList<>();
        Arrays.sort(nums);

        for(int idx = 0; idx < nums.length - 2; idx ++) {

            int st = idx + 1;
            int end = nums.length - 1;
            while (st < end) {
                if(nums[idx] + nums[st] + nums[end] == 0) {
                    List<Integer> list = new ArrayList<>();
                    list.add(nums[idx]);
                    list.add(nums[st]);
                    list.add(nums[end]);
                    if(isUniqueList(lists, list))
                        lists.add(list);
                    st++;
                    end--;
                } else if(nums[idx] + nums[st] + nums[end] > 0) {
                    end--;
                } else {
                    st++;
                }
            }
        }
        return lists;
    }

    private static boolean isUniqueList(List<List<Integer>> existing, List<Integer> list) {
        for(List<Integer> existingList : existing) {
            Collections.sort(existingList);
            Collections.sort(list);
            if(existingList.equals(list)) {
                return false;
            }
        }
        return true;
    }

    private static int[] removeDuplicate(int[] nums) {
        HashMap<Integer, Boolean> map = new HashMap<>();
        List<Integer> list = new ArrayList<>();
        for(int num : nums) {
            if(Objects.isNull(map.get(num))) {
                list.add(num);
                map.put(num, true);
            }
        }
        int arr[] = new int[list.size()];
        for (int i =0; i < list.size(); i++)
            arr[i] = list.get(i);
        return arr;
    }

    public static void main(String[] args) {
        int arr[] = {-1,0,1,2,-1,-4};
        //int newArr[] = removeDuplicate(arr);
        System.out.println(threeSum(arr));
    }
}
