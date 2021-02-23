package lowleveldesign.PayLater.ims.service.impl;

import lowleveldesign.PayLater.db.IMS;
import lowleveldesign.PayLater.ims.entity.InventoryEntity;
import lowleveldesign.PayLater.ims.service.IInventoryService;

public class InventoryServiceImpl implements IInventoryService {

    @Override
    public void addInventory(String productId, int noOfProducts, double price) {
        InventoryEntity inventoryEntity = null;
        if(IMS.productIdToInventory.containsKey(productId)) {
            inventoryEntity = IMS.productIdToInventory.get(productId);
            inventoryEntity.setInventoryCount(inventoryEntity.getInventoryCount() + noOfProducts);
            inventoryEntity.setUnitPrice(price);
        } else {
            inventoryEntity = new InventoryEntity();
            inventoryEntity.setProductId(productId);
            inventoryEntity.setInventoryCount(noOfProducts);
            inventoryEntity.setUnitPrice(price);
            IMS.productIdToInventory.put(productId, inventoryEntity);
        }
    }

    @Override
    public void removeInventory(String productId, int noOfProducts) {
        if(!IMS.productIdToInventory.containsKey(productId)) {
            // Throw IllegalOperationException
        } else {
            InventoryEntity inventoryEntity = IMS.productIdToInventory.get(productId);
            inventoryEntity.setInventoryCount(inventoryEntity.getInventoryCount() - noOfProducts);
        }
    }
}
