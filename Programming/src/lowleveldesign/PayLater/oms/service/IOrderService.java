package lowleveldesign.PayLater.oms.service;

import lowleveldesign.PayLater.oms.entity.OrderEntity;
import lowleveldesign.PayLater.pms.TransactionType;

import java.util.List;

public interface IOrderService {
    void placeOrder(String userId, String productId, int quantity, TransactionType transactionType);
    List<OrderEntity> getOrderByUserId(String userId);
    OrderEntity getOrderByOrderId(String orderId);
    List<OrderEntity> getUnpaidOrderByUserId(String userId);
}
