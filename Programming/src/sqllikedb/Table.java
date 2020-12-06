package sqllikedb;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Table {
    String tableName;
    List<String> columnList;
    Map<String, ColumnMetaData> columnMetaDataMap;
    List<String> rows;
    Table(String tableName, Map<String, ColumnMetaData> columnMetaDataMap, List<String> columnList) {
        this.tableName = tableName;
        this.columnMetaDataMap = columnMetaDataMap;
        this.columnList = columnList;
        this.rows = new ArrayList<>();
    }


}
