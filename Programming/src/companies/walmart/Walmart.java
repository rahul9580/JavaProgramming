package companies.walmart;

import java.util.List;
import java.util.Queue;
import java.util.concurrent.LinkedBlockingQueue;

class Graph {
    List<Node> nodes;
}

class Node {
    Character color;
    List<Node> connectedNodes;
}

public class Walmart {

    public static boolean isPossible(Graph graph) {
        Node root = graph.nodes.get(0);
        root.color = 'R';

        Queue<Node> queue = new LinkedBlockingQueue<>();
        queue.add(root);

        while(!queue.isEmpty()) {
            Node thisNode = queue.poll();
            List<Node> connectedNodes = thisNode.connectedNodes;
            for(Node node : connectedNodes) {
                if(node.color == null) {
                    node.color = (thisNode.color == 'R') ? 'G' : 'R';
                    queue.add(node);
                } else {
                    if(node.color == thisNode.color) {
                        return false;
                    }
                }
            }
        }

        return true;
    }

    public static void main(String[] args) {

    }

}
