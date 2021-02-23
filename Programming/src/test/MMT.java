package test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class MMT {

    //ABC
    // ABC, ACB, BAC, BCA, CAB, CBA

    HashMap<String, String> map = new HashMap<>();

    static List<Character[]> allPermutation = new ArrayList<>();
    //static String permute = "";

    private static void allPermutations(String s, Character permute[], int idx, int max) {
        for(int i = 0; i < s.length(); i++) {
            permute[idx] = s.charAt(i);
            if(idx == max-1) {
                allPermutation.add(permute);
                //continue;
            }
            String newS = s.substring(0,i) + s.substring(i+1);
            allPermutations(newS, permute, idx+1, max);
            //allPermutations(s, 1, permute, s.length());
        }

    }

    /*private static void allPermutations(String s, int i, String permute, int maxLen) {
        if(permute.length() == maxLen) {
            allPermutation.add(permute);
        } else {
            allPermutations(s, i+1)
        }
    }*/

    public static void main(String[] args) {
        String s = "AB";
        Character arr[] = new Character[s.length()];
        allPermutations(s, arr, 0, s.length());

        for(Character ss[] : allPermutation) {
            for(Character c : ss) {
                System.out.print(c);
            }
            System.out.println();
        }
    }

}
