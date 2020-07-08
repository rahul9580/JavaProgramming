package leetcode;

import java.util.Objects;

public class StraightLinesCoordinates {

    public static boolean isStraightLine(int coordinates[][]) {

        if(Objects.isNull(coordinates) || coordinates.length <= 2) {
            return true;
        }

        int firstX = coordinates[0][0];
        int firstY = coordinates[0][1];

        boolean allXSame = true;
        boolean allYSame = true;

        for(int i = 1; i<coordinates.length; i++) {
            if(coordinates[i][0] != firstX) {
                allXSame = false;
                break;
            }
        }
        for(int i = 1; i<coordinates.length; i++) {
            if(coordinates[i][1] != firstY) {
                allYSame = false;
                break;
            }
        }

        if(allXSame || allYSame) {
            return true;
        }

        // Check slope
        double slope = Double.valueOf(coordinates[1][1] - firstY)/Double.valueOf((coordinates[1][0] - firstX));
        for(int i = 2; i < coordinates.length; i++) {
            if((coordinates[i][0] - firstX) == 0) {
                return false;
            }
            if(slope != Double.valueOf(coordinates[i][1] - firstY)/Double.valueOf(coordinates[i][0] - firstX)) {
                return false;
            }
        }

        return true;
    }

    public static void main(String[] args) {
        int coordinates[][] = {{0,0}, {1,0}, {10,0}};
        System.out.println(isStraightLine(coordinates));
    }
}
