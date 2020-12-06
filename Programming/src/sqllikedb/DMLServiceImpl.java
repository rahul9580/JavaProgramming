package sqllikedb;

import java.util.List;

public class DMLServiceImpl implements DMLService {


    @Override
    public int insert(String tableName, String data) {
        DataBase dataBase = DataBase.getInstance();
        Table table = dataBase.getTableMap().get(tableName);
        List<String> columnList = table.columnList;

        String columnsValue[] = data.split("-");

        boolean valid = true;
        for(int i = 0; i < columnsValue.length; i++) {
            String columnName = columnList.get(i);
            ColumnMetaData columnMetaData = table.columnMetaDataMap.get(columnName);
            List<ColumnConstraint> columnConstraints = columnMetaData.columnConstraints;


            for(ColumnConstraint columnConstraint : columnConstraints) {
                if(!columnConstraint.validate(columnsValue[i])) {
                    valid = false;
                }
            }


        }
        if(valid) {
            table.rows.add(data);
            return 1;
        }

        return 0;
    }

    @Override
    public List<String> selectAllRows(String tableName) {
        DataBase dataBase = DataBase.getInstance();
        Table table = dataBase.getTableMap().get(tableName);
        return table.rows;
    }
}
