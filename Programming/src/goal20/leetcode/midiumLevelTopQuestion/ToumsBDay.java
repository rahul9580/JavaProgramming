package goal20.leetcode.midiumLevelTopQuestion;

public class ToumsBDay {

    public static long taumBday(int b, int w, int bc, int wc, int z) {
        int min = min(bc, wc);
        int max = max(bc, wc);

        if(min+z < max) {
            if(max == bc) {
                bc = min+z;
            } else {
                wc = min+z;
            }
        }

        long bb = b;
        long ww = w;
        long bbc = bc;
        long wwc = wc;
        return bb*bbc + ww*wwc;
    }

    private static int min(int a, int b) {
        if(a<b) {
            return a;
        }
        return b;
    }

    private static int max(int a, int b) {
        if(a>b) {
            return a;
        }
        return b;
    }

    public static void main(String[] args) {
        System.out.println(taumBday(27984, 1402,
                619246, 615589, 247954));
    }
}
