package lowleveldesign.PayLater;

import lowleveldesign.PayLater.db.PMS;
import lowleveldesign.PayLater.ims.service.IInventoryService;
import lowleveldesign.PayLater.ims.service.impl.InventoryServiceImpl;
import lowleveldesign.PayLater.oms.entity.OrderEntity;
import lowleveldesign.PayLater.oms.service.IOrderService;
import lowleveldesign.PayLater.oms.service.impl.OrderServiceImpl;
import lowleveldesign.PayLater.pms.TransactionType;
import lowleveldesign.PayLater.pms.service.IPaymentService;
import lowleveldesign.PayLater.pms.service.impl.PaymentServiceImpl;

import java.util.List;

/*
* Problem Definition:
To make life easier for our customers, we want to introduce a feature of Buy Now Pay Later (BNPL), where a customer can buy the product instantly and pay the dues within 30 days as per his convenience. Can you help us prototype this concept?

Write an application that does the following:
seed_inventory: The application should read from a FILE/STDIN/DRIVER and add products to inventory with relevant attributes and store them in memory.
buy: As a customer, you should be able to buy the products available in the inventory.
payment: Once you click on buy a product, the application should ask for payment. Payment can be of 2 types:
PREPAID: The order gets placed and added to order history and inventory gets reduced.
BNPL: The order gets placed, the BNPL credit limit decreases, the order gets added to customer order history and inventory gets reduced. If the credit limit is exhausted, he should not see this option.
clear_dues: A user at any time can choose to pay the dues (partial or complete) pending on him.
status: At any point, a view of inventory and order history should be available to view.
blacklisting [BONUS]: If a customer defaults payment for 3 orders, he should be blacklisted and he won’t be able to place new orders using BNPL.

Note: We expect you to store all data in memory. Usage of the database to store the contents is not allowed.
Expectations:
Create the sample data yourself. You can put it into a file, test case or main driver program itself or use STDIN. You should be able to modify the test cases when asked.
Code should be demoable. Either by using the main driver program or test cases.
Code should be modular. Code should have the basic OO design.
Code should be extensible. Wherever applicable, user interfaces and contracts between different methods. It should be easy to add/remove functionality without re-writing the entire codebase.
Code should handle edge cases properly and fail gracefully.
Code should be legible, readable and DRY.
You can choose to show the final output on STDOUT or write to a file.

Guidelines:


Make sure you get any clarification you need before starting the implementation.
Please discuss the solution with an interviewer.
Please do not access internet for anything EXCEPT syntax
You are free to use the language of your choice
All work should be your own
*/
public class Driver {

    public static void main(String[] args) {
        PMS.configStore.put("MAX_DUE", "5000");

        IInventoryService inventoryService = new InventoryServiceImpl();
        IOrderService orderService = new OrderServiceImpl();
        IPaymentService paymentService = new PaymentServiceImpl();

        inventoryService.addInventory("tshirt", 10, 1500);
        inventoryService.addInventory("jeans", 5, 2000);

        String userId = "rahul";
        List<TransactionType> avPayModes = paymentService.getPaymentModeForUSer(userId, 1500);
        for(TransactionType transactionType : avPayModes) {
            System.out.println(transactionType);
        }
        orderService.placeOrder(userId, "tshirt", 4, TransactionType.BNPL);

        List<OrderEntity> orders = orderService.getOrderByUserId(userId);
        for(OrderEntity orderEntity : orders) {
            System.out.println(orderEntity);
        }
    }
}
