package G20.leetcode.midiumLevelTopQuestion;

import java.util.Objects;

public class NumberOfIslands {

    static class IndexPair {
        private int i;
        private int j;
    }

    public static int numIslands(char[][] grid) {
        int m = grid.length;
        int n = grid[0].length;
        boolean[][] visited = new boolean[m][n];
        return numIslands(grid, visited);
    }

    public static int count = 0;
    public static int numIslands(char[][] grid, boolean[][] visited) {
        IndexPair indexPair = getStartOfIsland(grid, visited);
        while (Objects.nonNull(indexPair)) {
            count++;
            visitIsland(grid, visited, indexPair.i, indexPair.j);
            indexPair = getStartOfIsland(grid, visited);
        }
        return count;
    }

    public static void visitIsland(char[][] grid, boolean[][] visited, int i, int j) {
        int m = grid.length;
        int n = grid[0].length;
        visited[i][j] = true;
        if(i+1 < m && grid[i+1][j] == '1' && visited[i+1][j] == false) {
            visitIsland(grid, visited, i+1, j);
        }
        if(j+1 < n && grid[i][j+1] == '1' && visited[i][j+1] == false) {
            visitIsland(grid, visited, i, j+1);
        }
        if(i-1 >= 0 && grid[i-1][j] == '1' && visited[i-1][j] == false) {
            visitIsland(grid, visited, i-1, j);
        }
        if(j-1 >= 0 && grid[i][j-1] == '1' && visited[i][j-1] == false) {
            visitIsland(grid, visited, i, j-1);
        }
    }

    public static IndexPair getStartOfIsland(char[][] grid, boolean[][] visited) {
        int m = grid.length;
        int n = grid[0].length;
        for(int i = 0; i < m; i++) {
            for(int j = 0; j < n; j++) {
                if(visited[i][j] == false && grid[i][j] == '1') {
                    IndexPair indexPair = new IndexPair();
                    indexPair.i = i;
                    indexPair.j = j;
                    return indexPair;
                }
            }
        }

        return null;
    }

    public static void main(String[] args) {
        char[][] grid = {
                {'1', '1', '0', '0', '1'},
                {'1', '1', '0', '0', '0'},
                {'0', '0', '1', '0', '0'},
                {'0', '0', '0', '1', '1'}
        };

        int n = numIslands(grid);
        System.out.println(n);
    }
}
