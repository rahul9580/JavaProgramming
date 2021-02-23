package lowleveldesign.PayLater.db;

import lowleveldesign.PayLater.oms.entity.OrderEntity;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class OMS {
    public static Map<String, OrderEntity> orderIdToOrder = new ConcurrentHashMap<>();
    public static Map<String, List<OrderEntity>> userIdIdToOrders = new ConcurrentHashMap<>();
}
