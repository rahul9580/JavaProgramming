package G20.leetcode.midiumLevelTopQuestion;

public class WaterContainer {

    public static int maxArea(int[] height) {
        int maxArea = 0;
        for(int i = 0, j = height.length-1; i<j;) {
            int min = min(height[i], height[j]);
            if(maxArea < min * (j-i)) {
                maxArea = min * (j - i);
            }

            if(height[i] < height[j]) {
                i++;
            } else {
                j--;
            }
        }
        return maxArea;
    }

    private static int min(int a, int b) {
        if(a<b) return a;
        else return b;
    }

    public static void main(String[] args) {
        int arr[] = {1,8,6,2,5,4,8,3,7};
        System.out.println(maxArea(arr));
    }
}
