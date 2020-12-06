package G20.leetcode.hardLevelTopQuestion;

import java.util.ArrayList;
import java.util.List;

public class SpiralMatrix {

    public static List<Integer> spiralOrder(int[][] matrix) {
        List<Integer> output = new ArrayList<>();
        if(matrix == null || matrix.length <= 0) return output;

        int top = 0;
        int bottom = matrix.length-1;
        int left = 0;
        int right = matrix[0].length-1;

        boolean done = true;
        while(top <= bottom && left <= right) {
            for(int i = left; i <= right; i++) {
                output.add(matrix[top][i]);
                done = false;
            }
            if(done) break;
            done = true;
            top++;
            for(int i = top; i <= bottom; i++) {
                output.add(matrix[i][right]);
                done = false;
            }
            if(done) break;
            done = true;
            right--;
            for(int i = right; i >= left; i--) {
                output.add(matrix[bottom][i]);
                done = false;
            }
            if(done) break;
            done = true;
            bottom--;
            for(int i = bottom; i >= top; i--) {
                output.add(matrix[i][left]);
                done = false;
            }
            if(done) break;
            done = true;
            left++;
        }

        return output;
    }

    public static void main(String[] args) {
        int matrix[][] = {{1, 2, 3, 4},{5, 6, 7, 8},{9, 10, 11, 12}};
        List<Integer> out = spiralOrder(matrix);
        for(Integer i : out) {
            System.out.println(i);
        }
    }
}
