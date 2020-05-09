/**
 * 
 */
package leetcode;

/**
 * @author rahul.kumar
 *
 */

// Definition for a binary tree node.
class TreeNode {
	int val;
	TreeNode left;
	TreeNode right;

	TreeNode(int x) {
		val = x;
	}
}

public class SubTreeCheck {

	public static boolean isSubtree(TreeNode s, TreeNode t) {
		if(s == null || t == null)
			return Boolean.TRUE;
		
		return Boolean.FALSE;
	}

	public static void main(String[] args) {

	}

}
