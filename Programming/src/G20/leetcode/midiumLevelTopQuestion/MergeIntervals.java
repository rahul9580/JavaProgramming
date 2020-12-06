package G20.leetcode.midiumLevelTopQuestion;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class MergeIntervals {

    static class Node implements Comparable<Node>{
        int st;
        int end;
        Node(int st, int end) {
            this.st = st;
            this.end = end;
        }

        @Override
        public int compareTo(Node o) {
            return this.st - o.st;
        }
    }

    public static int[][] merge(int[][] intervals) {

        List<Node> nodes = new ArrayList<>();

        if(intervals.length < 2) {
            return intervals;
        }

        List<Node> intervalsNodes = new ArrayList<>();
        for (int i = 0; i < intervals.length; i++) {
            Node node = new Node(intervals[i][0], intervals[i][1]);
            intervalsNodes.add(node);
        }
        Collections.sort(intervalsNodes);

        int prevSt = intervalsNodes.get(0).st;
        int prevEnd = intervalsNodes.get(0).end;

        for(int i = 1; i < intervalsNodes.size(); i++) {
            if(prevEnd >= intervalsNodes.get(i).st) {
                if(prevEnd < intervalsNodes.get(i).end) {
                    prevEnd = intervalsNodes.get(i).end;
                }
            } else {
                Node node = new Node(prevSt, prevEnd);
                nodes.add(node);
                prevSt = intervalsNodes.get(i).st;
                prevEnd = intervalsNodes.get(i).end;
            }
        }

        Node n = new Node(prevSt, prevEnd);
        nodes.add(n);

        int output[][] = new int[nodes.size()][2];
        int i = 0;
        for(Node node : nodes) {
            output[i][0] = node.st;
            output[i][1] = node.end;
            i++;
        }

        return output;
    }

    public static void main(String[] args) {
        int arr[][] = {{1,4},{0,4}};
        int out[][] = merge(arr);
        System.out.println();
    }
}
