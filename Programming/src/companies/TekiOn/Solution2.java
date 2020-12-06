package companies.TekiOn;

import java.util.Comparator;
import java.util.PriorityQueue;

/*
print the kth min element at any point in Infinite stream of numbers
*/
public class Solution2 {
    static int k = 5;
    static PriorityQueue<Integer> priorityQueue = new PriorityQueue<>(k);

    /*Comparator<Integer> comparator = new Comparator<Integer>() {
        @Override
        public int compare(Integer o1, Integer o2) {
            if(o1 == o2) return 0;

        }
    }*/

    static int printKthMin() {
        if(priorityQueue.size() < k) {
            return -1;
        } else {
            return priorityQueue.peek();
        }
    }

    static void receiveNumber(int num) {
        if(priorityQueue.size() < k) {
            priorityQueue.add(num);
        } else {
            int kthMin = priorityQueue.peek();
            if(kthMin < num) {
                priorityQueue.poll();
                priorityQueue.add(num);
            }
        }
    }

    public static void main(String[] args) {
        Integer[] arr = {1,2,3,4,5,6,7,8,9,10};
        for(Integer i : arr) {
            receiveNumber(i);
        }

        System.out.println(printKthMin());
    }
}
