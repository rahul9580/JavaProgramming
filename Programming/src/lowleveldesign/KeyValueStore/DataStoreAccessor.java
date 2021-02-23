package lowleveldesign.KeyValueStore;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

public class DataStoreAccessor {

    public void put(String key, Object value) throws Exception {
        Field[] fields = Object.class.getDeclaredFields();

        //ObjectMapper oMapper = new ObjectMapper();
        //Map<String, Object> data = oMapper.convertValue(obj, Map.class);
        Map<String, Object> data = new HashMap<>();

        for(Map.Entry entry : data.entrySet()) {
            if(DataStore.metadata.containsKey(entry.getKey())) {
                DataType dataType = DataStore.metadata.get(entry.getKey());
                DataValidator.validateData(dataType, entry.getValue());
            } else {
                DataType dataType = DataTypeEvaluator.evaluateDataType(entry.getValue());
                if(dataType == DataType.NAN) {
                    throw new Exception("Unsupported data exception");
                }
                DataStore.metadata.put(entry.getKey().toString(), dataType);
            }

            // Update secondary data - here lets put primary key as value to avoid data redundancy
            if(DataStore.secondaryStores.containsKey(entry.getKey().toString())) {
                TreeMap<Object, Object> secStore = DataStore.secondaryStores.get(entry.getKey().toString());
                secStore.put(entry.getValue(), key);
                DataStore.secondaryStores.put(entry.getKey().toString(), secStore);
            }
        }

        // Put data in primary store
        DataStore.primaryStore.put(key, value.toString());
    }

    // Get based of primary key
    public Object get(String key) {
        return DataStore.primaryStore.get(key);
    }

    // Delete record
    public void delete(String key) {
        // if not contains key do nothing
        if(DataStore.primaryStore.containsKey(key)) {
            Object value = DataStore.primaryStore.remove(key);
            //ObjectMapper oMapper = new ObjectMapper();
            //Map<String, Object> data = oMapper.convertValue(value, Map.class);
            Map<String, Object> data = new HashMap<>();

            // Update secondary keys storage
            for(Map.Entry entry : data.entrySet()) {
                if(DataStore.secondaryStores.containsKey(entry.getKey().toString())) {
                    TreeMap<Object, Object> secStore = DataStore.secondaryStores.get(entry.getKey().toString());
                    secStore.remove(entry.getValue());
                    DataStore.secondaryStores.put(entry.getKey().toString(), secStore);
                }
            }

        }
    }

    // TODO - write get based on sec keys
}
