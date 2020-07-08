package goal20;

public class ListIntersection {

    public SLLNode getIntersectionNode(SLLNode headA, SLLNode headB) {

        SLLNode temp1 = headA;
        SLLNode temp2 = headB;

        int len1 = 0;
        int len2 = 0;

        while (temp1 != null) {
            len1++;
            temp1 = temp1.next;
        }
        while (temp2 != null) {
            len2++;
            temp2 = temp2.next;
        }

        while (len1 > len2) {
            headA = headA.next;
            len1--;
        }

        while (len2 > len1) {
            headB = headB.next;
            len2--;
        }

        while (headA != null && headB != null) {
            if(headA == headB) {
                return headA;
            }
            headA = headA.next;
            headB = headB.next;
        }

        return null;
    }

}
