/**
 * 
 */
package leetcode;

/**
 * @author rahul.kumar
 *
 */

// Definition for singly-linked list.
class ListNode {
	int val;
	ListNode next;

	ListNode(int x) {
		val = x;
	}
}

public class MergeLists {

	public static ListNode mergeTwoLists(ListNode l1, ListNode l2) {
		if (null == l1)
			return l2;
		if (null == l2)
			return l1;
		ListNode res = null;
		ListNode result = null;
		while (l1 != null && l2 != null) {
			if (l1.val < l2.val) {
				ListNode temp = l1;
				l1 = l1.next;
				temp.next = null;
				if (res == null) {
					result = res = temp;
				} else {
					res.next = temp;
					res = res.next;
				}
			} else {
				ListNode temp = l2;
				l2 = l2.next;
				temp.next = null;
				if (res == null) {
					result = res = temp;
				} else {
					res.next = temp;
					res = res.next;
				}
			}
		}

		if (null != l1)
			res.next = l1;
		if (null != l2)
			res.next = l2;

		return result;
	}

	public static void main(String[] args) {
		ListNode l1 = new ListNode(1);
		l1.next = new ListNode(2);
		l1.next.next = new ListNode(4);
		ListNode l2 = new ListNode(1);
		l2.next = new ListNode(3);
		l2.next.next = new ListNode(4);
		ListNode res = mergeTwoLists(l1, l2);
		while (res != null) {
			System.out.println(res.val);
			res = res.next;
		}
	}

}
