package test;

// Class name must be "Main"
// Libraries included:
// json simple, guava, apache commons lang3, junit, jmock

import javafx.util.Builder;

class Main {


    public static String reverseWords(String inputStr) {

        StringBuilder builder = new StringBuilder();
        builder.append(inputStr);
        builder.reverse();
        String reversedString = builder.toString();

        StringBuilder finalBuilder = new StringBuilder();
        builder = new StringBuilder();

        for(int i = 0; i < reversedString.length(); i++) {
            if(reversedString.substring(i, i+1).equals(" ")) {
                builder.reverse();
                finalBuilder.append(builder.toString());
                finalBuilder.append(" ");
                builder = new StringBuilder();
            } else {
                builder.append(reversedString.substring(i, i+1));
            }
        }
        builder.reverse();
        finalBuilder.append(builder.toString());

        return finalBuilder.toString();
    }

    public static boolean isSame(String s1, String s2) {
        switch (s1) {
            case "a":
                if(s2.equalsIgnoreCase("a") ||
                        s2.equalsIgnoreCase("e") ||
                        s2.equalsIgnoreCase("i") ||
                s2.equalsIgnoreCase("o") ||
                s2.equalsIgnoreCase("u")) {
                    return true;
                }
            case "e":
                if(s2.equalsIgnoreCase("e") ||
                        s2.equalsIgnoreCase("i") ||
                        s2.equalsIgnoreCase("o") ||
                        s2.equalsIgnoreCase("u")) {
                    return true;
                }
            case "i":
                if(s2.equalsIgnoreCase("i") ||
                        s2.equalsIgnoreCase("o") ||
                        s2.equalsIgnoreCase("u")) {
                    return true;
                }
            case "o":
                if(s2.equalsIgnoreCase("o") ||
                        s2.equalsIgnoreCase("u")) {
                    return true;
                }
            case "u":
                if(s2.equalsIgnoreCase("u")) {
                    return true;
                }

        }

        return false;

    }

    public static String replace(String inputStr) {

        for(int i = 0; i < inputStr.length()-1; i++) {
            if(isSame(inputStr.substring(i, i+1), inputStr.substring(i+1, i+2))) {
                StringBuilder builder = new StringBuilder();
                builder.append(inputStr.substring(0, i)).append("--").append(inputStr.substring(i+2));
                inputStr = builder.toString();
            }
        }
        return inputStr;
    }

    public static String replaceString(String inputStr) {
        String s = reverseWords(inputStr);
        s = replace(s);
        return s;
    }

    public static void main(String[] args) {
        System.out.println(replaceString("Ambitiouus moonshot"));
    }
}
