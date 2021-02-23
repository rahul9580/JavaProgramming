package lowleveldesign.KeyValueStore;

import java.util.List;
import java.util.TreeMap;

public class KeyConfigurer {

    public void registerSecondaryKeys(List<String> attributes) {
        DataStore.secondaryKeys = attributes;
        for(String attribute : attributes) {
            TreeMap<Object, Object> secStore = new TreeMap<>();
            DataStore.secondaryStores.put(attribute, secStore);
        }
    }
}
