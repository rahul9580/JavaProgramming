package lowleveldesign.KeyValueStore;

import java.util.ArrayList;
import java.util.List;

public class Test {

    public static void main(String[] args) {

        KeyConfigurer keyConfigurer = new KeyConfigurer();

        List<String> registerSecondaryKeys = new ArrayList<>();
        registerSecondaryKeys.add("latitude");
        registerSecondaryKeys.add("pollution_level");
        keyConfigurer.registerSecondaryKeys(registerSecondaryKeys);

        DataStoreAccessor dataStoreAccessor = new DataStoreAccessor();

        Data data = new Data();
        data.setLatitude("12.5");
        data.setLongitude("106.0");
        try {
            dataStoreAccessor.put("delhi", data);
        } catch (Exception e) {
            System.out.println("Exception occurred: " + e);
        }

        Data data2 = new Data();
        data2.setLongitude("106.0");
        data2.setPopulation(1000000);

        try {
            dataStoreAccessor.put("jakarta", data2);
        } catch (Exception e) {
            System.out.println("Exception occurred: " + e);
        }

        Object delhiCityInfo = dataStoreAccessor.get("delhi");
        System.out.println(delhiCityInfo);

        dataStoreAccessor.delete("jakarta");
    }
}
