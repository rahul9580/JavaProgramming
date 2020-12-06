package sqllikedb;

import java.util.ArrayList;
import java.util.List;

public class Test {

    public static void main(String[] args) {

        DDLServiceImpl ddlService = new DDLServiceImpl();

        Column column1 = new Column();
        IntRangeConstraint intRangeConstraint = new IntRangeConstraint();
        intRangeConstraint.setMinValue(20);
        intRangeConstraint.setMaxValue(30);
        List<ColumnConstraint> columnConstraintList = new ArrayList<>();
        //columnConstraintList.add(intRangeConstraint);
        ColumnMetaData columnMetaData = new ColumnMetaData(DataType.INT, false, columnConstraintList);
        column1.setColumnName("id");
        column1.setColumnMetaData(columnMetaData);
        List<Column> columns = new ArrayList<>();
        columns.add(column1);

        Column column2 = new Column();
        StringMaxLengthConstraint stringMaxLengthConstraint = new StringMaxLengthConstraint();
        stringMaxLengthConstraint.setMaxLen(5);
        List<ColumnConstraint> columnConstraintList2 = new ArrayList<>();
        columnConstraintList2.add(stringMaxLengthConstraint);
        ColumnMetaData columnMetaData2 = new ColumnMetaData(DataType.STRING, false, columnConstraintList2);
        column2.setColumnName("name");
        column2.setColumnMetaData(columnMetaData2);
        columns.add(column2);


        TableBuilder tableBuilder = new TableBuilder();
        Table table = tableBuilder.withTableName("Student").withColumns(columns).build();

        ddlService.createTable(table);


        DMLService dmlService = new DMLServiceImpl();
        dmlService.insert("Student", "21-rahul");
        dmlService.insert("Student", "45-rahul");
        dmlService.insert("Student", "23-rahul1");

        List<String> rows =  dmlService.selectAllRows("Student");
        for(String row : rows) {
            System.out.println(row);
        }

    }
}
