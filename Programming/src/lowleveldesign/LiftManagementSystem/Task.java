package lowleveldesign.LiftManagementSystem;

public class Task {
    private int pickupFloorNumber;
    private int dropFloorNumber;

    public void setPickupFloorNumber(int pickupFloorNumber) {
        this.pickupFloorNumber = pickupFloorNumber;
    }

    public void setDropFloorNumber(int dropFloorNumber) {
        this.dropFloorNumber = dropFloorNumber;
    }

    public int getPickupFloorNumber() {
        return pickupFloorNumber;
    }

    public int getDropFloorNumber() {
        return dropFloorNumber;
    }
}
