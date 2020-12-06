package G20.leetcode.hardLevelTopQuestion;

import java.util.Comparator;
import java.util.PriorityQueue;

public class KthSmallestElementInASortedMatrix {

    static class HeapNode {
        int i;
        int j;
        int val;
        HeapNode(int i, int j, int val) {
            this.i = i;
            this.j = j;
            this.val = val;
        }
    }

    public static int kthSmallest(int[][] matrix, int k) {
        int m = matrix.length;
        if(m == 0) return -1;
        int n = matrix[0].length;
        Comparator<HeapNode> heapNodeComparator = new Comparator<HeapNode>(){
            @Override
            public int compare(HeapNode o1, HeapNode o2) {
                return o1.val - o2.val;
            }
        };

        PriorityQueue<HeapNode> pq = new PriorityQueue<>(m, heapNodeComparator);
        for(int i = 0; i < m; i++) {
            HeapNode heapNode = new HeapNode(i, 0, matrix[i][0]);
            pq.add(heapNode);
        }

        int count = 0;
        int kthSmallest = matrix[0][0];
        while (count < k) {
            HeapNode heapNode = pq.poll();
            kthSmallest = heapNode.val;
            int row = heapNode.i;
            if(heapNode.j+1 < n) {
                HeapNode newHeapNode = new HeapNode(row, heapNode.j+1, matrix[row][heapNode.j+1]);
                pq.add(newHeapNode);
            }
            count++;
        }

        return kthSmallest;
    }

    public static void main(String[] args) {
        int matrix[][] = {{1,  5,  9}, {10, 11, 13}, {12, 13, 15}};
        int k = 8;

        System.out.println(kthSmallest(matrix, k));
    }
}
