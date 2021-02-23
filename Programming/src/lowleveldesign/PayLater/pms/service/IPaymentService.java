package lowleveldesign.PayLater.pms.service;

import lowleveldesign.PayLater.oms.entity.OrderEntity;
import lowleveldesign.PayLater.pms.TransactionType;

import java.util.List;

public interface IPaymentService {
    void makePayment(String userId, OrderEntity orderEntity, TransactionType transactionType);
    List<TransactionType> getPaymentModeForUSer(String userId, double thisTxnAmount);
}
