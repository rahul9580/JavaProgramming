package G20.leetcode.hardLevelTopQuestion;

// Definition for a Node.
class Node {
    int val;
    Node next;
    Node random;

    public Node(int val) {
        this.val = val;
        this.next = null;
        this.random = null;
    }
}

public class CopyListWithRandomPointer {

    public static Node copyRandomList(Node head) {
        Node current = head;
        while (current != null) {
            Node newNode = new Node(current.val);
            Node temp = current.next;
            current.next = newNode;
            newNode.next = temp;
            current = temp;
        }

        current = head;
        while (current != null) {
            if(current.random != null) {
                current.next.random = current.random.next;
            } else {
                current.next.random = null;
            }

            current = current.next.next;
        }

        Node newListHead = null;
        Node newListCurrent = null;
        Node oldListHead = null;
        Node oldListCurrent = null;
        current = head;
        while (current != null) {
            Node nextOld = current.next.next;
            if(newListHead == null) {
                newListHead = newListCurrent = current.next;
            } else {
                newListCurrent.next = current.next;
                newListCurrent = newListCurrent.next;
            }

            if(oldListHead == null) {
                oldListHead = oldListCurrent = current;
            } else {
                oldListCurrent.next = current;
                oldListCurrent = oldListCurrent.next;
            }

            current = nextOld;
            oldListCurrent.next = null;
            newListCurrent.next = null;
        }

        return newListHead;
    }

    public static void main(String[] args) {
        Node node1 = new Node(7);
        Node node2 = new Node(13);
        Node node3 = new Node(11);
        Node node4 = new Node(10);
        Node node5 = new Node(1);
        node1.next = node2;
        node2.next = node3;
        node3.next = node4;
        node4.next = node5;
        node2.random = node1;
        node3.random = node5;
        node4.random = node3;
        node5.random = node1;

        Node out = copyRandomList(node1);
        System.out.println(out);
    }
}
