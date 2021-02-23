package lowleveldesign.sqllikedb;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DataBase {
    List<Table> tables = new ArrayList<>();
    Map<String, Table> tableMap = new HashMap<>();

    void addTable(Table table) {
        tables.add(table);
        tableMap.put(table.tableName, table);
    }

    private DataBase(){}
    private static DataBase dataBase;
    public static DataBase getInstance() {
        if(dataBase == null) {
            dataBase = new DataBase();
        }

        return dataBase;
    }

    public List<Table> getTables() {
        return tables;
    }

    public Map<String, Table> getTableMap() {
        return tableMap;
    }
}
