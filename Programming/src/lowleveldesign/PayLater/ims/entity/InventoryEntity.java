package lowleveldesign.PayLater.ims.entity;

public class InventoryEntity {
    private String productId;
    private double unitPrice;
    private int inventoryCount;

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public void setInventoryCount(int inventoryCount) {
        this.inventoryCount = inventoryCount;
    }

    public String getProductId() {
        return productId;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public int getInventoryCount() {
        return inventoryCount;
    }
}
