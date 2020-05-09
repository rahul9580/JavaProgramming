package algo;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Input {
	private static int sum = 1;

	public static boolean isSafe(int M[][], int row, int col, boolean visited[][], int ROW, int COL) {
		// row number is in range, column number is in range
		// and value is 1 and not yet visited
		return (row >= 0) && (row < ROW) && (col >= 0) && (col < COL) && (M[row][col] == 1 && !visited[row][col]);
	}

	// A utility function to do DFS for a 2D boolean matrix.
	// It only considers the 8 neighbors as adjacent vertices

	public static void DFS(int M[][], int row, int col, boolean visited[][], int ROW, int COL) {
		// These arrays are used to get row and column numbers
		// of 8 neighbors of a given cell
		int rowNbr[] = new int[] { -1, -1, -1, 0, 0, 1, 1, 1 };
		int colNbr[] = new int[] { -1, 0, 1, -1, 1, -1, 0, 1 };

		// Mark this cell as visited
		visited[row][col] = true;
		sum++;

		// Recur for all connected neighbours
		for (int k = 0; k < 8; ++k)
			if (isSafe(M, row + rowNbr[k], col + colNbr[k], visited, ROW, COL))
				DFS(M, row + rowNbr[k], col + colNbr[k], visited, ROW, COL);
	}

	// The main function that returns count of islands in a given
	// boolean 2D matrix
	public static int countIslands(int M[][], int ROW, int COL) {
		// Make a bool array to mark visited cells.
		// Initially all cells are unvisited
		boolean visited[][] = new boolean[ROW][COL];

		// Initialize count as 0 and travese through the all cells
		// of given matrix
		int count = 0;
		int result = Integer.MIN_VALUE;
		for (int i = 0; i < ROW; ++i)
			for (int j = 0; j < COL; ++j)
				if (M[i][j] == 1 && !visited[i][j]) // If a cell with
				{ // value 1 is not
					// visited yet, then new island found, Visit all
					// cells in this island and increment island count

					DFS(M, i, j, visited, ROW, COL);

					result = Math.max(result, sum);
				}

		return result;
	}

	public static void main(String args[]) throws Exception {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int M = Integer.valueOf(br.readLine());
		int N = Integer.valueOf(br.readLine());
		String mat = br.readLine();
		String[] matArr = mat.split(" ");
		int index = 0;
		int matrix[][] = new int[M][N];
		for (int i = 0; i < M; i++) {
			for (int j = 0; j < N; j++) {
				matrix[i][j] = Integer.valueOf(matArr[index]);
				index++;
			}
		}

		System.out.println(countIslands(matrix, M, N));

	}
}
