package lowleveldesign.sqllikedb;

public class DDLServiceImpl implements IDDLService {

    @Override
    public void createTable(Table table) {

        DataBase dataBase = DataBase.getInstance();
        dataBase.addTable(table);
    }
}
