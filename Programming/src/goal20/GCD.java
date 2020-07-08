package goal20;

public class GCD {

    public static int findMin(int [] arr) {
        int min = Integer.MAX_VALUE;
        for(int i = 0; i < arr.length; i++) {
            if(arr[i] < min) {
                min = arr[i];
            }
        }
        return min;
    }

    public static int generalizedGCD(int num, int[] arr) {
        int min = findMin(arr);
        int gcd = 1;
        int it = 2;
        while (it <= min) {
            int i = 0;
            for(i = 0; i < num; i++) {
                if(arr[i] % it != 0) {
                    break;
                }
            }
            if(i == num) {
                gcd = it;
            }
            it++;
        }
        return gcd;
    }

    public static void main(String[] args) {
        int arr[] = {7, 6};
        System.out.println(generalizedGCD(2, arr));
    }
}
