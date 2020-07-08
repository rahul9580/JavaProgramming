package goal20;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class SpecialEleInMatrix {
    static int countSpecialElements(List<List<Integer>> matrix) {

        int m = matrix.size();
        int n = matrix.get(0).size();
        for(List<Integer> list : matrix) {
            if(n < list.size()) {
                n = list.size();
            }
        }

        int arr[][] = new int[m][n];

        int ii = 0;
        for(List<Integer> list : matrix) {
            int jj = 0;
            for(Integer num : list) {
                arr[ii][jj] = num;
                jj++;
            }
            ii++;
        }

        int output = 0;

        for(int i = 0; i < m; i++) {
            for(int j = 0; j < n; j++) {

                int min = arr[i][j], max = arr[i][j];

                for(int r = 0; r < m; r++) {
                    if(arr[r][j] < min) {
                        min = arr[r][j];
                    } else if(arr[r][j] > max) {
                        max = arr[r][j];
                    }
                }
                if(arr[i][j] == min || arr[i][j] == max) {
                    output++;
                    continue;
                }

                min = arr[i][j]; max = arr[i][j];
                for(int c = 0; c < n; c++) {
                    if(arr[i][c] < min) {
                        min = arr[i][c];
                    } else if(arr[i][c] > max) {
                        max = arr[i][c];
                    }
                }
                if(arr[i][j] == min || arr[i][j] == max) {
                    output++;
                }
            }
        }

        return output;

    }

    public static void main(String[] args) {

        List<List<Integer>> lists = new ArrayList<>();

        List<Integer> list1 = new ArrayList<>();
        list1.add(1);
        list1.add(3);
        list1.add(4);
        lists.add(list1);

        List<Integer> list2 = new ArrayList<>();
        list2.add(5);
        list2.add(2);
        list2.add(9);
        lists.add(list2);

        List<Integer> list3 = new ArrayList<>();
        list3.add(8);
        list3.add(7);
        list3.add(6);
        lists.add(list3);

        System.out.println(countSpecialElements(lists));
    }
}
