package lowleveldesign.PayLater.pms.service.impl;

import lowleveldesign.PayLater.db.PMS;
import lowleveldesign.PayLater.oms.entity.OrderEntity;
import lowleveldesign.PayLater.oms.service.IOrderService;
import lowleveldesign.PayLater.oms.service.impl.OrderServiceImpl;
import lowleveldesign.PayLater.pms.entity.TransactionEntity;
import lowleveldesign.PayLater.pms.TransactionType;
import lowleveldesign.PayLater.pms.TxnStatus;
import lowleveldesign.PayLater.pms.service.IPaymentService;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class PaymentServiceImpl implements IPaymentService {

    private IOrderService orderService = new OrderServiceImpl();

    @Override
    public void makePayment(String userId, OrderEntity orderEntity, TransactionType transactionType) {
        TransactionEntity transactionEntity = PMS.orderIdToTransactions.get(orderEntity.getOrderId());
        if(Objects.nonNull(transactionEntity)) {
            transactionEntity.setTxnStatus(TxnStatus.PAID);
        } else {
            transactionEntity = new TransactionEntity();
            transactionEntity.setOrderId(orderEntity.getOrderId());
            transactionEntity.setTransactionType(transactionType);
            transactionEntity.setTransactionAmount(orderEntity.getOrderAmount());
            if(TransactionType.BNPL == transactionType) {
                transactionEntity.setTxnStatus(TxnStatus.PENDING);
            } else {
                transactionEntity.setTxnStatus(TxnStatus.PAID);
            }
        }
        PMS.orderIdToTransactions.put(orderEntity.getOrderId(), transactionEntity);
    }

    @Override
    public List<TransactionType> getPaymentModeForUSer(String userId, double thisTxnAmount) {
        double maxDueAllowed = Double.valueOf(PMS.configStore.get("MAX_DUE"));
        List<TransactionType> paymentModeForUSer = new ArrayList<>();
        paymentModeForUSer.add(TransactionType.PREPAID);

        List<OrderEntity> userUnpaidOrders = orderService.getUnpaidOrderByUserId(userId);
        if(userUnpaidOrders == null || userUnpaidOrders.size() == 0) {
            if(thisTxnAmount <= maxDueAllowed) {
                paymentModeForUSer.add(TransactionType.BNPL);
            }
        } else {
            double totalAmountToBePaid = 0l;
            for(OrderEntity orderEntity : userUnpaidOrders) {
                totalAmountToBePaid+=orderEntity.getOrderAmount();
            }
            if(totalAmountToBePaid + thisTxnAmount <= maxDueAllowed) {
                paymentModeForUSer.add(TransactionType.BNPL);
            }
        }

        return paymentModeForUSer;
    }


}
