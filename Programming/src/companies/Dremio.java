package companies;

import java.util.ArrayList;
import java.util.List;

public class Dremio {

    static String compress(String word, int idx) {
        StringBuilder builder = new StringBuilder();
        builder.append(word.substring(0, idx));
        builder.append(word.substring(idx+1));
        return builder.toString();
    }


    static boolean isValidWord(String word) {
        System.out.println(word);
        List<String> dict = new ArrayList<>();
        dict.add("Hello");
        dict.add("Happy");
        dict.add("HelllooHapppy");
        for(String s : dict) {
            if(s.equalsIgnoreCase(word)) {
                return true;
            }
        }
        return false;
    }

    //HelloHappy
    //HeloHappy
    static boolean isValidSlang(String word) {
        if(isValidWord(word)) {
            return true;
        } else {
            for(int i = 0; i < word.length()-1; i++) {
                if(word.charAt(i) == word.charAt(i+1)) {
                    String compressed = compress(word, i);

                    boolean isValid = isValidSlang(compressed);
                    if(isValid) return true;
                }
            }
        }

        return false;
    }
    //HellllooHappppy
    //HelllooHappppy
    public static void main(String[] args) {
        System.out.println(isValidSlang("HellllooHappppy"));;
    }
}
