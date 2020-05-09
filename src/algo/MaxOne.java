package algo;

public class MaxOne {

	
	public static int findMaxOne(int arr[][]) {
		int maxLength = 0;
		int rowNum =0;
		int j = 0;
		for (int i = 0; i < arr.length; i++) {
			while (arr[i][j] == 1) {
				j++;
			}
			if (j > maxLength) {
				maxLength = j;
				rowNum = i;
			}

		}
		return rowNum;

	}
	
	public static void main(String[] args) {
		int mat[][] = {{1,1,1, 1, 0, 0},{1,1,0,0,0,0}};
		System.out.println(findMaxOne(mat));
	}
}
