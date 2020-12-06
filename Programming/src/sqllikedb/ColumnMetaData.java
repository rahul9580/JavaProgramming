package sqllikedb;

import java.util.List;

public class ColumnMetaData {
    DataType dataType;
    boolean isNullable;
    List<ColumnConstraint> columnConstraints;
    ColumnMetaData(DataType dataType, boolean isNullable, List<ColumnConstraint> columnConstraints) {
        this.dataType = dataType;
        this.isNullable = isNullable;
        this.columnConstraints = columnConstraints;
    }
}
