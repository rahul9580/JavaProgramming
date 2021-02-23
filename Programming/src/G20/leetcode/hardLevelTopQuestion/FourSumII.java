package G20.leetcode.hardLevelTopQuestion;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class FourSumII {

    public static int fourSumCount(int[] A, int[] B, int[] C, int[] D) {

        Map<Integer, Integer> AB = new HashMap<>();
        Map<Integer, Integer> CD = new HashMap<>();

        for(int i = 0; i < A.length; i++) {
            for(int j = 0; j < B.length; j++) {
                if(AB.get(A[i] + B[j]) == null) {
                    AB.put(A[i] + B[j], 0);
                }
                AB.put(A[i] + B[j], AB.get(A[i] + B[j])+1);
            }
        }

        for(int k = 0; k < C.length; k++) {
            for(int l = 0; l < D.length; l++) {
                if(CD.get(C[k] + D[l]) == null) {
                    CD.put(C[k] + D[l], 0);
                }
                CD.put(C[k] + D[l], CD.get(C[k] + D[l])+1);
            }
        }

        int count = 0;
        for(Map.Entry<Integer, Integer> entry : AB.entrySet()) {
            if(CD.containsKey(0-entry.getKey())) {
                count+=(entry.getValue()*CD.get(0-entry.getKey()));
            }
        }

        return count;
    }

    public static void main(String[] args) {
        int A[] = {-1, -1};
        int B[] = {-1, 1};
        int C[] = {-1, 1};
        int D[] = {1, -1};

        System.out.println(fourSumCount(A, B, C, D));
    }
}
