/**
 * 
 */
package ds.binarytree;

import java.util.Stack;

/**
 * @author rahul
 *
 */
public class BinaryTreeOperations {

	class Height
	{
	    int h;
	}
	
	public void inOrderWithoutRecursion(Node root) {
		if (null == root)
			return;
		Stack<Node> stack = new Stack<>();
		Node node = root;
		while (node != null) {
			stack.push(node);
			node = node.getLeft();
		}
		while (!stack.isEmpty()) {
			node = stack.pop();
			System.out.println(node.getData());
			if (node.getRight() != null) {
				node = node.getRight();
				while (node != null) {
					stack.push(node);
					node = node.getLeft();
				}
			}
		}
	}

	public void preOrderWithoutRecursion(Node root) {
		if (null == root)
			return;
		Stack<Node> stack = new Stack<>();
		Node node = root;
		while (node != null) {
			System.out.println(node.getData());
			stack.push(node);
			node = node.getLeft();
		}
		while (!stack.isEmpty()) {
			node = stack.pop();
			if (node.getRight() != null) {
				node = node.getRight();
				while (node != null) {
					System.out.println(node.getData());
					stack.push(node);
					node = node.getLeft();
				}
			}
		}
	}
	
	public void printAllRootToLeafPath(Node root, int path[], int i) {
		if (null == root)
			return;
		path[i] = root.getData();
		if ((root.getLeft() == null && root.getRight() == null)) {
			printArray(path);
			return;
		}
		printAllRootToLeafPath(root.getLeft(), path, i + 1);
		printAllRootToLeafPath(root.getRight(), path, i + 1);

	}

	public int diameterOpt(Node root) {
		return diameterOpt(root, new Height());
	}
	
	public int diameterOpt(Node root, Height height) {
		Height lh = new Height(), rh = new Height();

		if (root == null) {
			height.h = 0;
			return 0; /* diameter is also 0 */
		}

		lh.h++;
		rh.h++;
		int ldiameter = diameterOpt(root.getLeft(), lh);
		int rdiameter = diameterOpt(root.getRight(), rh);

		height.h = Math.max(lh.h, rh.h) + 1;

		return Math.max(lh.h + rh.h + 1, Math.max(ldiameter, rdiameter));
	}
	
	public int getDiameter(Node root) {
		if (null == root)
			return 0;
		int ldim = getDiameter(root.getLeft());
		int rdim = getDiameter(root.getRight());
		int lh = calculateHight(root.getLeft());
		int rh = calculateHight(root.getRight());
		int dim = 0;
		if (ldim > rdim)
			dim = ldim;
		else
			dim = rdim;
		if (dim < 1 + lh + rh)
			dim = 1 + lh + rh;
		return dim;
	}
	
	public int calculateHight(Node root) {
		if (root == null)
			return 0;
		int leftH = 0;
		int rightH = 0;
		leftH = calculateHight(root.getLeft());
		rightH = calculateHight(root.getLeft());

		return (leftH > rightH) ? (1 + leftH) : 1 + rightH;
	}

	public void childrenSumTree(Node root) {
		if(root == null  || (null == root.getLeft() && null ==root.getRight())) {
			return;
		}
		childrenSumTree(root.getLeft());
		childrenSumTree(root.getRight());
		root.setData((root.getLeft()!=null?root.getLeft().getData():0) + (root.getRight()!=null?root.getRight().getData():0));
	}

	public void convertToThreadedBinaryTree(ThreadedNode root, ThreadedNode predecesser) {
		if (root == null)
			return;
		convertToThreadedBinaryTree(root.getLeft(), predecesser);
		if (predecesser == null) {
			predecesser.setRight(root);
			predecesser.setThreaded(true);
		}

		if (root.getLeft() == null && root.getRight() == null) {
			predecesser = root;
		}
		convertToThreadedBinaryTree(root.getRight(), predecesser);
	}

	private void printArray(int arr[]) {
		for (int element : arr) {
			System.out.print(element + " ");
		}
		System.out.println();
	}
}