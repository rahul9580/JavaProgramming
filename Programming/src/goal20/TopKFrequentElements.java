package goal20;

import java.util.*;

class MyNode implements Comparable<MyNode>{
    Integer num;
    Integer freq;
    MyNode(Integer num, Integer freq) {
        this.num = num;
        this.freq = freq;
    }

    @Override
    public int compareTo(MyNode o) {
        return this.freq.compareTo(o.freq);
    }
}

public class TopKFrequentElements {

    public static int[] topKFrequent(int[] nums, Integer k) {

        Map<Integer, Integer> map = new HashMap<>();
        for(Integer i : nums) {
            if(map.get(i) == null) {
                map.put(i, 0);
            }
            map.put(i, map.get(i)+1);
        }

        Map<Integer, Integer> revMap = new HashMap<>();
        MyNode freq[] = new MyNode[map.entrySet().size()];
        Integer i = 0;
        for(Map.Entry<Integer, Integer> entry : map.entrySet()) {
            revMap.put(entry.getValue(), entry.getKey());
            MyNode node = new MyNode(entry.getKey(), entry.getValue());
            freq[i] = node;
            i++;
        }

        Arrays.sort(freq);

        int output[] = new int[k];

        Integer idx = freq.length -1;
        Integer count = 0;
        while (count < k) {
            output[count] = freq[idx].num;
            idx--;
            count++;
        }

        return output;
    }

    public static void main(String[] args) {
        int arr[] = {1,2};
        int out[] = topKFrequent(arr, 2);
        for(Integer i : out)
            System.out.println(i);
    }
}
