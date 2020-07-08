package goal20.leetcode.midiumLevelTopQuestion;

import java.util.Objects;

public class ListAddTwoNumbers {

    public static SLLNode addTwoNumbers(SLLNode l1, SLLNode l2) {

        if(Objects.isNull(l1)) {
            return l2;
        }
        if(Objects.isNull(l2)) {
            return l1;
        }
        SLLNode ols = null;
        SLLNode ole = null;
        int carry = 0;
        while (Objects.nonNull(l1) && Objects.nonNull(l2)) {
            int data = l1.val + l2.val + carry;

            SLLNode newNode = new SLLNode();
            newNode.val = data%10;
            carry = data/10;
            if(Objects.isNull(ols)) {
                ols = ole = newNode;
            } else {
                ole.next = newNode;
                ole = newNode;
            }

            l1 = l1.next;
            l2 = l2.next;
        }

        while(Objects.nonNull(l1)) {
            int data = l1.val + carry;

            SLLNode newNode = new SLLNode();
            newNode.val = data%10;
            carry = data/10;
            if(Objects.isNull(ols)) {
                ols = ole = newNode;
            } else {
                ole.next = newNode;
                ole = newNode;
            }
            l1 = l1.next;
        }
        while(Objects.nonNull(l2)) {
            int data = l2.val + carry;

            SLLNode newNode = new SLLNode();
            newNode.val = data%10;
            carry = data/10;
            if(Objects.isNull(ols)) {
                ols = ole = newNode;
            } else {
                ole.next = newNode;
                ole = newNode;
            }
            l2 = l2.next;
        }
        if(carry > 0) {
            int data = carry;

            SLLNode newNode = new SLLNode();
            newNode.val = data%10;
            carry = data/10;
            if(Objects.isNull(ols)) {
                ols = ole = newNode;
            } else {
                ole.next = newNode;
                ole = newNode;
            }
        }

        return ols;
    }

    public static void main(String[] args) {
        System.out.println(addTwoNumbers(null, null));
    }
}
