package test;

import java.util.concurrent.ExecutorService;

class Solution {
    public static void main(String[] args) {
        long sum = 0;
        long start=System.currentTimeMillis();
        for(int i = 1;i<= 1000_000_000;i++){
            sum+=i;
        }
        System.out.println(sum);
        System.out.println(System.currentTimeMillis()-start);
    }
}