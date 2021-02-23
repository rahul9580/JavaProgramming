package test;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

public class TimeTest {

    public static long getMinutesSinceCurrentTime(LocalDateTime localDateTime) {
        LocalDateTime currentDateTime = LocalDateTime.now();
        return  currentDateTime.until(localDateTime, ChronoUnit.MILLIS);
    }

    public static void main(String[] args) throws InterruptedException {
        LocalDateTime l = LocalDateTime.now();
        Thread.sleep(2L);
        System.out.println(getMinutesSinceCurrentTime(l));
    }
}
