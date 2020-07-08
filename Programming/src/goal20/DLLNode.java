package goal20;

import java.util.Objects;

public class DLLNode {
    int data;
    DLLNode prev;
    DLLNode next;

    public DLLNode() {}

    public DLLNode(int data) {
        this.data = data;
    }

    public static DLLNode createDLL(int arr[]) {
        DLLNode head = null;
        DLLNode tail = null;
        for(int data : arr) {
            DLLNode node = new DLLNode(data);
            if(Objects.isNull(head)) {
                head = node;
            } else {
                tail.next = node;
                node.prev = tail;
            }
            tail = node;
        }
        return head;
    }
}
