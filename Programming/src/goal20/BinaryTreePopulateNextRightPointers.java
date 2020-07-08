package goal20;

import java.util.LinkedList;
import java.util.Queue;

class Node {
    public int val;
    public Node left;
    public Node right;
    public Node next;

    public Node() {}

    public Node(int _val) {
        val = _val;
    }

    public Node(int _val, Node _left, Node _right, Node _next) {
        val = _val;
        left = _left;
        right = _right;
        next = _next;
    }
}

public class BinaryTreePopulateNextRightPointers {

    public Node connect(Node root) {

        if(root == null) {
            return null;
        }

        Queue<Node> queue = new LinkedList<>();
        queue.offer(root);
        queue.offer(null);

        while(!queue.isEmpty() && queue.peek() != null) {
            Node node = queue.poll();
            while (node != null) {
                queue.offer(node.left);
                queue.offer(node.right);
                Node next = queue.poll();
                node.next = next;
                node = next;
            }
            queue.offer(null);
        }

        return root;
    }

    public static void main(String[] args) {

    }
}
