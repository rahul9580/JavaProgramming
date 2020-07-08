package goal20.leetcode.midiumLevelTopQuestion;

import java.util.PriorityQueue;

public class KthLargestElement {

    public static int findKthLargest(int[] nums, int k) {

        PriorityQueue<Integer> pq = new PriorityQueue<Integer>(k);

        for(Integer i : nums) {
            if(pq.size() < k) {
                pq.offer(i);
            } else if (i > pq.peek()) {
                pq.poll();
                pq.offer(i);
            }
        }

        return pq.peek();
    }

    public static void main(String[] args) {
        int arr[] = {3,2,3,1,2,4,5,8,10,5,6};
        System.out.println(findKthLargest(arr, 4));
    }

}
