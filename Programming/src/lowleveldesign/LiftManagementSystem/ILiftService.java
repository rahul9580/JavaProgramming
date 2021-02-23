package lowleveldesign.LiftManagementSystem;

public interface ILiftService {
    void addTask(Task task) throws Exception;

    void operate();
}
