package lowleveldesign.sqllikedb;

public interface ColumnConstraint {
    boolean validate(String columnValue);
}
