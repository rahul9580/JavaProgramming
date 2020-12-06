package G20.leetcode.midiumLevelTopQuestion;

public class ExcelSheetColumnNumber {

    public static int titleToNumber(String s) {

        int colNo = 0;
        int len = s.length();
        int i = 0;
        while(i < len) {
            colNo = colNo + Double.valueOf(Math.pow(26, i)).intValue()*(s.charAt(len-1-i)-64);
            i++;
        }

        return colNo;
    }

    public static void main(String[] args) {
        System.out.println(titleToNumber("AZ"));
    }
}
