package lowleveldesign.Elevator;

public class EventListenerImpl implements EventListener {
    @Override
    public Elevator receiveDestinationFloor(Floor floor, Direction direction) {
        /*MAx 10
        E1 - 2(Up), E2 - 4(up), E3 - 8(Down)

                F1 + Up*/


        return null;
    }



    @Override
    public void receiveDestinationFloor(Floor floor, Elevator elevator) {

    }

    @Override
    public void cancelDestinationFloor(Floor floor, Elevator elevator) {

    }
}
