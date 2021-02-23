package lowleveldesign.sqllikedb;

public class IntMultipleOfConstraint implements ColumnConstraint {
    int maxValue;
    int minValue;

    @Override
    public boolean validate(String columnValue) {
        return false;
    }
}
