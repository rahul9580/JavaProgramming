package G20.leetcode.hardLevelTopQuestion;

public class GameOfLife {

    public static int countNeighbour(int[][] board, int i, int j) {
        int m = board.length;
        int n = board[0].length;
        int count = 0;
        if(j+1<n && board[i][j+1] == 1) count++;
        if(i+1<m && j+1<n && board[i+1][j+1] == 1) count++;
        if(i+1<m && board[i+1][j] == 1) count++;
        if(i+1<m && j-1>=0 && board[i+1][j-1] == 1) count++;
        if(j-1>=0 && board[i][j-1] == 1) count++;
        if(i-1>=0 && j-1>=0 && board[i-1][j-1] == 1) count++;
        if(i-1>=0 && board[i-1][j] == 1) count++;
        if(i-1>=0 && j+1<n && board[i-1][j+1] == 1) count++;
        return count;
    }

    public static void gameOfLife(int[][] board) {
        if(board.length == 0) return;
        int out[][] = new int[board.length][board[0].length];

        for(int i = 0; i < board.length; i++) {
            for(int j = 0; j < board[0].length; j++) {
                int neighbour = countNeighbour(board, i, j);
                if(board[i][j] == 1 && neighbour < 2) out[i][j] = 0;
                else if(board[i][j] == 1 && neighbour == 2 || neighbour == 3) out[i][j] = 1;
                else if(board[i][j] == 1 && neighbour > 3) out[i][j] = 0;
                else if(board[i][j] == 0 && neighbour == 3) out[i][j] = 1;
                else out[i][j] = board[i][j];
            }
        }

        for(int i = 0; i < board.length; i++) {
            for(int j = 0; j < board[0].length; j++) {
                board[i][j] = out[i][j];
            }
        }
    }

    public static void main(String[] args) {
        int in[][] = {{0,1,0}, {0,0,1}, {1,1,1}, {0,0,0}};
        gameOfLife(in);
        for(int i = 0; i < in.length; i++) {
            for(int j = 0; j < in[0].length; j++) {
                System.out.print(in[i][j]);
            }
            System.out.println();
        }
    }
}
