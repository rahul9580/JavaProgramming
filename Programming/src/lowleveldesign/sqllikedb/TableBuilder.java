package lowleveldesign.sqllikedb;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TableBuilder {
    String tableName;
    List<Column> columns;

    TableBuilder withColumns(List<Column> columns) {
        this.columns = columns;
        return this;
    }

    TableBuilder withTableName(String tableName) {
        this.tableName = tableName;
        return this;
    }

    Table build() {
        Map<String, ColumnMetaData> table = new HashMap<>();
        List<String> columnList = new ArrayList<>();
        for(Column column : columns) {
            table.put(column.columnName, column.columnMetaData);
            columnList.add(column.columnName);
        }
        return new Table(tableName, table, columnList);
    }
}
