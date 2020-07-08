package goal20;

public class BinaryTreeConstruct {

    public static TreeNode buildTree(int[] preorder, int[] inorder) {
        return buildTree(preorder, 0, preorder.length -1, inorder, 0, inorder.length - 1);
    }

    private static TreeNode buildTree(int[] preorder, int ps, int pe, int[] inorder, int is, int ie) {

        if(pe < ps || ie < is) {
            return null;
        }
        TreeNode node = new TreeNode();
        node.val = preorder[ps];

        int imid = 0;
        for(int i = is; i <= ie; i++) {
            if(inorder[i] == preorder[ps]) {
                imid = i;
            }
        }

        node.left = buildTree(preorder, ps+1, ps+(imid-is), inorder, is, imid-1);
        node.right = buildTree(preorder, ps+(imid-is)+1, pe, inorder, imid+1, ie);

        return node;
    }

    public static void main(String[] args) {
        int pre[] = {3,9,20,15,7};
        int in[] = {9,3,15,20,7};
        TreeNode treeNode = buildTree(pre, in);
        System.out.println(treeNode);
    }
}
