package goal20.leetcode.midiumLevelTopQuestion;

import java.util.*;

public class SerializeAndDeserializeBinaryTree {

    // Encodes a tree to a single string.
    public static String serialize(TreeNode root) {

        if(Objects.isNull(root)) return "";

        String serialized = "[";
        List<Integer> out = new ArrayList<>();
        Queue<TreeNode> queue = new LinkedList<>();
        queue.offer(root);
        while (!queue.isEmpty()) {
            TreeNode node = queue.poll();
            if(Objects.nonNull(node)) {
                out.add(node.val);
                queue.offer(node.left);
                queue.offer(node.right);
            } else {
                out.add(null);
            }
        }

        int size = out.size() - 1;
        int nullCount = 0;
        while (size >= 0 && out.get(size) == null) {
            nullCount++;
            size--;
        }

        int i = 0;
        while (i < out.size() - nullCount) {
            serialized = serialized + out.get(i) + ",";
            i++;
        }
        serialized = serialized.substring(0, serialized.length() - 1);
        serialized = serialized + "]";
        return serialized;
    }

    // Decodes your encoded data to tree.
    public static TreeNode deserialize(String data) {
        if(Objects.isNull(data) || data.length() <= 2) return null;
        String d = data.substring(1, data.length() - 1);

        String[] darr = d.split(",");
        Integer[] arr = new Integer[darr.length];
        for(int i = 0; i < darr.length; i++) {
            if(darr[i] == null || darr[i].equals("null")) {
                arr[i] = null;
            } else {
                arr[i] = Integer.valueOf(darr[i]);
            }
        }
        return createTree(arr, 0);
    }

    public static TreeNode createTree(Integer arr[], int root) {
        if(root < arr.length && arr[root] != null) {
            TreeNode treeNode = new TreeNode();
            treeNode.val = arr[root];
            treeNode.left = createTree(arr, 2*root+1);
            treeNode.right = createTree(arr, 2*root+2);
            return treeNode;
        }
        return null;
    }

    public static void main(String[] args) {
        String s = "[5,2,3,null,null,2,4,3,1]";
        TreeNode node = deserialize(s);
        String out = serialize(node);
        System.out.println(out);
    }
}
