package lowleveldesign.PayLater.oms.entity;

import java.util.Map;

public class OrderEntity {
    private String orderId;
    private String useId;
    private String productId;
    private double orderAmount;
    private Map<String, String> metadata;

    public String getOrderId() {
        return orderId;
    }

    public String getUseId() {
        return useId;
    }

    public String getProductId() {
        return productId;
    }

    public double getOrderAmount() {
        return orderAmount;
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

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public void setOrderAmount(double orderAmount) {
        this.orderAmount = orderAmount;
    }

    public void setMetadata(Map<String, String> metadata) {
        this.metadata = metadata;
    }

    @Override
    public String toString() {
        return "OrderEntity{" +
                "orderId='" + orderId + '\'' +
                ", useId='" + useId + '\'' +
                ", productId='" + productId + '\'' +
                ", orderAmount=" + orderAmount +
                ", metadata=" + metadata +
                '}';
    }
}
