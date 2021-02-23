package test;

public class CircuitBreaker {

    static boolean circuitClosed = true;

    Thread t = new Thread() {

        /**
         * When an object implementing interface <code>Runnable</code> is used
         * to create a thread, starting the thread causes the object's
         * <code>run</code> method to be called in that separately executing
         * thread.
         * <p>
         * The general contract of the method <code>run</code> is that it may
         * take any action whatsoever.
         *
         * @see Thread#run()
         */
        @Override
        public void run() {

            int localFailCount = 0;
            while(true) {
                if(!circuitClosed) {
                    boolean apiResponse = api();
                    if(apiResponse) {
                        circuitClosed = true;
                    }
                }
                try {
                    Thread.sleep(60000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }

        }


    };


    Object lock = new Object();

    static final int MAX_FAIL_COUNT = 10;
    public static void main(String[] args) {

        int localFailCount = 0;
        while(true) {
            if(circuitClosed) {
                boolean apiResponse = api();
                if(apiResponse) {
                    localFailCount = 0;
                } else {
                    localFailCount++;
                }
                if(localFailCount == MAX_FAIL_COUNT) {
                    circuitClosed = false;
                }
            }
        }


    }

    static Boolean api() {
        // Assuming true success and false as failed
        return true;
    }


}
