package goal20.leetcode.midiumLevelTopQuestion;

public class SortColors {

    public static void sortColors(int[] nums) {

        int zeros = 0;
        int ones = 0;
        int twos = 0;
        for(int i :  nums) {
            switch (i) {
                case 0:
                    zeros++;
                    break;
                case 1:
                    ones++;
                    break;
                case 2:
                    twos++;
                    break;
            }
        }
        int i = 0;
        while (i<zeros) {
            nums[i] = 0;
            i++;
        }
        while (i<zeros+ones) {
            nums[i] = 1;
            i++;
        }
        while (i<zeros+ones+twos) {
            nums[i] = 2;
            i++;
        }
    }

    public static void main(String[] args) {
        int arr[] = {2,0,2,1,1,0};
        sortColors(arr);
        for (int i : arr) {
            System.out.println(i);
        }
    }
}
