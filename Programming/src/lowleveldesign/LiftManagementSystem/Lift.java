package lowleveldesign.LiftManagementSystem;

import java.util.LinkedList;
import java.util.Queue;

public class Lift {

    private Integer currentFloor;
    private Queue<Integer> destinationFloors;

    public Lift(Integer currentFloor) {
        this.currentFloor = currentFloor;
        this.destinationFloors = new LinkedList<>();
    }

    public void moveUp() {
        currentFloor++;
    }

    public void moveDown() {
        currentFloor--;
    }

    public void addDestination(Integer destination) {
        switch (this.getDirection()) {
            case UP:
                if (currentFloor < destination) {
                    Queue tempQueue = new LinkedList();
                    while (destinationFloors.peek() < destination) {
                        tempQueue.add(destinationFloors.remove());
                    }
                    tempQueue.add(destination);
                    while (!destinationFloors.isEmpty()) {
                        tempQueue.add(destinationFloors.remove());
                    }
                    destinationFloors = tempQueue;
                } else {
                    destinationFloors.add(destination);
                }
                break;
            case DOWN:
                if (currentFloor > destination) {
                    Queue tempQueue = new LinkedList();
                    while (destinationFloors.peek() > destination) {
                        tempQueue.add(destinationFloors.remove());
                    }
                    tempQueue.add(destination);
                    while (!destinationFloors.isEmpty()) {
                        tempQueue.add(destinationFloors.remove());
                    }
                    destinationFloors = tempQueue;
                } else {
                    destinationFloors.add(destination);
                }
                break;
            case NONE:
                destinationFloors.add(destination);
                break;
        }
    }

    public void removeDestination() {
        this.destinationFloors.remove();
    }

    public Direction getDirection() {
        if (destinationFloors.size() > 0) {
            if (currentFloor < destinationFloors.peek()) {
                return Direction.UP;
            } else if (currentFloor > destinationFloors.peek()) {
                return Direction.DOWN;
            }
        }
        return Direction.NONE;
    }

    public Status getStatus() {
        return (destinationFloors.size() > 0) ? Status.RUNNING : Status.STOP;
    }

    public int findDistanceFrom(int floorNumber) {
        int distance = 0;
        Direction direction = getDirection();
        switch (direction) {
            case UP:
                if (currentFloor < floorNumber) {
                    distance = Math.abs(currentFloor - floorNumber);
                } else {
                    distance = Integer.MAX_VALUE;
                }
                break;
            case DOWN:
                if (currentFloor > floorNumber) {
                    distance = Math.abs(currentFloor - floorNumber);
                } else {
                    distance = Integer.MAX_VALUE;
                }
                break;
            case NONE:
                distance = Math.abs(currentFloor - floorNumber);
                break;
        }

        return distance;
    }

    public Integer getCurrentFloor() {
        return currentFloor;
    }

    public Queue<Integer> getDestinationFloors() {
        return destinationFloors;
    }
}
