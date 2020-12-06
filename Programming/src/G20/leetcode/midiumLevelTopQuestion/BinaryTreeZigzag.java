package G20.leetcode.midiumLevelTopQuestion;

import java.util.*;

public class BinaryTreeZigzag {

    public static List<List<Integer>> zigzagLevelOrder(TreeNode root) {

        List<List<Integer>> output = new ArrayList<>();
        if(root == null) {
            return output;
        }

        Stack<TreeNode> s1 = new Stack<>();
        Stack<TreeNode> s2 = new Stack<>();

        s1.push(root);
        while (!(s1.isEmpty() && s2.isEmpty())) {
            List<Integer> list = new ArrayList<>();
            if(!s1.isEmpty()) {
                TreeNode node = s1.pop();
                while(node != null) {
                    list.add(node.val);
                    if(node.left != null) {
                        s2.push(node.left);
                    }
                    if(node.right != null) {
                        s2.push(node.right);
                    }
                    if(!s1.isEmpty()) {
                        node = s1.pop();
                    } else {
                        node = null;
                    }
                }
            } else {
                TreeNode node = s2.pop();
                while(node != null) {
                    list.add(node.val);
                    if(node.right != null) {
                        s1.push(node.right);
                    }
                    if(node.left != null) {
                        s1.push(node.left);
                    }
                    if(!s2.isEmpty()) {
                        node = s2.pop();
                    } else {
                        node = null;
                    }
                }
            }
            output.add(list);
        }

        return output;
    }

    public static void main(String[] args) {

        Integer arr[] = {1,2,3,4,null,null,5};
        TreeNode root = TreeNode.createTree(arr);
        System.out.println(zigzagLevelOrder(root));
    }
}
