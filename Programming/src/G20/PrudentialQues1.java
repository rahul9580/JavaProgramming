package G20;

public class PrudentialQues1 {

    public static int findSmallestDivisor(String s, String t) {
        // Write your code here
        int m = s.length();
        int n = t.length();
        String temp = t;
        boolean isFirstCondPass = false;
        while(temp.length() <= m) {
            if(s.equals(temp)) {
                isFirstCondPass = true;
                break;
            }
            temp = temp + t;
        }
        if(!isFirstCondPass) return -1;
        else {
            for(int i = 0; i < n; i++) {
                for(int j = i+1; j <= n; j++) {
                    String temp2 = t.substring(i, j);
                    while(temp2.length() <= t.length()) {
                        if(temp2.equals(t)) {
                            return j-i;
                        }
                        temp2 = temp2 + t.substring(i, j);
                    }
                }
            }
        }
        return -1;
    }

    public static void main(String[] args) {
        System.out.println(findSmallestDivisor("abcd", "abcd"));
    }
}
