package companies.TekiOn;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/*
Given n pairs of parenthesis, write a code to generate all combination of well-formed parenthesis
 n = 3 
((()))
(()())
(())()
()(())
()()()

(( () ))
(() () )
(()) ()
n=2
(())
()()

()
()
()()

(())
()()

*/
public class Solution {

    static void printAllCombinations(int n) {
        if(n == 0) return;
        if(n==1) {
            System.out.println("()");
            return;
        }

        List<String> list = new ArrayList<>();
        list.add("()");

        int count = 1;
        while(count++ < n) {
            Set<String> newSet = new HashSet<>();
            String parenthesis = "()";
            for(String s : list) {
                for(int i = 0; i< s.length(); i++) {
                    StringBuilder builder = new StringBuilder();
                    builder.append(s.substring(0,i));
                    builder.append(parenthesis);
                    builder.append(s.substring(i));
                    newSet.add(builder.toString());
                }
            }
            list = new ArrayList<>(newSet);
        }

        for(String s : list) {
            System.out.println(s);
        }
    }

    public static void main(String[] args) {
        printAllCombinations(3);
    }
}
