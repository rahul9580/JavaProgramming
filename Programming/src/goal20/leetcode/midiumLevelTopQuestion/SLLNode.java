package goal20.leetcode.midiumLevelTopQuestion;

import java.util.Objects;

public class SLLNode {
    int val;
    SLLNode next;

    public SLLNode() {}

    public SLLNode(int val) {
        this.val = val;
    }

    public static SLLNode createSLL(int arr[]) {
        SLLNode head = null;
        SLLNode tail = null;
        for(int data : arr) {
            SLLNode node = new SLLNode(data);
            if(Objects.isNull(head)) {
                head = node;
            } else {
                tail.next = node;
            }
            tail = node;
        }
        return head;
    }
}
