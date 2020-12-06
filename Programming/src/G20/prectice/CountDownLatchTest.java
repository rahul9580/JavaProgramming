package G20.prectice;

import java.util.concurrent.CountDownLatch;

public class CountDownLatchTest {

    public static void main(String[] args) throws InterruptedException {

        CountDownLatch latch = new CountDownLatch(0);
        ((Runnable) () -> {
            latch.countDown();
            latch.countDown();
            latch.countDown();
            System.out.println("Inside thread run...");
            System.out.println(latch.getCount());
        }).run();

        System.out.println("Start await...");
        latch.await();
        System.out.println("Over await...");
    }
}
