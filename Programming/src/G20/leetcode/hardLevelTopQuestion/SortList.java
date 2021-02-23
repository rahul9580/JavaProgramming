package G20.leetcode.hardLevelTopQuestion;

/**
 * Given the head of a linked list, return the list after sorting it in ascending order.
 *
 * Follow up: Can you sort the linked list in O(n logn) time and O(1) memory (i.e. constant space)?
 */
public class SortList {

    public ListNode sortList(ListNode head) {
        if(head == null || head.next == null) {
            return head;
        }

        ListNode slow = head;
        ListNode fast = head;

        while(fast.next != null && fast.next.next != null) {
            slow = slow.next;
            fast = fast.next.next;
        }
        ListNode h1 = head;
        ListNode h2 = slow.next;
        slow.next = null;
        ListNode l1 = sortList(h1);
        ListNode l2 = sortList(h2);
        return mergeList(l1, l2);
    }

    public ListNode mergeList(ListNode l1, ListNode l2) {
        if(l1 == null) {
            return l2;
        }
        if(l2 == null) {
            return l1;
        }

        ListNode l3Head = null;
        ListNode l3Tail = null;
        while(l1 != null && l2 != null) {
            ListNode small = null;
            if(l1.val < l2.val) {
                small = l1;
                l1 = l1.next;
            } else {
                small = l2;
                l2 = l2.next;
            }
            small.next = null;

            if(l3Head == null) {
                l3Head = l3Tail = small;
            } else {
                l3Tail.next = small;
                l3Tail = l3Tail.next;
            }
        }
        if(l1 != null) {
            l3Tail.next = l1;
        } else if(l2 != null) {
            l3Tail.next = l2;
        }

        return l3Head;
    }

    // Working fine tested code on leetcode
    public static void main(String[] args) {

    }
}
