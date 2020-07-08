package goal20;

import java.util.Objects;

public class ListOddEvenLinked {

    public SLLNode oddEvenList(SLLNode head) {
        if(null == head) {
            return head;
        }
        int count = 1;
        SLLNode oddSt = null;
        SLLNode oddEnd = null;
        SLLNode evenSt = null;
        SLLNode evenEnd = null;
        while(Objects.nonNull(head)) {
            SLLNode thisNode = head;
            head = head.next;
            thisNode.next = null;
            if(count%2 == 0) {
                if(Objects.isNull(evenSt)) {
                    evenSt = evenEnd = thisNode;
                } else {
                    evenEnd.next = thisNode;
                    evenEnd = thisNode;
                }
            } else {
                if(Objects.isNull(oddSt)) {
                    oddSt = oddEnd = thisNode;
                } else {
                    oddEnd.next = thisNode;
                    oddEnd = thisNode;
                }
            }
            count++;
        }

        oddEnd.next = evenSt;

        return oddSt;
    }
}
