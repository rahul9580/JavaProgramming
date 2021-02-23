package lowleveldesign.LiftManagementSystem;

public class MainDriver {

    public static void main(String[] args) throws Exception {
        ILiftService liftService = new LiftServiceImpl(2, 10);

        Task task1 = new Task();
        task1.setPickupFloorNumber(0);
        task1.setDropFloorNumber(7);
        liftService.addTask(task1);

        int time = 0;
        while (time < 10) {
            liftService.operate();
            time++;
        }

        System.out.println("=======");

        Task task2 = new Task();
        task2.setPickupFloorNumber(3);
        task2.setDropFloorNumber(0);
        liftService.addTask(task2);

        Task task3 = new Task();
        task3.setPickupFloorNumber(2);
        task3.setDropFloorNumber(0);
        liftService.addTask(task3);

        time = 0;
        while (time < 10) {
            liftService.operate();
            time++;
        }
    }
}
