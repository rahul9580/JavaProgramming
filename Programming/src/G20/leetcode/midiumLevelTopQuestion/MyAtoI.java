package G20.leetcode.midiumLevelTopQuestion;

public class MyAtoI {

    public static int myAtoi(String s) {
        s = s.trim();
        long out = 0;

        boolean isNegative = false;
        if(s.startsWith("-")) {
            isNegative = true;
            s = s.substring(1);
        } else if(s.startsWith("+")) {
            s = s.substring(1);
        }

        int i = 0;
        while (i < s.length()) {
            if(isDigit(s.charAt(i))) {
                out = out * 10 + (s.charAt(i) - 48);
                if(out > Integer.MAX_VALUE) {
                    if(isNegative) {
                        return Integer.MIN_VALUE;
                    } else {
                        return Integer.MAX_VALUE;
                    }
                }
            } else {
                return getOutput(out, isNegative);
            }
            i++;
        }

        return getOutput(out, isNegative);
    }

    private static int getOutput(long out, boolean negative) {
        if(negative) {
            return (int) out * -1;
        } else {
            return (int) out;
        }
    }

    private static boolean isDigit(Character c) {
        switch (c) {
            case '0':
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9':
                return true;
            default:
                return false;
        }
    }

    public static void main(String[] args) {
        //System.out.println(Integer.MIN_VALUE);
        System.out.println(myAtoi("-6147483648"));
    }
}
