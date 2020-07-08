package leetcode;

public class FloodFill {


    public static void rec(int[][] image, int sr, int sc, int newColor) {
        if(!(sr < 0 || sr >= image.length || sc < 0 || sc >= image[0].length)) {
            image[sr][sc] = newColor;
            if((sr-1)>=0 && image[sr-1][sc] != newColor && image[sr-1][sc] != 0)
                rec(image, sr-1, sc, newColor);
            if((sr+1)<image.length && image[sr+1][sc] != newColor && image[sr+1][sc] != 0)
                rec(image, sr+1, sc, newColor);
            if((sc-1)>=0 && image[sr][sc-1] != newColor && image[sr][sc-1] != 0)
                rec(image, sr, sc-1, newColor);
            if((sc+1)<image[0].length && image[sr][sc+1] != newColor && image[sr][sc+1] != 0)
                rec(image, sr, sc+1, newColor);
        }
    }

    public static int[][] floodFill(int[][] image, int sr, int sc, int newColor) {
        if(sr < 0 || sr >= image.length || sc < 0 || sc >= image[0].length) {
            return image;
        } else {
            image[sr][sc] = newColor;
            if((sr-1)>=0 && image[sr-1][sc] != newColor && image[sr-1][sc] != 0)
                floodFill(image, sr-1, sc, newColor);
            if((sr+1)<image.length && image[sr+1][sc] != newColor && image[sr+1][sc] != 0)
                floodFill(image, sr+1, sc, newColor);
            if((sc-1)>=0 && image[sr][sc-1] != newColor && image[sr][sc-1] != 0)
                floodFill(image, sr, sc-1, newColor);
            if((sc+1)<image[0].length && image[sr][sc+1] != newColor && image[sr][sc+1] != 0)
                floodFill(image, sr, sc+1, newColor);
            return image;
        }
        //rec(image, sr, sc, newColor);
        //return image;
    }

    public static void main(String[] args) {
        int img[][] = {{1,1,1},{1,1,0},{1,0,1}};
        floodFill(img, 1, 1, 2);
        for(int i = 0; i < img.length; i++) {
            for(int j = 0; j < img[i].length; j++) {
                System.out.println(img[i][j]);
            }
        }
    }
}
