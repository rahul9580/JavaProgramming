package lowleveldesign.KeyValueStore;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class DataStore {

    static List<String> secondaryKeys;

    static Map<String, DataType> metadata = new HashMap<>();

    static Map<String, String> primaryStore = new HashMap<>();

    static Map<String, TreeMap<Object, Object>> secondaryStores = new HashMap<>();

}
