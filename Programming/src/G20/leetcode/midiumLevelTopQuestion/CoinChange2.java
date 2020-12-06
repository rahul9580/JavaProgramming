package G20.leetcode.midiumLevelTopQuestion;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

public class CoinChange2 {

    public static int change(int amount, int[] coins) {
        if(amount == 0) {
            return 1;
        } else if(coins.length == 0) {
            return 0;
        }
        List<List<Integer>> memoization[] = new List[amount+1];

        for(int i = 1; i <= amount; i++) {

            List<List<Integer>> newLists = new ArrayList<>();
            for(int j = 0; j < coins.length; j ++) {
                if(coins[j] <= i) {
                    List<List<Integer>> prevLists = memoization[i-coins[j]];
                    addCoin(newLists, prevLists, coins[j]);
                }
            }
            memoization[i] = newLists;
        }
        int allCombinations = 0;
        if(Objects.nonNull(memoization[amount])) {
            allCombinations = memoization[amount].size();
        }
        return allCombinations;
    }

    private static void addCoin(List<List<Integer>> existing, List<List<Integer>> lists, int coin) {
        if(Objects.nonNull(lists)) {
            for (List<Integer> list : lists) {
                List<Integer> clonedList = cloneList(list);
                clonedList.add(coin);
                if(isUniqueList(existing, clonedList)) {
                    existing.add(clonedList);
                }
            }
        } else {
            List<Integer> newList = new ArrayList<>();
            newList.add(coin);
            existing.add(newList);
        }

    }

    private static boolean isUniqueList(List<List<Integer>> existing, List<Integer> list) {
        for(List<Integer> existingList : existing) {
            Collections.sort(existingList);
            Collections.sort(list);
            if(existingList.equals(list)) {
                return false;
            }
        }
        return true;
    }

    private static List<Integer> cloneList(List<Integer> list) {
        List<Integer> clonedList = new ArrayList<>();
        clonedList.addAll(list);
        return clonedList;
    }

    public static void main(String[] args) {
        int coins[] = {};
        System.out.println(change(0, coins));
    }
}
