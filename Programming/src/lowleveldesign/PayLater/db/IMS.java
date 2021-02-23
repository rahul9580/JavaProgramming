package lowleveldesign.PayLater.db;

import lowleveldesign.PayLater.ims.entity.InventoryEntity;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class IMS {
    public static Map<String, InventoryEntity> productIdToInventory = new ConcurrentHashMap<>();
}
