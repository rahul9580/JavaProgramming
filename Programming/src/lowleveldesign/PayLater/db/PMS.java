package lowleveldesign.PayLater.db;

import lowleveldesign.PayLater.pms.entity.TransactionEntity;

import java.util.HashMap;
import java.util.Map;

public class PMS {
    public static Map<String, TransactionEntity> orderIdToTransactions = new HashMap<>();
    public static Map<String, String> configStore = new HashMap<>();
}
