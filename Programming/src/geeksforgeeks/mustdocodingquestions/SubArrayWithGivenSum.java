package geeksforgeeks.mustdocodingquestions;

/**
 * Given an unsorted array A of size N of non-negative integers, find a continuous sub-array which adds to a given number S.
*/
class Pair {
    int start;
    int end;

    @Override
    public String toString() {
        return "Pair{" +
                "start=" + start +
                ", end=" + end +
                '}';
    }
}
public class SubArrayWithGivenSum {

    public static Pair getSubArrayWithGivenSum(int arr[], int givenSum) {
        int thisSum = 0;
        int start = 0;
        int end = 0;
        Pair pair = new Pair();
        while(start < arr.length && end < arr.length) {
            if(thisSum == givenSum) {
                break;
            } else if(thisSum < givenSum) {
                thisSum += arr[end++];
            } else {
                thisSum-=arr[start++];
            }
        }

        if(thisSum == givenSum) {
            pair.start = start;
            pair.end = end-1;  //As we are next to end index
        } else {
            pair.start = -1;
            pair.end = -1;
        }

        return pair;
    }


    public static void main(String[] args) {
        int[] arr = {1,2,4,5};
        Pair pair = getSubArrayWithGivenSum(arr, 8);
        System.out.println(pair);
    }
}
