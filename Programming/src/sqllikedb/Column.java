package sqllikedb;

public class Column {
    String columnName;
    ColumnMetaData columnMetaData;

    public String getColumnName() {
        return columnName;
    }

    public ColumnMetaData getColumnMetaData() {
        return columnMetaData;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public void setColumnMetaData(ColumnMetaData columnMetaData) {
        this.columnMetaData = columnMetaData;
    }
}
