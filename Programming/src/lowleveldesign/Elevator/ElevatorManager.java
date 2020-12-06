package lowleveldesign.Elevator;

import java.util.List;

public class ElevatorManager {
    List<Elevator> elevatorList;

    void registerElevator(Elevator elevator) {

    }

    int calculateDistance(Floor floor, Elevator elevator) {
        if(elevator.currentFloorNo == floor.floorNo) {
            return 0;
        } else if (elevator.currentFloorNo < floor.floorNo){
            if(elevator.direction == Direction.DOWN) {
                return Integer.MAX_VALUE;
            } else {
                return Math.abs(elevator.currentFloorNo - floor.floorNo);
            }
        }

        return 1;


    }


}
