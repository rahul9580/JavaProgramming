package algo;

public class BinarySearch {

    public static void main(String[] args) {
        int arr[] = {1,2,4,5};
        Search search = new Search();
        System.out.println(search.search(arr, 0, arr.length - 1, 3));
    }
}

class Search {
    public boolean search(int arr[], int start, int end, int n) {
        if(start <= end) {
            int mid = start + (end - start) / 2;
            if(arr[mid] == n) {
                return true;
            } else if(arr[mid] > n) {
                return search(arr, start, mid-1, n);
            } else {
                return search(arr, mid+1, end, n);
            }
        }
        return false;
    }
}