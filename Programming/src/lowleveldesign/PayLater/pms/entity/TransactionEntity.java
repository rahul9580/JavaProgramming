package lowleveldesign.PayLater.pms.entity;

import lowleveldesign.PayLater.pms.TransactionType;
import lowleveldesign.PayLater.pms.TxnStatus;

import java.util.Map;

public class TransactionEntity {
    private String orderId;
    private String useId;
    private double transactionAmount;
    private TransactionType transactionType;
    private TxnStatus txnStatus;
    private Map<String, String> metadata;

    public String getOrderId() {
        return orderId;
    }

    public String getUseId() {
        return useId;
    }

    public double getTransactionAmount() {
        return transactionAmount;
    }

    public TransactionType getTransactionType() {
        return transactionType;
    }

    public TxnStatus getTxnStatus() {
        return txnStatus;
    }

    public Map<String, String> getMetadata() {
        return metadata;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public void setUseId(String useId) {
        this.useId = useId;
    }

    public void setTransactionAmount(double transactionAmount) {
        this.transactionAmount = transactionAmount;
    }

    public void setTransactionType(TransactionType transactionType) {
        this.transactionType = transactionType;
    }

    public void setTxnStatus(TxnStatus txnStatus) {
        this.txnStatus = txnStatus;
    }

    public void setMetadata(Map<String, String> metadata) {
        this.metadata = metadata;
    }
}
