package lowleveldesign.PayLater.oms.service.impl;

import lowleveldesign.PayLater.db.IMS;
import lowleveldesign.PayLater.db.OMS;
import lowleveldesign.PayLater.db.PMS;
import lowleveldesign.PayLater.ims.entity.InventoryEntity;
import lowleveldesign.PayLater.oms.entity.OrderEntity;
import lowleveldesign.PayLater.oms.service.IOrderService;
import lowleveldesign.PayLater.pms.entity.TransactionEntity;
import lowleveldesign.PayLater.pms.TransactionType;
import lowleveldesign.PayLater.pms.TxnStatus;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

public class OrderServiceImpl implements IOrderService {

    //private IPaymentService paymentService = new PaymentServiceImpl();

    @Override
    public void placeOrder(String userId, String productId, int quantity, TransactionType transactionType) {
        String orderId = UUID.randomUUID().toString();
        OrderEntity orderEntity = new OrderEntity();
        orderEntity.setOrderId(orderId);
        orderEntity.setUseId(userId);
        orderEntity.setProductId(productId);

        InventoryEntity inventoryEntity = IMS.productIdToInventory.get(productId);
        if(Objects.isNull(inventoryEntity) || inventoryEntity.getInventoryCount() < quantity) {
            //Exception
        } else {
            orderEntity.setOrderAmount(inventoryEntity.getUnitPrice()*quantity);
        }

        OMS.orderIdToOrder.put(orderId, orderEntity);
        List<OrderEntity> userOrders = OMS.userIdIdToOrders.get(userId);
        if(userOrders == null || userOrders.size() == 0) {
            userOrders = new ArrayList<>();
        }
        userOrders.add(orderEntity);
        OMS.userIdIdToOrders.put(userId, userOrders);

        //paymentService.makePayment(userId, orderEntity, transactionType);
    }

    @Override
    public List<OrderEntity> getOrderByUserId(String userId) {
        return OMS.userIdIdToOrders.get(userId);
    }

    @Override
    public OrderEntity getOrderByOrderId(String orderId) {
        return OMS.orderIdToOrder.get(orderId);
    }

    @Override
    public List<OrderEntity> getUnpaidOrderByUserId(String userId) {
        List<OrderEntity> unpaidOrders = new ArrayList<>();
        List<OrderEntity> userOrders = OMS.userIdIdToOrders.get(userId);
        if(null == userOrders) {
            return unpaidOrders;
        }
        for(OrderEntity orderEntity : userOrders) {
            TransactionEntity transactionEntity = PMS.orderIdToTransactions.get(orderEntity.getOrderId());
            if(transactionEntity.getTransactionType() == TransactionType.BNPL && transactionEntity.getTxnStatus() == TxnStatus.PENDING) {
                unpaidOrders.add(orderEntity);
            }
        }
        return unpaidOrders;
    }
}
