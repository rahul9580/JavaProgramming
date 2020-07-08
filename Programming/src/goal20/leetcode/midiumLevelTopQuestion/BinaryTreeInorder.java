package goal20.leetcode.midiumLevelTopQuestion;

import java.util.ArrayList;
import java.util.List;

public class BinaryTreeInorder {

    List<Integer> output = new ArrayList<>();

    public List<Integer> inorderTraversal(TreeNode root) {
        if(root == null) {
            return null;
        }
        inorderTraversal(root.left);
        output.add(root.val);
        inorderTraversal(root.right);

        return output;
    }


    public static void main(String[] args) {

    }
}
