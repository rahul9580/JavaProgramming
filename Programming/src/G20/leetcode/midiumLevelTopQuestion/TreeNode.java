package G20.leetcode.midiumLevelTopQuestion;

public class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;

    public static TreeNode createTree(Integer arr[]) {
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

}
