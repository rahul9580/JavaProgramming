package lowleveldesign.Elevator;

public interface EventListener {
    Elevator receiveDestinationFloor(Floor floor, Direction direction);
    void receiveDestinationFloor(Floor floor, Elevator elevator);
    void cancelDestinationFloor(Floor floor, Elevator elevator);

}
