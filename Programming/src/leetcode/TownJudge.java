package leetcode;

public class TownJudge {

    public static int findTownJudge(int N, int[][] trust) {

        boolean hash[] = new boolean[N+1];
        for(int i = 0; i < trust.length; i++) {
            hash[trust[i][0]] = true;
        }

        int judgeCandidate = -1;
        for(int i = 1; i <= N; i++) {
            if(!hash[i]) {
                judgeCandidate = i;
            }
        }

        if (judgeCandidate == -1) return -1;

        for(int i = 1; i <= N; i++) {
            hash[i] = false;
        }

        for(int i = 0; i < trust.length; i++) {
            if(trust[i][1] == judgeCandidate) {
                hash[trust[i][0]] = true;
            }
        }
        hash[judgeCandidate] = true;

        for(int i = 1; i <= N; i++) {
            if(!hash[i]) return -1;
        }

        return judgeCandidate;
    }

    public static void main(String[] args) {
        int trust[][] = {{1,2}, {2,3}};
        System.out.println(findTownJudge(2, trust));
    }
}
