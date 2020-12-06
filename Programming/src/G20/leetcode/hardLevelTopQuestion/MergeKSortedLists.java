package G20.leetcode.hardLevelTopQuestion;

import java.util.Comparator;
import java.util.PriorityQueue;

class ListNode {
      int val;
      ListNode next;
      ListNode() {}
      ListNode(int val) { this.val = val; }
      ListNode(int val, ListNode next) { this.val = val; this.next = next; }
}

class HeapNode {
    int listNumber;
    ListNode node;
}

public class MergeKSortedLists {

    public static ListNode mergeKLists(ListNode[] lists) {
        int k = lists.length;
        ListNode outputHead = null;
        ListNode outputTail = null;
        if(k == 0) return null;
        Comparator<HeapNode> heapNodeComparator = new Comparator<HeapNode>(){
            @Override
            public int compare(HeapNode o1, HeapNode o2) {
                return o1.node.val - o2.node.val;
            }
        };


        PriorityQueue<HeapNode> pq = new PriorityQueue<>(k, heapNodeComparator);
        for(int i = 0; i < k; i++) {
            HeapNode heapNode = new HeapNode();
            heapNode.listNumber = i;
            if(lists[i] != null) {
                heapNode.node = lists[i];
                lists[i] = lists[i].next;
                pq.add(heapNode);
            }
        }

        while(!pq.isEmpty()) {
            HeapNode heapNode = pq.poll();
            if(outputHead == null) {
                outputHead = outputTail = heapNode.node;
            } else {
                outputTail.next = heapNode.node;
                outputTail = outputTail.next;
            }

            int listNumber = heapNode.listNumber;
            if(lists[listNumber] != null) {
                HeapNode newHeapNode = new HeapNode();
                newHeapNode.listNumber = listNumber;
                newHeapNode.node = lists[listNumber];
                pq.add(newHeapNode);
                lists[listNumber] = lists[listNumber].next;
            }
        }

        return outputHead;
    }

    public static void main(String[] args) {
        ListNode list1 = new ListNode(1);
        list1.next = new ListNode(2);
        ListNode list2 = new ListNode(3);
        list2.next = new ListNode(4);
        ListNode arr[] = {list1, list2};
        ListNode output = mergeKLists(arr);

        while (output != null) {
            System.out.println(output.val);
            output = output.next;
        }
    }
}
