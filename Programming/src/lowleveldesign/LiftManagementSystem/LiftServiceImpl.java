package lowleveldesign.LiftManagementSystem;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

public class LiftServiceImpl implements ILiftService {
    private Integer numberOfLifts;
    private Integer numberOfFloors;
    private ArrayList<Lift> lifts;
    private Queue<Task> tasks;

    public LiftServiceImpl(Integer numberOfLifts, Integer numberOfFloors) throws Exception {
        if (numberOfLifts < 0) {
            throw new Exception("NumberOfLifts must be positive.");
        }
        if (numberOfFloors < 0) {
            throw new Exception("NumberOfFloors must be positive.");
        }
        this.numberOfLifts = numberOfLifts;
        this.numberOfFloors = numberOfFloors;
        initializeLifts();
        tasks = new LinkedList<Task>();
    }

    private void initializeLifts() {
        lifts = new ArrayList<Lift>();
        for (int i = 0; i < this.numberOfLifts; i++) {
            lifts.add(new Lift(0));
        }
    }

    @Override
    public void addTask(Task task) throws Exception {
        Direction direction = Direction.NONE;
        if(task.getPickupFloorNumber() < task.getDropFloorNumber()) {
            direction = Direction.UP;
        } else if(task.getPickupFloorNumber() > task.getDropFloorNumber()) {
            direction = Direction.DOWN;
        }

        //tasks.add(task);
        int optimalLiftNumber = findOptimalLift(task);
        lifts.get(optimalLiftNumber).addDestination(task.getPickupFloorNumber());
        lifts.get(optimalLiftNumber).addDestination(task.getDropFloorNumber());
    }

    private int findOptimalLift(Task task) throws Exception {
        int optimalLiftNumber = 0;
        int minDistance = Integer.MAX_VALUE;
        for (int i = 0; i < lifts.size(); i++) {
            Lift lift = lifts.get(i);
            int distance = lift.findDistanceFrom(task.getPickupFloorNumber());
            // Taking equal i.e. to assign any random lift if No one in going in same direction or STOP
            if (distance <= minDistance) {
                minDistance = distance;
                optimalLiftNumber = i;
            }
        }

        if (minDistance == Integer.MAX_VALUE) {
            throw new Exception("No Lift available.");
        }
        return optimalLiftNumber;
    }

    @Override
    public void operate() {
        for (int i = 0; i < lifts.size(); i++) {
            Lift currLift = lifts.get(i);

            boolean open = false;

            switch (currLift.getStatus()) {
                case STOP:
                    // Do Nothing
                    //System.out.println("CLOSE");
                    break;
                case RUNNING:
                    switch (currLift.getDirection()) {
                        case UP:
                            //System.out.println("CLOSE");
                            currLift.moveUp();
                            break;
                        case DOWN:
                            //System.out.println("CLOSE");
                            currLift.moveDown();
                            break;
                        case NONE:
                            //System.out.println("OPEN");
                            open = true;
                            currLift.removeDestination();
                            break;
                    }
            }
            System.out.println("LIFT: " + i + ", FLOOR: " + currLift.getCurrentFloor() + ", STATUS: " + (open==true? "OPEN" : "CLOSE") );

        }
        System.out.println();
    }
}
