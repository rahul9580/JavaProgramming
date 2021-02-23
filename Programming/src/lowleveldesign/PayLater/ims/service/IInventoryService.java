package lowleveldesign.PayLater.ims.service;

public interface IInventoryService {
    void addInventory(String productId, int noOfProducts, double price);
    void removeInventory(String productId, int noOfProducts);
}
