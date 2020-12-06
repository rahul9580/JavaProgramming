package G20.leetcode.midiumLevelTopQuestion;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

public class HappyNumber {

    public static boolean isHappy(int n) {
        Map<Integer, Boolean> map = new HashMap<>();
        while(true) {
            if(n == 1) return true;
            if(Objects.nonNull(map.get(n)) && map.get(n)) return false;
            map.put(n, true);
            int sumOfSquire = 0;
            while(n > 0) {
                sumOfSquire += (n%10)*(n%10);
                n = n/10;
            }
            n = sumOfSquire;
        }
    }

    public static void main(String[] args) {
        System.out.println(isHappy(2));
    }
}
