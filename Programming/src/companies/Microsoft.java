package companies;

/* Print 2D matrix in spiral order clockwise and anticlockwise  */
public class Microsoft {

    void print(int[][] matrix, int row, int col, boolean clockwise) {

        int top = 0; int bottom = row-1; int left = 0; int right = col-1;

        int count = 0;
        if(clockwise) {
            while(top<=bottom && left<=right) {
                if(count <= row*col)
                    count+=printRowInc(matrix, top++, left, right);
                if(count <= row*col)
                    count+=printColInc(matrix, right--, top, bottom);
                if(count <= row*col)
                    count+=printRowDec(matrix, bottom--, right, left);
                if(count <= row*col)
                    count+=printColDec(matrix, left++, bottom, top);
            }
        } else {
            while(top<=bottom && left<=right) {
                if(count <= row*col)
                    count+=printColInc(matrix, left++, top, bottom);
                if(count <= row*col)
                    count+=printRowInc(matrix, bottom--, left, right);
                if(count <= row*col)
                    count+=printColDec(matrix, right--, bottom, top);
                if(count <= row*col)
                    count+=printRowDec(matrix, top++, right, left);
            }
        }
    }

    int printRowInc(int[][] matrix, int rowNo, int start, int end) {
        int count = 0;
        for(int i = start; i <= end; i++) {
            System.out.print(matrix[rowNo][i]);
            count++;
        }
        return count;
    }

    int printColInc(int[][] matrix, int colNo, int start, int end) {
        int count = 0;
        for(int i = start; i <= end; i++) {
            System.out.print(matrix[i][colNo]);
            count++;
        }
        return count;
    }

    int printRowDec(int[][] matrix, int rowNo, int start, int end) {
        int count = 0;
        for(int i = start; i >= end; i--) {
            System.out.print(matrix[rowNo][i]);
            count++;
        }
        return count;
    }

    int printColDec(int[][] matrix, int colNo, int start, int end) {
        int count = 0;
        for(int i = start; i >= end; i--) {
            System.out.print(matrix[i][colNo]);
            count++;
        }
        return count;
    }
}
