/**
 * 
 */
package ds.binarytree;

import java.util.Stack;

/**
 * @author rahul
 *
 */
public class BSTOperations {

	public int findSumOfNEleAfterKthSmallest(Node root, int k, int n, int counter, int sum) {
		if (root == null) {
			return 0;
		}
		findSumOfNEleAfterKthSmallest(root.getLeft(), k, n, counter, sum);
		counter++;
		if (counter >= k + n) {
			return sum;
		}
		if (counter > k) {
			sum += root.getData();
		}
		findSumOfNEleAfterKthSmallest(root.getLeft(), k, n, counter, sum);
		return sum;
	}

	boolean canRepresentBST(int pre[], int n) {
		Stack<Integer> s = new Stack<Integer>();
		int root = Integer.MIN_VALUE;

		for (int i = 0; i < n; i++) {
			if (pre[i] < root) {
				return false;
			}
			while (!s.empty() && s.peek() < pre[i]) {
				root = s.peek();
				s.pop();
			}
			s.push(pre[i]);
		}
		return true;
	}
}
