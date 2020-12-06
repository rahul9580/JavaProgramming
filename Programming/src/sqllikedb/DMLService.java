package sqllikedb;

import java.util.List;

public interface DMLService {

    int insert(String tableName, String data);

    List<String> selectAllRows(String tableName);
}
