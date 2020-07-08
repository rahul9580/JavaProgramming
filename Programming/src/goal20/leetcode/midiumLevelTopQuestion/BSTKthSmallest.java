package goal20.leetcode.midiumLevelTopQuestion;

public class BSTKthSmallest {

    static int count = 0;
    public static int kthSmallest(TreeNode root, int k) {
        TreeNode node = kthSmallestInner(root, k);
        return node.val;
    }

    public static TreeNode kthSmallestInner(TreeNode root, int k) {
        if (root == null)
            return null;

        TreeNode left = kthSmallestInner(root.left, k);

        if (left != null)
            return left;

        count++;
        if (count == k)
            return root;

        return kthSmallestInner(root.right, k);
    }

    public static void main(String[] args) {

        Integer arr[] = {5,3,6,2,4,null,null,1};
        TreeNode root = TreeNode.createTree(arr);
        int out = kthSmallest(root, 3);
        System.out.println(out);

    }
}
