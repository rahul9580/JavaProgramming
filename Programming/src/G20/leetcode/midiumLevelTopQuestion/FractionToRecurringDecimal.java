package G20.leetcode.midiumLevelTopQuestion;

public class FractionToRecurringDecimal {

    public static String fractionToDecimal(int numerator, int denominator) {

        String out = "";

        while(numerator >= denominator) {
            int d = numerator/denominator;
            numerator = numerator%denominator;
            out = out + d;
        }

        if(out.equals("")) {
            out = "0";
        }
        if(numerator == 0) {
            return out;
        } else {
            out = out + ".";
        }

        numerator *= 10;
        while(true) {
            int d = numerator/denominator;
            numerator = numerator%denominator;

            if(numerator == 0) {
                out = out + d;
                break;
            } else if(found(out, d)) {
                out = prepareOutput(out, d);
                break;
            } else {
                out = out + d;
            }

            numerator *= 10;
        }

        return out;
    }

    public static String prepareOutput(String s, int n) {

        String out = "";
        String ss[] = s.split("[.]");
        if(ss.length < 2) {
            return s;
        }
        String text = ss[1];
        int idx = text.indexOf(""+n);
        String recurring = text.substring(idx, text.length());
        out = ss[0] + "." + text.substring(0, idx);
        out = out + "(" + recurring + ")";
        return out;
    }

    public static boolean found(String s, int n) {
        String ss[] = s.split("[.]");
        if(ss.length < 2) {
            return false;
        }
        String text = ss[1];
        if(s.contains(""+n)) {
            return true;
        }
        return false;
    }

    public static void main(String[] args) {
        System.out.println(fractionToDecimal(2, 3));
    }
}
