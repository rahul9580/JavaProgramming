package goal20.leetcode.midiumLevelTopQuestion;

import java.util.Objects;

public class RemoveMiddleOfLList {

    private void removeMiddleElement(SLLNode head) {
        if(Objects.isNull(head)) return;
        SLLNode slow = head, fast = head;
        while (Objects.nonNull(fast)) {
            slow = slow.next;
            fast = fast.next;
            if(Objects.nonNull(fast)) {
                fast = fast.next;
            }
        }
    }

    public static void main(String[] args) {
        int arr[] = {1,2,3,4,5};
        SLLNode head = SLLNode.createSLL(arr);
    }
}
